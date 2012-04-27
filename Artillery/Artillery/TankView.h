//
//  TankView.h
//  TanksV1
//
//  Created by default on 3/21/12.
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

-(void) handleTap:(UITapGestureRecognizer*)tap;
- (id)initTank: (Tank*) tank withFrame: (CGRect) frame andPlayerNumber: (NSInteger) pNumber;
-(void) animateTankViewDestroyed;

@end
