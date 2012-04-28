//
//  TankView.m
//  TanksV1
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TankView.h"


@implementation TankView

@synthesize tank;
@synthesize tankPath;
@synthesize playerNumber;
@synthesize tankColor;


- (id)initTank: (Tank*) inTank withFrame: (CGRect) frame andPlayerNumber: (NSInteger) pNumber
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        tankPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:15.];

        
        //Initialze tank
        self.tank = inTank;
        
        //Initialize player number
        self.playerNumber = pNumber;
        
        
        //Set Player Color
        if(playerNumber == 1)
        {
            tankColor = [UIColor blueColor];
        }
        else
        {
            tankColor = [UIColor redColor];
        }
        
        //Add GestureRecognizer
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    
    return self;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        tankPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:15.];
    
        //Initialze tank
        tank = [[Tank alloc] init];

        
        //Add GestureRecognizer
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void) handleTap: (UITapGestureRecognizer*)tap
{
   // [tank fireShell: self];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [tankColor set];
    [tankPath fill];
}

-(void) animateTankViewDestroyed
{
    
    [UIView animateWithDuration:.5 animations: ^{

        CGAffineTransform scale = CGAffineTransformMakeScale( 2, 2 );
        CGAffineTransform rotate = CGAffineTransformMakeRotation( M_PI - 0.01 );
        self.transform = CGAffineTransformConcat( scale, rotate );
        self.alpha = .5;
    }];
    
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:.5];
}


@end
