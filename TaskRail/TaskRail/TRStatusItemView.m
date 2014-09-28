#import "TRStatusItemView.h"

#define StatusItemViewPaddingWidth 6
#define StatusItemViewPaddingHeight 3

@interface TRStatusItemView ()
@property(nonatomic, strong) NSString *title;
@property(nonatomic, assign, getter=isMenuVisible) BOOL menuVisible;
@property(nonatomic, strong) NSView *prevView;
@end

@implementation TRStatusItemView

@synthesize statusItem;

- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _title = @"";
  }
  return self;
}

- (void)drawRect:(NSRect)rect {
  NSLog(@"Calling Draw Rect");
  // Draw status bar background, highlighted if menu is showing
  [self.statusItem drawStatusBarBackgroundInRect:[self bounds]
                              withHighlight:self.isMenuVisible];
  
  // Draw title string
  NSPoint origin = NSMakePoint(StatusItemViewPaddingWidth,
                               StatusItemViewPaddingHeight);
  [self.title drawAtPoint:origin
      withAttributes:[self titleAttributes]];
}

- (NSColor *)titleForegroundColor {
  if (self.isMenuVisible) {
    return [NSColor whiteColor];
  } else {
    return [NSColor blackColor];
  }
}

- (NSDictionary *)titleAttributes {
  // Use default menu bar font size
  NSFont *font = [NSFont menuBarFontOfSize:0];

  NSColor *foregroundColor = [self titleForegroundColor];

  return [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, foregroundColor,
                                                    NSForegroundColorAttributeName, nil];
}

- (NSRect)titleBoundingRect {
  return [self.title boundingRectWithSize:NSMakeSize(1e100, 1e100)
                                  options:0
                               attributes:[self titleAttributes]];
}

- (void)setTaskSpaceTitle:(NSString *)newTitle {
  if (![self.title isEqual:newTitle]) {
    self.title = newTitle;
    
    // Update status item size (which will also update this view's bounds)
    NSRect titleBounds = [self titleBoundingRect];
    int newWidth = titleBounds.size.width + (2 * StatusItemViewPaddingWidth);
    [self.statusItem setLength:newWidth];
    
    [self setNeedsDisplay:YES];
  }
}


#pragma mark - NSMenuDelegate

- (void)mouseDown:(NSEvent *)event {
  NSLog(@"Mouse Down");
}

- (void)rightMouseDown:(NSEvent *)event {
  NSLog(@"Right Mouse Down");
  
  NSTextField *tf = [[NSTextField alloc] initWithFrame:[self titleBoundingRect]];
  [tf setBackgroundColor:[NSColor clearColor]];
  [tf setEditable:YES];

  tf.delegate = self;
  
  self.prevView = self.statusItem.view;
  [self.statusItem setView:tf];
}

- (void)menuWillOpen:(NSMenu *)menu {
  NSLog(@"Menu Will Open");
}

- (void)menuDidClose:(NSMenu *)menu {
  NSLog(@"Menu Did Close");
}

@end
