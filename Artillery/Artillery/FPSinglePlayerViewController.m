//
//  FPSinglePlayerViewController.m
//  FinalProject3
//
//  Created by Joe Studniarz on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FPSinglePlayerViewController.h"

@interface FPSinglePlayerViewController ()

@end

@implementation FPSinglePlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        [self doLayout];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self doLayout];

}

-(void) doLayout
{
    //CreateGround
    
    //CreateGround
    double screenHeight, screenWidth;
    
    screenHeight = super.view.frame.size.height;
    screenWidth = super.view.frame.size.width;
    
    CGRect groundViewRect = CGRectMake(0, screenHeight - (44 + 30), screenWidth, 30);

    
    groundView = [[UIView alloc] initWithFrame: groundViewRect];
    groundView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:groundView];
    
    //CreateTanks
    Tank *p1Tank = [[Tank alloc] init];
    Tank *p2Tank = [[Tank alloc] init];
    
    //Calculate Tank Positions
    CGRect tank1Position = CGRectMake(0, groundViewRect.origin.y - 20, 50, 20);
    CGRect tank2Position = CGRectMake(screenWidth - 50, groundViewRect.origin.y - 20, 50, 20);
    
    TankView *tank1View = [[TankView alloc] initTank: p1Tank 
                                           withFrame: tank1Position 
                                     andPlayerNumber: 1
                           ];
    TankView *tank2View = [[TankView alloc] initTank: p2Tank 
                                           withFrame: tank2Position
                                     andPlayerNumber:2
                           ];
    
    [tank1View.tank setDelegate: self];
    [tank2View.tank setDelegate: self];
    
    
    //initialize NSMutableArray
    tankQueue = [[NSMutableArray alloc] init];
    
    //Add tanks to tankArray
    [tankQueue enqueue:tank1View];
    [tankQueue enqueue:tank2View];
    
    currentTankTurn = [tankQueue peek];
    
    [self.view addSubview:tank1View];
    [self.view addSubview:tank2View];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
