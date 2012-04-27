//
//  TankQueue.m
//  FinalProject
//
//  Created by default on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TankQueue.h"

@implementation NSMutableArray (TankQueue)


-(id) dequeue
{
    id headObject = [self objectAtIndex:0];
    
    if(headObject != nil)
    {
        [self removeObjectAtIndex:0];
    }
    
    return headObject;
}


-(void) enqueue: (id) obj
{
    [self addObject:obj];
}

-(id) peek
{
    id headObject = [self objectAtIndex:0];
    
    return headObject;
}



@end
