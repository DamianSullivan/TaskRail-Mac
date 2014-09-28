#import "TRStatusItemViewController.h"

#import "TRStatusItemView.h"
#import "TRDesktopSwitcher.h"

static const NSString *kNewTaskSpaceTitle = @"New Task Space";

@interface TRStatusItemViewController ()

@property(nonatomic, strong) NSStatusItem *statusItem;
@property(nonatomic, strong) TRStatusItemView *statusItemView;
@property(nonatomic, strong) TRDesktopSwitcher *desktopSwitcher;
@property(nonatomic, strong) NSMutableDictionary *desktopIdToName;
@end

@implementation TRStatusItemViewController

- (id)init {
  self = [super init];
  if (self) {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _desktopSwitcher = [[TRDesktopSwitcher alloc] init];
    _desktopSwitcher.delegate = self;
    
    // Get this from storage.
    _desktopIdToName = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)loadView {
  self.statusItemView = [[TRStatusItemView alloc] initWithFrame:CGRectZero];
  self.statusItemView.statusItem = self.statusItem;
  [self.statusItem setView:self.statusItemView];

  int currentSpaceId = [self.desktopSwitcher getCurrentSpaceId];
  if (currentSpaceId == 0) {
    NSLog(@"Could not determine current space id");
    return;
  }
  
  NSString *currentSpaceIdString = [NSString stringWithFormat:@"%d", currentSpaceId];
  
  if (![self.desktopIdToName objectForKey:currentSpaceIdString]) {
    [self.desktopIdToName setValue:kNewTaskSpaceTitle forKey:currentSpaceIdString];
  }
  
  [self.statusItemView setTaskSpaceTitle:self.desktopIdToName[currentSpaceIdString]];

  [self.desktopSwitcher observeDesktopSwitches];
}

#pragma mark - TRDesktopSwitcherDelegate

- (void)activeSpaceDidChange:(NSNotification *)notification spaceId:(int)spaceId {
  [self.statusItem setTitle:[NSString stringWithFormat:@"Desktop id: %d", spaceId]];
}

@end
