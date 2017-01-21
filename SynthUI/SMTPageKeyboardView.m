//
//  SMTPageKeyboardView.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTPageKeyboardView.h"
#import "SMTControlKnob.h"

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
        SMTControlKnob *knob = [[SMTControlKnob alloc] initWithFrame:NSMakeRect(200.0, 100.0, 161.0, 168.0) size:SMT_CONTROL_SIZE_LARGE];
        [self addSubview:knob];
    }
    
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [[NSColor lightGrayColor] setFill];
    NSRectFill(dirtyRect);
}

@end
