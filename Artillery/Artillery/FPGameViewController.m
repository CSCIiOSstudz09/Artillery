//
//  FPGameViewController.m
//  TanksV1
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FPGameViewController.h"
#import "ShellView.h"

@implementation FPGameViewController


@synthesize angleDisplay;
@synthesize velocityDisplay;
@synthesize victoryMessage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



//Handling Touches

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for( UITouch *touch in touches )
    {
        CGPoint location = [touch locationInView:self.view];
        
        initialFirePoint = location;
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    
    for( UITouch *touch in touches )
    {
        CGPoint location = [touch locationInView:self.view];
        
        finalFirePoint = location;
    }
    
    self.angleDisplay.text = [ShellView calcShotAngleFrom:initialFirePoint to:finalFirePoint];
    self.velocityDisplay.text = [ShellView calcShotMagnitudeFrom: initialFirePoint to: finalFirePoint];
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for( UITouch *touch in touches )
    {
        CGPoint location = [touch locationInView:self.view];
        
        finalFirePoint = location;
        
    }
    
    //FireTheTank
    currentTankTurn = [tankQueue dequeue];
    
    [currentTankTurn.tank fireShell];
    [tankQueue enqueue: currentTankTurn];
    //[UIView setAnimationDidStopSelector:@selector(cpuCheckAndFire)];
    //[self cpuCheckAndFire];
    
    [self performSelector:@selector(cpuCheckAndFire)withObject:nil afterDelay:1.5];
}



//Implementing Tank Methods
//Shell Movement
-(void) updateCoords: (ShellView *) shell
{
    [UIView animateWithDuration:.02 animations: ^{
        
        CGPoint nextPosition = [shell shellTrajNextPoint];
        shell.center = CGPointMake(shell.frame.origin.x + nextPosition.x + shell.frame.size.width/2, shell.frame.origin.y + nextPosition.y + shell.frame.size.height/2);
        
    }];
    
    
    if(![self shellHitSomething:shell])
    {    
        [self performSelector: @selector(updateCoords:) withObject:shell afterDelay: .02 ];
    }
}


//Implementing Tank Methods
-(void) fireShell
{
    CGRect tankRect = currentTankTurn.frame;
    ShellView *shellView = [[ShellView alloc] initWithFrame:CGRectMake(tankRect.origin.x + (tankRect.size.width/2),tankRect.origin.y,10,10)];
    [self.view addSubview: shellView];
    
    //Calculate Shot Magnitude
    [shellView calcShotVelocityFrom:initialFirePoint to:finalFirePoint];
    [self updateCoords:shellView];
}

-(void) cpuFireShell
{
    CGRect tankRect = currentTankTurn.frame;
    ShellView *shellView = [[ShellView alloc] initWithFrame:CGRectMake(tankRect.origin.x + (tankRect.size.width/2),tankRect.origin.y,10,10)];
    [self.view addSubview: shellView];
    
    //Fire At Tank
    CGPoint enemyTankPosition = [[tankQueue peek] center];
    
    //Calculate Shot Magnitude
    CPUTank *cpuTank = (CPUTank*)(currentTankTurn.tank);
    NSInteger difficulty = cpuTank.difficulty;
    [shellView cpuSetVelocityAndAngleAtTank: enemyTankPosition withDifficulty: difficulty];
    [self updateCoords:shellView];
}

-(BOOL) shellHitSomething: (ShellView *) shell
{
    CGRect shellPosition = shell.frame;
    
    CGPoint shellCenter = CGPointMake(shellPosition.origin.x + shellPosition.size.width, shellPosition.origin.y + shellPosition.size.height);
    
    if(!CGRectIntersectsRect(self.view.frame, shellPosition))
    {
        [self performSelector:@selector(removeShellView:) withObject:shell afterDelay:.5];
        return true;
    }
    
    else if(CGRectIntersectsRect(groundView.frame, shellPosition))
    {
        
        [self performSelector:@selector(removeShellView:) withObject:shell afterDelay:.5];
        return true;
    }
    else
    {        
        TankView *view;
        
        for(NSInteger i = 0; i < [tankQueue count]; i++)
        {
            view = [tankQueue objectAtIndex:i];
            
            CGPoint convertedPoint = [view convertPoint:shellCenter fromView:self.view];
            
            if([view.tankPath containsPoint:convertedPoint])
            {
                NSLog(@"TankHealth: %i", view.tank.tankHealth);
                if(view.tank.tankHealth > 0)
                {
                    view.tank.tankHealth = view.tank.tankHealth - 1;   
                }
                else
                {
                    [view animateTankViewDestroyed];
                    [tankQueue removeObject:view];
                    [self checkEndGame];
                }
                
                [shell performSelector:@selector(animateShellViewHit) withObject:nil afterDelay:.01];
                return true;
            }
        }
    }
    return false;
}

-(void) cpuCheckAndFire
{
    
    if([[[tankQueue peek] tank] isKindOfClass:[CPUTank class]])
    {        
        currentTankTurn = [tankQueue dequeue];
        [currentTankTurn.tank fireShell];
        [tankQueue enqueue: currentTankTurn];
    }
}

-(void) removeShellView:(ShellView *)shell
{
    [shell removeFromSuperview];
}

-(void) checkEndGame
{
    if([tankQueue count] == 1)
    {
        NSString *message = [NSString stringWithFormat:@"Player %i Wins!!!", currentTankTurn.playerNumber];
        self.victoryMessage.text = message;
        currentTankTurn = nil;
        tankQueue = nil;
    }
}
@end
