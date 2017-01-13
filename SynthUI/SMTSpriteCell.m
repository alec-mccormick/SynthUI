//
//  SMTSpriteCell.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTSpriteCell.h"
#import "SMTConstants.h"

@implementation SMTSpriteCell

+ (instancetype)createKnob
{
    return [self createKnobWithSize:SMT_CONTROL_SIZE_SMALL];
}

+ (instancetype)createKnobWithSize:(NSUInteger)size
{
    NSImage *image;
    switch(size)
    {
        case SMT_CONTROL_SIZE_LARGE:
            image = [NSImage imageNamed:@"knob_light_big_2x(1x128).png"];
            return [[SMTSpriteCell alloc] initImageCell:image frames:128];
        case SMT_CONTROL_SIZE_MED:
            image = [NSImage imageNamed:@"knob_light_mid_2x(1x128).png"];
            return [[SMTSpriteCell alloc] initImageCell:image frames:128];
        case SMT_CONTROL_SIZE_SMALL:
        default:
            image = [NSImage imageNamed:@"knob_light_small_2x(1x128).png"];
            return [[SMTSpriteCell alloc] initImageCell:image frames:128];
    }
}


+ (instancetype)createButton
{
    return [self createButtonWithSize:SMT_CONTROL_SIZE_SMALL];
}

+ (instancetype)createButtonWithSize:(NSUInteger)size
{
    return [self createButtonWithSize:size style:SMT_BUTTON_STYLE_BLUE];
}

+ (instancetype)createButtonWithSize:(NSUInteger)size
                               style:(NSUInteger)style
{
    
//    NSString *imageSrc;
    NSImage *image;
    
    if(style == SMT_BUTTON_STYLE_BLUE)
    {
        
    }
    else
    {
        
    }
    
    image = [NSImage imageNamed:@"button_big.png"];
    return [[SMTSpriteCell alloc] initImageCell:image frames:3];
}



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



- (BOOL)startTrackingAt:(NSPoint)startPoint
                 inView:(NSView *)controlView
{
    NSLog(@"start tracking!");
//    [super startTrackingAt:startPoint inView:controlView];
    return YES;
}

- (BOOL)continueTracking:(NSPoint)lastPoint
                      at:(NSPoint)currentPoint
                  inView:(NSView *)controlView
{
    NSLog(@"continue tracking! %f, %f", currentPoint.x, currentPoint.y);
//    return [super continueTracking:lastPoint at:currentPoint inView:controlView];
    return YES;
}

- (void)stopTracking:(NSPoint)lastPoint
                  at:(NSPoint)stopPoint
              inView:(NSView *)controlView
           mouseIsUp:(BOOL)flag
{
    NSLog(@"stop tracking!");
    return [super stopTracking:lastPoint at:stopPoint inView:controlView mouseIsUp:flag];
}

@end
