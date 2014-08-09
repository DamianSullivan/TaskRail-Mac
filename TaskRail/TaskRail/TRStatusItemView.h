#import <Cocoa/Cocoa.h>

@interface TRStatusItemView : NSView

@property(nonatomic, strong) NSStatusItem *statusItem;

- (void)setTitle:(NSString *)newTitle;

@end
