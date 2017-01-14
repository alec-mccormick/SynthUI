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
    return [self initWithFrame:frameRect withSize:SMT_CONTROL_SIZE_DEFAULT];
}

- (instancetype)initWithFrame:(NSRect)frameRect
                     withSize:(NSUInteger)size
{
    if(self = [super initWithFrame:frameRect])
    {
        self.controlValue = 0.0;
        self.lastControlValue = 0.0;
        
        self.cell = [SMTSpriteCell createKnobWithSize:size];
        [self.cell setTarget:self];
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
//    NSLog(@"Cell tracking start!");
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



@end
