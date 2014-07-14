//
//  TRDesktopSwitcher.m
//  TaskRail
//
//  Created by Damian Sullivan on 7/13/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "TRDesktopSwitcher.h"

#include "CGSSpaces.h"

static int getCurrentSpaceId() {
  CFArrayRef spaces = CGSCopySpaces(CGSDefaultConnection, kCGSSpaceCurrent);
  // CFArrayRef spaces = CGSCopySpaces(CGSDefaultConnection, kCGSSpaceAll);
  uint32_t count = (uint32_t)CFArrayGetCount(spaces);
  
  int ii;
  for (ii = count - 1; ii >= 0; ii--) {
    CGSSpace spaceId = (CGSSpace)CFArrayGetValueAtIndex(spaces, ii);
    if (CGSSpaceGetType(CGSDefaultConnection, spaceId) == kCGSSpaceSystem) {
      continue;
    }
    return (int)spaceId;
  }
  
  CFRelease(spaces);
  return 0;
}

@implementation TRDesktopSwitcher

- (void) observeDesktopSwitches {
  NSNotificationCenter *nc = [[NSWorkspace sharedWorkspace] notificationCenter];
  
  [nc addObserver:self
         selector:@selector(handleSpaceChanged:)
             name:NSWorkspaceActiveSpaceDidChangeNotification
           object:[NSWorkspace sharedWorkspace]];
}

- (void) handleSpaceChanged:(NSNotification *)notification {
  NSLog(@"Space is now: %d", getCurrentSpaceId());
  [self.delegate activeSpaceDidChange:notification spaceId:getCurrentSpaceId()];
}

@end
