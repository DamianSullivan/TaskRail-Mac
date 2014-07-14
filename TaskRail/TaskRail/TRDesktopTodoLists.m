//
//  TRDesktopTodoLists.m
//  TaskRail
//
//  Created by Damian Sullivan on 7/14/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "TRDesktopTodoLists.h"

@implementation TRDesktopTodoLists

- (instancetype)init {
  self = [super init];
  if (self) {
    _desktopTodoLists = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)addTodoList:(TRTodoList *)todoList withSpaceId:(NSString *)spaceId {
  [self.desktopTodoLists setValue:todoList forKey:spaceId];
}

- (TRTodoList *)getTodoListWithSpaceId:(NSString *)spaceId {
  return [self.desktopTodoLists objectForKey:spaceId];
}

@end
