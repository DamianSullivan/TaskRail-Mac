//
//  TRDesktopSwitcherDelegate.h
//  TaskRail
//
//  Created by Damian Sullivan on 7/13/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRDesktopSwitcherDelegate <NSObject>

- (void) activeSpaceDidChange:(NSNotification *)notification spaceId:(int) id;

@end