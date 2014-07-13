//
//  AppDelegate.m
//  TaskRail
//
//  Created by Damian Sullivan on 4/4/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "AppDelegate.h"

#import "TRStatusMenuViewController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  self.statusMenuViewController = [[TRStatusMenuViewController alloc] initWithNibName:@"TRStatusMenuViewController" bundle:nil];
  [self.statusMenuViewController loadView];
}

@end
