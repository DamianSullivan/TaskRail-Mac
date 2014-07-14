#import "TRStatusMenuViewController.h"
#import "TRDesktopSwitcher.h"

@implementation TRStatusMenuViewController

- (id)init {
  self = [super init];
  if (self) {
    _statusBar = [NSStatusBar systemStatusBar];
    _desktopSwitcher = [[TRDesktopSwitcher alloc] init];
    _desktopSwitcher.delegate = self;
  }
  return self;
}

- (void)loadView {
  // TODO(dsullivan): This should all go somewhere else.
  self.statusItem = [self.statusBar statusItemWithLength:NSVariableStatusItemLength];
  [self.statusItem setTitle:@"Screen 1"];
  [self.desktopSwitcher observeDesktopSwitches];
}

- (void)activeSpaceDidChange:(NSNotification *)notification spaceId:(int)spaceId {
  [self.statusItem setTitle:[NSString stringWithFormat:@"Desktop id: %d", spaceId]];
}

@end
