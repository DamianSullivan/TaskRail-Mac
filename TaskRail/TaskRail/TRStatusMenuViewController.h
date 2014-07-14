#import <Cocoa/Cocoa.h>

#import "TRDesktopSwitcherDelegate.h"

@class TRDesktopSwitcher;

@interface TRStatusMenuViewController : NSViewController<TRDesktopSwitcherDelegate>

@property(nonatomic, strong) NSStatusBar *statusBar;
@property(nonatomic, strong) NSStatusItem *statusItem;
@property(nonatomic, strong) TRDesktopSwitcher *desktopSwitcher;
@property(nonatomic, strong) NSDictionary *desktopTodoLists;

@end
