//
//  FPGameViewController.h
//  TanksV1
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TankView.h"
#import "ShellView.h"
#import "Tank.h"
#import "CPUTank.h"
#import "TankQueue.h"
#import "CPUTank.h"

@interface FPGameViewController : UIViewController <TankDelegate>
{
    NSMutableArray *tankQueue;
    UIImageView *groundView;
    CGPoint initialFirePoint, finalFirePoint;
    TankView *currentTankTurn;
}

@property (strong, nonatomic) IBOutlet UILabel *angleDisplay;
@property (strong, nonatomic) IBOutlet UILabel *velocityDisplay;
@property (strong, nonatomic) IBOutlet UILabel *victoryMessage;


-(void) updateCoords: (ShellView *) shell;
-(BOOL) shellHitSomething: (ShellView *) shell;
-(void) cpuCheckAndFire;
-(void) removeShellView: (ShellView *) shell;
-(void) checkEndGame;

@end
