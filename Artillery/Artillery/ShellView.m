//
//  ShellView.m
//  TanksV1
//
//  Created by default on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShellView.h"

@implementation ShellView

@synthesize somethingAtPoint;
@synthesize shellPath;

- (id)initWithFrame:(CGRect)frame
{
    
    frame.origin.x += 2;
    frame.origin.y += -20;
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        shellPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];        
        
        xPos = 0;
        yPos = 0;
        xVel = 0;
        yVel = 0;
        somethingAtPoint = false;
        gravity =  9.8;
        
        timeStamp = [NSDate date];
                    
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(CGPoint) shellTrajNextPoint
{
    
    
    
    NSTimeInterval interval = [timeStamp timeIntervalSinceNow];
    interval = fabs(interval);
    
    
    xPos = xPos + xVel*interval;
    yVel = yVel + gravity;//*interval;
    yPos = (yPos + yVel*interval);
    
    
    
    
    CGPoint differential;
    differential.y = yPos;
    differential.x = xPos; 
    
    
    timeStamp = [NSDate date];
    return differential;
}

+(NSString*) calcShotAngleFrom: (CGPoint) initialPos to: (CGPoint) finalPos
{
    double dx, dy, angle;
    
    
    dx = initialPos.x - finalPos.x;
    dy = initialPos.y - finalPos.y;

    
    if(dx < 0 && dy > 0)
    {
        angle = atan(dy/dx);
        
        //convert
        angle = M_PI + fabs(angle);
        
        //NSLog(@"1dx: %f  dy: %f angle: %f",dx,dy,angle);
    }
    else if(dx > 0 && dy > 0)
    {
        angle = atan(dx/dy);
        
        //convert
        angle = (2*M_PI) - angle;
        //NSLog(@"2dx: %f  dy: %f angle: %f",dx,dy,angle);
    }
    else if(dx < 0 && dy < 0)
    {
        angle = atan(dy/dx);
        
        //convert
        angle = M_PI - angle;
        //NSLog(@"3dx: %f  dy: %f angle: %f",dx,dy,angle);
        
    }
    else if(dx > 0 && dy < 0)
    {
        angle = atan(dy/dx);
        
        //convert
        angle = fabs(angle);
        //NSLog(@"4dx: %f  dy: %f angle: %f",dx,dy,angle);
    }
    //Fire straight down
    else if(dx == 0 && dy > 0)
    {
        angle = 3*(M_PI)/2;  
    }
    //Fire straight up
    else if(dx == 0 && dy < 0)
    {
        angle = (M_PI/2);
    }
    
    //Fire straight left
    else if(dx > 0 && dy == 0)
    {
        angle = 0;
    }
    
    //Fire straight right
    else if(dx < 0 && dy == 0)
    {
        angle = M_PI;
    }  
    else
    {
        //FIRE AGAIN
        //DIVIDE BY ZERO!!!
    }
    
    
    //convert angle from radians to degrees
    angle = angle * (180/M_PI);
    
    return [NSString stringWithFormat: @"%4.2f", angle];
    
}

+(NSString*) calcShotMagnitudeFrom:(CGPoint)initialPos to:(CGPoint)finalPos
{
    
    double dx, dy, magnitude;
    
    
    dx = initialPos.x - finalPos.x;
    dy = initialPos.y - finalPos.y;
    
    
    magnitude = sqrt(pow(dx,2) + pow(dy,2));
    
    return [NSString stringWithFormat:@"%4.2f",magnitude];

}

-(void) calcShotVelocityFrom: (CGPoint) initialPos to: (CGPoint) finalPos
{
    xVel = initialPos.x - finalPos.x;
    yVel = initialPos.y - finalPos.y;
    
    NSInteger scaler = 6;
    
    if(xVel < 0)
    {
        xVel = (-1*sqrt(fabs(xVel))) * scaler;
    }
    else
    {
        xVel = (sqrt(xVel)) * scaler;
    }
    if(yVel < 0)
    {
        yVel = (-1*sqrt(fabs(yVel))) * scaler;
    }
    else
    {
        yVel = (sqrt(yVel)) * scaler;
    }
    
    //NSLog(@"xVel: %f yVel: %f", xVel, yVel);
}


-(void) cpuSetVelocityAndAngleAtTank: (CGPoint) enemyTankPosition
{
    
    double dx, dy;
    
    dx = enemyTankPosition.x - self.center.x;
    dy = enemyTankPosition.y - self.center.y;
    
    
    xVel = dx/3.5;
    
    if(dy*gravity - pow(xVel,2) < 0)
    {
        yVel = -1*sqrt(fabs(dy*gravity - pow(xVel,2)));
    }
    else
    {
        yVel = sqrt(dy*gravity - pow(xVel,2));
    }
    
    //double variation = 1 -((double)arc4random() / (0x100000000 - 100));
    
    double xVariation =  1.25 - ((arc4random() % 100)/ 1050.);
    double yVariation =  1.25 - ((arc4random() % 100)/ 95.);
    
    //NSLog(@"Variation: %f",variation);
    
    xVel = xVel * xVariation;
    yVel = yVel * yVariation;    
//    xVel = dx % 69;
//    yVel = arc4random() % 119;
//    yVel = -yVel;
    
    NSLog(@"xVel: %f yVel: %f", xVel, yVel);

}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [[UIColor blackColor] set];
    [shellPath fill];
}

-(void) animateShellViewHit
{
    
    [UIView animateWithDuration:.2 animations: ^{
        //[[shell shellPath] fill]]  = [UIColor orangeColor];
        
        CGAffineTransform scale = CGAffineTransformMakeScale( 2, 2 );
        CGAffineTransform rotate = CGAffineTransformMakeRotation( M_PI - 0.01 );
        self.transform = CGAffineTransformConcat( scale, rotate );
        self.alpha = 1.;

        [[UIColor orangeColor] set];
        [shellPath fill];
    }];
    
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:.2];
}


@end
