//
//  DifficultyContext.m
//  FinalProject3
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DifficultyContext.h"

@implementation DifficultyContext

@synthesize difficulty;

+ (DifficultyContext *)sharedInstance
{
    // the instance of this class is stored here
    static DifficultyContext *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

//-(void) setDifficulty:(NSInteger)inDifficulty
//{
//    self.difficulty = inDifficulty;
//}
//
//-(NSInteger) getDifficulty
//{
//    return difficulty;
//}

@end
