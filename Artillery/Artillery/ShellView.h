//
//  ShellView.h
//  TanksV1
//
//  Created by default on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShellView : UIView
{
    float yPos, xPos, xVel, yVel;
    float gravity;
    NSDate *timeStamp;
}

@property (strong, nonatomic) UIBezierPath *shellPath;
@property BOOL somethingAtPoint;

-(CGPoint) shellTrajNextPoint;
+(NSString*) calcShotAngleFrom: (CGPoint) initialPos to: (CGPoint) finalPos;
+(NSString*) calcShotMagnitudeFrom: (CGPoint) initialPos to: (CGPoint) finalPos;
-(void) calcShotVelocityFrom: (CGPoint) initialPos to: (CGPoint) finalPos;
-(void) cpuSetVelocityAndAngleAtTank: (CGPoint) enemyTankPosition;
-(void) animateShellViewHit;
@end
