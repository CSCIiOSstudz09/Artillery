//
//  TankView.h
//  TanksV1
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tank.h"
#import "ShellView.h"
#import "FPViewController.h"

@interface TankView : UIView <UIGestureRecognizerDelegate>
{
    BOOL allowTapTouches;
}

@property NSInteger playerNumber;
@property (strong, nonatomic) UIBezierPath *tankPath;
@property (strong, nonatomic) Tank *tank;
@property (strong, nonatomic) UIColor *tankColor;

-(void) handleTap:(UITapGestureRecognizer*)tap;
- (id)initTank: (Tank*) inTank withFrame: (CGRect) frame andPlayerNumber: (NSInteger) pNumber;
-(void) animateTankViewDestroyed;

@end
