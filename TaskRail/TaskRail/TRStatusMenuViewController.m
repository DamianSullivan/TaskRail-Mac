#import "TRStatusMenuViewController.h"
#import "TRDesktopSwitcher.h"

@interface TRStatusMenuViewController ()
@property(nonatomic, strong) NSStatusBar *statusBar;
@property(nonatomic, strong) NSStatusItem *statusItem;
@property(nonatomic, strong) TRDesktopSwitcher *desktopSwitcher;
@end

@implementation TRStatusMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    _statusBar = [NSStatusBar systemStatusBar];
    _desktopSwitcher = [[TRDesktopSwitcher alloc] init];
  }
  return self;
}

- (void)loadView {
  self.statusItem = [self.statusBar statusItemWithLength:NSVariableStatusItemLength];
  [self.statusItem setTitle:@"Screen 1"];
  [self.desktopSwitcher observerDesktopSwitches];
}

@end
