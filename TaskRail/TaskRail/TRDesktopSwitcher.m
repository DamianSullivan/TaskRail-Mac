//
//  TRDesktopSwitcher.m
//  TaskRail
//
//  Created by Damian Sullivan on 7/13/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "TRDesktopSwitcher.h"

#include "CGSSpaces.h"

@implementation TRDesktopSwitcher

- (void)observeDesktopSwitches {
  NSNotificationCenter *nc = [[NSWorkspace sharedWorkspace] notificationCenter];

  [nc addObserver:self
         selector:@selector(handleSpaceChanged:)
             name:NSWorkspaceActiveSpaceDidChangeNotification
           object:[NSWorkspace sharedWorkspace]];
}

- (void)handleSpaceChanged:(NSNotification *)notification {
  NSLog(@"Space is now: %d", [self getCurrentSpaceId]);
  [self.delegate activeSpaceDidChange:notification spaceId:[self getCurrentSpaceId]];
}

- (int)getCurrentSpaceId {
  CFArrayRef spaces = CGSCopySpaces(CGSDefaultConnection, kCGSSpaceCurrent);
  // CFArrayRef spaces = CGSCopySpaces(CGSDefaultConnection, kCGSSpaceAll);
  uint32_t count = (uint32_t)CFArrayGetCount(spaces);

  int i;
  for (i = count - 1; i >= 0; i--) {
    CGSSpace spaceId = (CGSSpace)CFArrayGetValueAtIndex(spaces, i);
    if (CGSSpaceGetType(CGSDefaultConnection, spaceId) == kCGSSpaceSystem) {
      continue;
    }
    return (int)spaceId;
  }

  CFRelease(spaces);
  return 0;
}

@end
