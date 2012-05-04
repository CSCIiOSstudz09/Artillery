//
//  FPAppDelegate.h
//  Artillery
//
//  Created by Jacob Spizziri and Joe Studniarz on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

/*
 Good effort. Builds, runs, and meets all the specs. There appears to be a bug in
 the shooting logic, though -- the user-fired shells don't visibly go anywhere
 except to hit the tank that fired them, and the program always reports each shot
 was a hit to the enemy. I'm sure it will turn out to be a minor thing that will
 make you feel stupid, but nearly all bugs are like that, so you should get used
 to it if you're going to pursue a career in CS. In any case, it's clear you spent
 a lot of time on it, and you should be proud to show it off on your phone. Let me
 know if you have bugfixes you'd like to add -- I've already done the hard part of
 distributing it, so rebuilding is now pretty easy.
 
 Grade: 100%
 Course grade: 97% (A)
*/