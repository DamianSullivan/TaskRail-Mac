#import "TRAppDelegate.h"

#import "TRStatusMenuViewController.h"

@implementation TRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  self.statusMenuViewController = [[TRStatusMenuViewController alloc] init];
  [self.statusMenuViewController loadView];
}

@end
