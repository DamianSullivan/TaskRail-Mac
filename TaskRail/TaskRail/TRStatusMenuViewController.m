//
//  TRStatusMenuViewController.m
//  TaskRail
//
//  Created by Damian Sullivan on 7/12/14.
//  Copyright (c) 2014 dsullivan. All rights reserved.
//

#import "TRStatusMenuViewController.h"

@interface TRStatusMenuViewController ()

@property(nonatomic, strong) NSStatusBar *statusBar;
@property(nonatomic, strong) NSStatusItem *statusItem;
@end

@implementation TRStatusMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    _statusBar = [NSStatusBar systemStatusBar];
  }
  return self;
}

- (void)loadView {
  NSLog(@"LOADING");
  self.statusItem = [self.statusBar statusItemWithLength:NSVariableStatusItemLength];
  [self.statusItem setTitle:@"Screen 1"];
}

@end
