//
//  SMTButtonCell.m
//  SynthUI
//
//  Created by Alec McCormick on 1/11/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTButtonCell.h"

@implementation SMTButtonCell

- (instancetype)init
{
    if(self = [super init])
    {
        self.image = [NSImage imageNamed:@"button_big.png"];
        [self.image setTemplate:NO];

        [self setBordered:NO];
        
        [self setButtonType:NSToggleButton];
        [self setImagePosition:NSImageOverlaps];
        [self setImageScaling:NSImageScaleNone];
        
        self.showsStateBy = NSNoCellMask;
        self.highlightsBy = NSNoCellMask;
        
        self.isRadioButton = NO;
    }
    return self;
}

- (void)drawImage:(NSImage *)image withFrame:(NSRect)frame inView:(NSView *)controlView
{
    CGFloat y;
    
    if(self.isRadioButton)
    {
        y = (self.state == 1 || self.isHighlighted == YES) ? -frame.size.height : frame.origin.y;
    } else
    {
        y = (self.isHighlighted == YES) ? -frame.size.height * 2 : (self.state == 1) ? -frame.size.height : 0.0;
    }
    
    [image drawInRect:NSMakeRect(frame.origin.x, y, frame.size.width, frame.size.height * 3)];
    
//    NSLog(@"Frame: x:%f, y:%f, width:%f, height:%f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
//    NSLog(@"DrawImage state:%ld highlighted:%u", (long)self.state, self.isHighlighted);
}

@end

