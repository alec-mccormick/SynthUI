//
//  SMTPageFiltersView.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTPageFiltersView.h"

@implementation SMTPageFiltersView

// =================================================================
// --- Initialization
// =================================================================
- (id)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        NSTextView *text = [[NSTextView alloc] initWithFrame:NSMakeRect(5.0, 5.0, 100.0, 20.0)];
        text.drawsBackground = NO;
        [text setString:@"Filters View"];
        
        [self addSubview:text];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [[NSColor lightGrayColor] setFill];
    NSRectFill(dirtyRect);}

@end
