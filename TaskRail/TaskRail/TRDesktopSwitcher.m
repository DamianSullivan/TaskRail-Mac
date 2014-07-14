//
//  TRDesktopSwitcher.m
//  TaskRail
//
//  Created by Damian Sullivan on 7/13/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "TRDesktopSwitcher.h"

@implementation TRDesktopSwitcher

- (void) observerDesktopSwitches {
  NSNotificationCenter *nc = [[NSWorkspace sharedWorkspace] notificationCenter];
  
  [nc addObserver:self
         selector:@selector(handleSpaceChanged:)
             name:NSWorkspaceActiveSpaceDidChangeNotification
           object:[NSWorkspace sharedWorkspace]];
}

- (void) handleSpaceChanged:(NSNotification *)notification {
  NSLog(@"Space Changed");
}

@end
