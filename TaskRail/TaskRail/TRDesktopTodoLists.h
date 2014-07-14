//
//  TRDesktopTodoLists.h
//  TaskRail
//
//  Created by Damian Sullivan on 7/14/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRTodoList;

@interface TRDesktopTodoLists : NSObject

@property(nonatomic, strong) NSDictionary *desktopTodoLists;

- (void)addTodoList:(TRTodoList *)todoList withSpaceId:(NSString *)spaceId;

- (TRTodoList *)getTodoListWithSpaceId:(NSString *)spaceId;

@end
