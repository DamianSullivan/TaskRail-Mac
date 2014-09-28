#import <Cocoa/Cocoa.h>

@interface TRStatusItemView : NSView<NSTextFieldDelegate>

@property(nonatomic, strong) NSStatusItem *statusItem;

- (void)setTaskSpaceTitle:(NSString *)newTitle;

@end
