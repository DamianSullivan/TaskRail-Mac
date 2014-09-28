//
//  TRDesktopSwitcher.h
//  TaskRail
//
//  Created by Damian Sullivan on 7/13/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TRDesktopSwitcherDelegate.h"

@interface TRDesktopSwitcher : NSObject

@property(nonatomic, strong) id<TRDesktopSwitcherDelegate> delegate;

- (void)observeDesktopSwitches;

- (int)getCurrentSpaceId;

@end
