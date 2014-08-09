#import "TRStatusItemViewController.h"

#import "TRStatusItemView.h"
#import "TRDesktopSwitcher.h"

@interface TRStatusItemViewController ()

@property(nonatomic, strong) NSStatusItem *statusItem;
@property(nonatomic, strong) TRStatusItemView *statusItemView;
@property(nonatomic, strong) TRDesktopSwitcher *desktopSwitcher;
@property(nonatomic, strong) NSDictionary *desktopTodoLists;

@end

@implementation TRStatusItemViewController

- (id)init {
  self = [super init];
  if (self) {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItemView = [[TRStatusItemView alloc] init];
    _desktopSwitcher = [[TRDesktopSwitcher alloc] init];
    _desktopSwitcher.delegate = self;
    _desktopTodoLists = [[NSDictionary alloc] init];
  }
  return self;
}

- (void)loadView {
  
  // Load the status item view.
  self.statusItemView.statusItem = self.statusItem;
  //[statusItemView setMenu:menu];
  [self.statusItem setView:self.statusItemView];
  [self.statusItemView setTitle:@"00:00:00"];
  
  [self.desktopSwitcher observeDesktopSwitches];
}

# pragma mark - TRDesktopSwitcherDelegate

- (void)activeSpaceDidChange:(NSNotification *)notification spaceId:(int)spaceId {
  [self.statusItem setTitle:[NSString stringWithFormat:@"Desktop id: %d", spaceId]];
}

@end
