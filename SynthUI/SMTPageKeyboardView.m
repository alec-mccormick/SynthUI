//
//  SMTPageKeyboardView.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTPageKeyboardView.h"
#import "SMTControlKnob.h"
#import "SMTDropdown.h"


@implementation SMTPageKeyboardView

// =================================================================
// --- Initialization
// =================================================================
- (id)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        NSTextView *text = [[NSTextView alloc] initWithFrame:NSMakeRect(5.0, 5.0, 100.0, 20.0)];
        text.drawsBackground = NO;
        [text setString:@"Keyboard View"];
        
        [self addSubview:text];
        
        // --- Test knob
//        SMTControlKnob *knob = [[SMTControlKnob alloc] initWithFrame:NSMakeRect(200.0, 100.0, 56.0, 56.0) size:SMT_CONTROL_SIZE_SMALL];
//        [self addSubview:knob];
        
        // --- Test Dropdown
        NSRect frame = NSMakeRect(200.0, 100.0, 140.0, 20.0);
        SMTDropdown *dropdown = [[SMTDropdown alloc] initWithFrame:frame pullsDown:YES];
        
        NSArray *options = @[@"Sine", @"Saw", @"Square", @"Triangle"];
        [dropdown addItemsWithTitles:options];
        [dropdown setColor:[NSColor whiteColor]];
        
        [self addSubview:dropdown];
    }
    
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [[NSColor lightGrayColor] setFill];
    NSRectFill(dirtyRect);
}

@end
