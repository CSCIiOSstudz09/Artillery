//
//  Tank.h
//  TanksV1
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tank.h"

@class TankView;

@protocol TankDelegate <NSObject>

-(void) fireShell;
-(void) cpuFireShell;

@end




@interface Tank : NSObject {
    

    id <TankDelegate> delegate;
    
}

@property (strong, nonatomic) UIBezierPath *tankPath;
@property (retain, nonatomic) id <TankDelegate> delegate;
@property NSInteger tankHealth;

-(void) fireShell;

@end
