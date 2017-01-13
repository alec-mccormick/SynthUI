//
//  SMTControlKnob.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTControlKnob.h"
#import "SMTSpriteCell.h"

@implementation SMTControlKnob

- (instancetype)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        NSImage *image = [NSImage imageNamed:@"knob_light_big_2x(1x128).png"];
        SMTSpriteCell *cell = [[SMTSpriteCell alloc] initImageCell:image frames:128];
        self.cell = cell;

//        [cell calcActiveFrame:85.0];
//        NSImage *image = [NSImage imageNamed:@"button_big.png"];
//        self.cell = [[SMTSpriteCell alloc] initImageCell:image frames:3];
//        [self.cell setImage:image];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSLog(@"draw control knob");
 
//    NSImage *image = [NSImage imageNamed:@"button_big.png"];
//    [image drawInRect:dirtyRect];
}

@end
