//
//  AppDelegate.h
//  TaskRail
//
//  Created by Damian Sullivan on 4/4/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TRStatusMenuViewController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, strong) IBOutlet TRStatusMenuViewController *statusMenuViewController;

@end
