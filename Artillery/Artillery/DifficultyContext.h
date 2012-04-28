//
//  DifficultyContext.h
//  FinalProject3
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DifficultyContext : NSObject

// message from which our instance is obtained

@property NSInteger difficulty;


+ (DifficultyContext *)sharedInstance;
//
//-(NSInteger) getDifficulty;
//-(void) setDifficulty: (NSInteger) inDifficulty;

@end
