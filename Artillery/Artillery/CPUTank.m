//
//  CPUTank.m
//  FinalProject
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPUTank.h"

@implementation CPUTank

@synthesize difficulty;

-(id) initTankWithDifficulty: (NSInteger) inDifficulty
{
    self.difficulty = inDifficulty;
    self.tankHealth = 2;
    return self;
}

-(void) fireShell
{
    [delegate cpuFireShell];
}

@end
