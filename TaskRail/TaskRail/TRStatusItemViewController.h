#import <Cocoa/Cocoa.h>

#import "TRDesktopSwitcherDelegate.h"

@class TRDesktopSwitcher;
@class TRStatusItemView;

@interface TRStatusItemViewController
    : NSViewController<TRDesktopSwitcherDelegate, NSTextViewDelegate, NSMenuDelegate>

@end
