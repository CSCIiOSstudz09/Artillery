//
//  TankQueue.h
//  FinalProject
//
//  Created by default on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TankQueue)

-(id) dequeue;
-(void) enqueue: (id) obj;
-(id) peek;

@end
