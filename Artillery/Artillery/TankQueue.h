//
//  TankQueue.h
//  FinalProject
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TankQueue)

-(id) dequeue;
-(void) enqueue: (id) obj;
-(id) peek;

@end
