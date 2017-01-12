//
//  AppDelegate.m
//  SynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "AppDelegate.h"
#import "MiniSynthView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    CGFloat titleBarHeight = 22.0;
    CGSize size = CGSizeMake(1366.0, 1024.0 + titleBarHeight);
    
    NSRect frame = [self.window frame];
    frame.origin.y = frame.origin.y + size.height - frame.size.height;
    frame.size = size;
    
    [self.window setTitle:@"Mini Synth UI"];
    
    [self.window setFrame:frame display:YES];
    [self.window setBackgroundColor:[NSColor clearColor]];
    [self.window setOpaque:NO];
    
    [self.window setStyleMask:[self.window styleMask] & ~NSWindowStyleMaskResizable];
    
    
    self.window.contentView = [[MiniSynthView alloc] initWithFrame: CGRectMake(0.0, 0.0, size.width, size.height - titleBarHeight)];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
