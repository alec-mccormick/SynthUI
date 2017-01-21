    //
//  SMTControlKnob.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTControlKnob.h"
#import "SMTConstants.h"

// =================================================================
// --- Private properties
// =================================================================
@interface SMTControlKnob ()

@property (nonatomic) CGFloat lastControlValue;

@end

// =================================================================
// --- Initialization
// =================================================================
@implementation SMTControlKnob

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
        
        self.knobCell = [SMTSpriteCell createKnobWithSize:size];
        
        if(size == SMT_CONTROL_SIZE_SMALL)
        {
            self.cell = self.knobCell;
        }
        else
        {
            NSString *scaleSrc = (size == SMT_CONTROL_SIZE_LARGE) ? SMT_SRC_KNOB_SCALE_LARGE : SMT_SRC_KNOB_SCALE_MED;
            
            self.cell = [[NSCell alloc] initImageCell:[NSImage imageNamed:scaleSrc]];
        }
        
        [self.knobCell setTarget:self];
        self.continuous = YES;
        
    }
    return self;
}

- (void)updateControlValue:(CGFloat)newValue
{
    
    if(newValue > 100.0)
        self.controlValue = 100.0;
    else if(newValue < 0.0)
        self.controlValue = 0.0;
    else
        self.controlValue = newValue;
    
    [self.knobCell calcActiveFrame:self.controlValue];
    [self setNeedsDisplay:YES];
}
// =================================================================
// --- Actions/Events
// =================================================================
- (void)mouseDown:(NSEvent *)event
{
    [self.knobCell trackMouse:event inRect:self.frame ofView:self untilMouseUp:YES];
}

- (IBAction)handleCellTrackingStart:(SMTSpriteCell *)sender
{
//     NSLog(@"Cell tracking start!");
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



- (void)drawRect:(NSRect)dirtyRect
{
    NSLog(@"Draw Rect");
    

    if(self.cell != self.knobCell)
    {
//        [super drawRect:NSMakeRect(dirtyRect.origin.x, 50.0, dirtyRect.size.width, dirtyRect.size.height/2.0)];
        
        [self.cell drawWithFrame:NSMakeRect(0.0, 5.0, 161.0, 163.0) inView:self];
        [self.knobCell drawWithFrame:NSMakeRect(6.0, 0.0, 148.0, 148.0) inView:self];
    } else
    {
        [super drawRect:dirtyRect];
    }
}



@end
