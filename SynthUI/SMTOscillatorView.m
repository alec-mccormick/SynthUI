//
//  SMTOscillatorView.m
//  SynthUI
//
//  Created by Tiesto on 4/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTOscillatorView.h"

@implementation SMTOscillatorView

// =================================================================
// --- Initialization
// =================================================================
- (id)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        [self setFrame:frameRect];
    }
    
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
