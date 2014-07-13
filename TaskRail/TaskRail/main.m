#import <Cocoa/Cocoa.h>

#import "TRAppDelegate.h"

int main(int argc, const char * argv[]) {
  TRAppDelegate * delegate = [[TRAppDelegate alloc] init];
  [[NSApplication sharedApplication] setDelegate:delegate];
  [NSApp run];
}
