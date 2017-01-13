//
//  SMTSpriteCell.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTSpriteCell.h"

@implementation SMTSpriteCell

- (instancetype)init
{
    if(self = [super init])
    {
        self.numFrames = 1;
        self.activeFrame = 0;
    }
    
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)coder
{
    if(self = [super initWithCoder:coder])
    {
        self.numFrames = 1;
        self.activeFrame = 0;
    }
    
    return self;
}

- (instancetype)initImageCell:(NSImage *) image
{
    return [self initImageCell:image frames:1];
}

- (instancetype)initImageCell:(NSImage *)image
                       frames:(NSInteger)frames
{
    if(self = [super initImageCell:image])
    {
        self.numFrames = frames;
        self.activeFrame = 0;
        [self setType:NSImageCellType];
    }
    
    return self;
}


- (void)drawInteriorWithFrame:(NSRect)cellFrame
                       inView:(NSView *)controlView
{
//    [super drawInteriorWithFrame:cellFrame inView:controlView];
    NSLog(@"Draw interior with frame!");
    
    CGFloat height = cellFrame.size.height;
    CGFloat width = cellFrame.size.width;
    
//    NSLog(@"Knob image height:%f",self.image.size.height);
//    NSLog(@"Num frames: %u, height: %f, active: %u, combined: %f", self.numFrames, height, self.activeFrame, -(self.numFrames - 1 - self.activeFrame) * height);
    
    [self.image drawInRect:NSMakeRect(0.0, (self.activeFrame + 1 - self.numFrames) * height, width, self.numFrames * height)];
}

- (void)calcActiveFrame:(CGFloat)value
{
    NSInteger frame = (NSInteger) (floor(self.numFrames * value/100.0));
    
    if(frame >= self.numFrames)
        frame = self.numFrames - 1;
    
    self.activeFrame = frame;
}

@end
