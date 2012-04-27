//
//  Tank.m
//  TanksV1
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tank.h"
#import "TankView.h"

@implementation Tank

@synthesize delegate;
@synthesize tankHealth;
@synthesize tankPath;

-(Tank *) init
{
    self.tankHealth = 2;
    //tankPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100,100)];
    return self;
}

-(void) fireShell
{
    [delegate fireShell];
}

@end
