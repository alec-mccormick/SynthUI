//
//  SMTControlKnob.h
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMTSpriteCell.h"

@interface SMTControlKnob : NSControl

//@property (strong) SMTSpriteCell *cell;
@property (nonatomic) CGFloat controlValue;

@property (strong) SMTSpriteCell *knobCell;

- (instancetype)initWithFrame:(NSRect)frameRect
                         size:(NSUInteger)size;

- (void)updateControlValue:(CGFloat)newValue;

- (IBAction)handleCellTrackingStart:(SMTSpriteCell *)sender;
- (IBAction)handleCellTrackingContinue:(SMTSpriteCell *)sender;
- (IBAction)handleCellTrackingEnd:(SMTSpriteCell *)sender;

@end
