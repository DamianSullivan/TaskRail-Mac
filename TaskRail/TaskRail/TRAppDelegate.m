#import "TRAppDelegate.h"

#import "TRStatusItemViewController.h"

@implementation TRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  // Replace this.
  (void)[[[TRStatusItemViewController alloc] init] loadView];
}

@end
