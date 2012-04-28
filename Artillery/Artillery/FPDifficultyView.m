//
//  FPDifficultyView.m
//  FinalProject3
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FPDifficultyView.h"

@implementation FPDifficultyView

-(IBAction) difficultyEasy: (id)sender
{
    [[DifficultyContext sharedInstance] setDifficulty:1];
}

-(IBAction)difficultyMedium:(id)sender
{
    [[DifficultyContext sharedInstance] setDifficulty:2];
}

-(IBAction)difficultyHard:(id)sender
{
    [[DifficultyContext sharedInstance] setDifficulty:3];
}

@end
