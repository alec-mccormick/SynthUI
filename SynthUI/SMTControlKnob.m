    //
//  SMTControlKnob.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTControlKnob.h"

// =================================================================
// --- Private properties
// =================================================================
@interface SMTControlKnob ()

@property (nonatomic) CGFloat lastControlValue;

@end



@implementation SMTControlKnob

// =================================================================
// --- Initialization
// =================================================================
- (instancetype)initWithFrame:(NSRect)frameRect
{
    return [self initWithFrame:frameRect size:SMT_CONTROL_SIZE_DEFAULT];
}

- (instancetype)initWithFrame:(NSRect)frameRect
                     size:(NSUInteger)size
{
    if(self = [super initWithFrame:frameRect])
    {
        self.controlValue = 0.0;
        self.lastControlValue = 0.0;
        
        self.cell = [SMTSpriteCell createKnobWithSize:size];
        
        switch(size)
        {
            case SMT_CONTROL_SIZE_LARGE:
                self.scaleImage = [NSImage imageNamed:SMT_SRC_KNOB_SCALE_LARGE];
                self.meta = SMT_CONTROL_KNOB_META_LARGE;
                break;
            case SMT_CONTROL_SIZE_MED:
                self.scaleImage = [NSImage imageNamed:SMT_SRC_KNOB_SCALE_MED];
                self.meta = SMT_CONTROL_KNOB_META_MED;
                break;
            case SMT_CONTROL_SIZE_SMALL:
            default:
                self.meta = SMT_CONTROL_KNOB_META_SMALL;
                break;
        }
        
        [self.cell setTarget:self];
        self.continuous = YES;
    }
    return self;
}

- (void)updateControlValue:(CGFloat)newValue
{
    self.controlValue = MAX(MIN(newValue, 100), 0);
    
    [self.cell calcActiveFrame:self.controlValue];
    [self setNeedsDisplay:YES];
}
// =================================================================
// --- Actions/Events
// =================================================================
- (void)mouseDown:(NSEvent *)event
{
    [self.cell trackMouse:event inRect:self.frame ofView:self untilMouseUp:YES];
}

- (IBAction)handleCellTrackingStart:(SMTSpriteCell *)sender
{
    self.lastControlValue = self.controlValue;
}

- (IBAction)handleCellTrackingContinue:(SMTSpriteCell *)sender
{
    CGFloat x = sender.currentPoint->x - sender.startPoint.x;
    CGFloat y = sender.currentPoint->y - sender.startPoint.y;
    CGFloat distance = SMT_CONTROL_DRAG_DISTANCE_FACTOR * (x + y);
    
    [self updateControlValue:(self.lastControlValue + distance)];
}

- (IBAction)handleCellTrackingEnd:(SMTSpriteCell *)sender
{  
}


// =================================================================
// --- Draw
// =================================================================
- (void)drawRect:(NSRect)dirtyRect
{
    CGPoint pos = self.meta.pos;
    CGSize size = self.meta.size;
    
    CGFloat ratioWidth = dirtyRect.size.width/size.width;
    CGFloat ratioHeight = dirtyRect.size.height/size.height;
    
    if(self.scaleImage)
    {
        CGPoint scalePos = self.meta.scalePos;
        
        NSRect scaleRect = NSMakeRect(scalePos.x * ratioWidth, scalePos.y * ratioHeight, self.scaleImage.size.width * ratioWidth, self.scaleImage.size.height * ratioHeight);
    
        [self.scaleImage drawInRect:scaleRect fromRect:NSMakeRect(0.0, 0.0, self.scaleImage.size.width, self.scaleImage.size.height) operation:NSCompositingOperationSourceOver fraction:1.0];
    }
    
    NSRect knobRect = NSMakeRect(pos.x * ratioWidth, pos.y * ratioHeight, self.cell.image.size.width * ratioWidth, self.cell.image.size.width * ratioHeight);
    [self.cell drawWithFrame:knobRect inView:self];
}



@end
