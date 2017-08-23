//
//  SMTSpriteCell.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTSpriteCell.h"
#import "SMTConstants.h"
#import "SMTControlKnob.h"

// =================================================================
// --- Private properties
// =================================================================
@interface SMTSpriteCell ()

@property(weak) id _target;
@property SEL _action;

@end

// =================================================================
// --- Class methods for creating cells
// =================================================================
@implementation SMTSpriteCell

+ (instancetype)createKnob
{
    return [self createKnobWithSize:SMT_CONTROL_SIZE_DEFAULT];
}

+ (instancetype)createKnobWithSize:(NSUInteger)size
{
    NSString *imageSrc;
    switch(size)
    {
        case SMT_CONTROL_SIZE_LARGE:
            imageSrc = SMT_SRC_KNOB_LARGE;
            break;
        case SMT_CONTROL_SIZE_MED:
            imageSrc = SMT_SRC_KNOB_MED;
            break;
        case SMT_CONTROL_SIZE_SMALL:
        default:
            imageSrc = SMT_SRC_KNOB_SMALL;
            break;
    }
    SMTSpriteCell *cell = [[SMTSpriteCell alloc] initImageCell:[NSImage imageNamed:imageSrc] frames:SMT_NUM_FRAMES_KNOB];
    
    cell.continuous = YES;
    
    return cell;
}


+ (instancetype)createButton
{
    return [self createButtonWithSize:SMT_BUTTON_SIZE_DEFAULT];
}

+ (instancetype)createButtonWithSize:(NSUInteger)size
{
    return [self createButtonWithSize:size style:SMT_BUTTON_STYLE_DEFAULT];
}

+ (instancetype)createButtonWithSize:(NSUInteger)size
                               style:(NSUInteger)style
{
    NSString *imageSrc = (style == SMT_BUTTON_STYLE_BLUE)
        ? (size == SMT_CONTROL_SIZE_LARGE) ? SMT_SRC_BUTTON_BLUE_LARGE : SMT_SRC_BUTTON_BLUE_SMALL
        : (size == SMT_CONTROL_SIZE_LARGE) ? SMT_SRC_BUTTON_ORANGE_LARGE : SMT_SRC_BUTTON_ORANGE_SMALL;
    
    
    return [[SMTSpriteCell alloc] initImageCell:[NSImage imageNamed:imageSrc] frames:SMT_NUM_FRAMES_BUTTON];
}

// =================================================================
// --- Initialization
// =================================================================
- (instancetype)init
{
    if(self = [super init])
    {
        self.numFrames = 1;
        self.activeFrame = 0;
        
        self.frameWidth = 0;
        self.frameHeight = 0;
    }
    
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)coder
{
    if(self = [super initWithCoder:coder])
    {
        self.numFrames = 1;
        self.activeFrame = 0;
        
        self.frameWidth = 0;
        self.frameHeight = 0;
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
        
        self.frameWidth = self.image.size.height/frames;
        self.frameHeight = self.image.size.width;
    }
    
    return self;
}

// =================================================================
// --- Getters/Setters
// =================================================================
- (void)setTarget:(id)target
{
    self._target = target;
}
- (id)getTarget
{
    return self._target;
}
- (void)setAction:(SEL)action
{
    self._action = action;
}
- (SEL)getAction
{
    return self._action;
}

// =================================================================
// --- Render
// =================================================================
- (void)drawInteriorWithFrame:(NSRect)cellFrame
                       inView:(NSView *)controlView
{
//    [super drawInteriorWithFrame:cellFrame inView:controlView];
//    NSLog(@"Draw interior with frame! %@", NSStringFromRect(cellFrame));
    
    NSRect fromRect = NSMakeRect(0.0, (self.numFrames - self.activeFrame - 1) * self.frameHeight, self.frameWidth, self.frameHeight);
    
    [self.image drawInRect:cellFrame fromRect:fromRect operation:NSCompositingOperationSourceOver fraction:1.0];
}

- (void)calcActiveFrame:(CGFloat)value // Expects value between 0 -> 100
{
    NSInteger frame = (NSInteger) (floor(self.numFrames * value/100.0));

    frame = MAX(MIN(frame, self.numFrames - 1), 0);
    
    self.activeFrame = frame;
    
//    NSLog(@"calc new frame:%i value:%f", self.activeFrame, value);
}


// =================================================================
// --- Actions/Events
// =================================================================
- (BOOL)startTrackingAt:(NSPoint)startPoint
                 inView:(NSView *)controlView
{
    self.startPoint = startPoint;
    
    if([self._target respondsToSelector:@selector(handleCellTrackingStart:)])
        [self._target performSelector:@selector(handleCellTrackingStart:) withObject:self];
    
//    NSLog(@"Start tracking: x:%f, y:%f", startPoint.x, startPoint.y);
    return [super startTrackingAt:startPoint inView:controlView];
}

- (BOOL)continueTracking:(NSPoint)lastPoint
                      at:(NSPoint)currentPoint
                  inView:(NSView *)controlView
{
    self.currentPoint = &currentPoint;
    
    if([self._target respondsToSelector:@selector(handleCellTrackingContinue:)])
        [self._target performSelector:@selector(handleCellTrackingContinue:) withObject:self];
    
//    NSLog(@"Continue tracking: x:%f, y:%f", currentPoint.x, currentPoint.y);
    return [super continueTracking:lastPoint at:currentPoint inView:controlView];
}

- (void)stopTracking:(NSPoint)lastPoint
                  at:(NSPoint)stopPoint
              inView:(NSView *)controlView
           mouseIsUp:(BOOL)flag
{
//    self.startPoint = nil;
    self.currentPoint = nil;
    self.endPoint = stopPoint;
    
    if([self._target respondsToSelector:@selector(handleCellTrackingEnd:)])
        [self._target performSelector:@selector(handleCellTrackingEnd:) withObject:self];
    
    [super stopTracking:lastPoint at:stopPoint inView:controlView mouseIsUp:flag];
}

- (void)getPeriodicDelay:(float *)delay
                interval:(float *)interval
{
    *delay = 0.1;
    *interval = 0.025;
}

@end
