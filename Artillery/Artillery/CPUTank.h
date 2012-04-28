//
//  CPUTank.h
//  FinalProject
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12..
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tank.h"

@interface CPUTank : Tank

@property NSInteger difficulty;


-(id) initTankWithDifficulty: (NSInteger) inDifficulty;

@end
