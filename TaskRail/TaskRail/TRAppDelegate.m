#import "TRAppDelegate.h"

#import "TRStatusMenuViewController.h"

@implementation TRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  NSLog(@"LOG");
  self.statusMenuViewController =
      [[TRStatusMenuViewController alloc] initWithNibName:@"TRStatusMenuViewController" bundle:nil];
  [self.statusMenuViewController loadView];
}

@end
