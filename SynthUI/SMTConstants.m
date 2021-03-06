//
//  Constants.m
//  SynthUI
//
//  Created by Alec McCormick on 1/11/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMTConstants.h"

NSUInteger const SMT_CONTROL_SIZE_DEFAULT = SMT_CONTROL_SIZE_SMALL;
NSUInteger const SMT_BUTTON_SIZE_DEFAULT = SMT_CONTROL_SIZE_LARGE;
NSUInteger const SMT_BUTTON_STYLE_DEFAULT = SMT_BUTTON_STYLE_BLUE;

NSString *const SMT_SRC_BUTTON_BLUE_LARGE = @"button_big.png";
NSString *const SMT_SRC_BUTTON_BLUE_SMALL = @"button_small.png";
NSString *const SMT_SRC_BUTTON_ORANGE_LARGE = @"button_big_orange.png";
NSString *const SMT_SRC_BUTTON_ORANGE_SMALL = @"button_small_orange.png";

NSString *const SMT_SRC_KNOB_LARGE = @"knob_light_big_2x(1x128).png";
NSString *const SMT_SRC_KNOB_MED = @"knob_light_mid_2x(1x128).png";
NSString *const SMT_SRC_KNOB_SMALL = @"knob_light_small_2x(1x128).png";
NSString *const SMT_SRC_KNOB_SCALE_LARGE = @"knob_big_scale.png";
NSString *const SMT_SRC_KNOB_SCALE_MED  = @"knob_mid_scale.png";

NSInteger const SMT_NUM_FRAMES_BUTTON = 3;
NSInteger const SMT_NUM_FRAMES_KNOB = 128;

CGFloat const SMT_CONTROL_DRAG_DISTANCE_FACTOR = 0.5;


SMTControlKnobMeta const SMT_CONTROL_KNOB_META_LARGE = {
    .pos = {6.0, 0.0},
    .scalePos = {0.0, 5.0},
    .size = {161.0, 168.0}
};

SMTControlKnobMeta const SMT_CONTROL_KNOB_META_MED = {
    .pos = {4.0, 0.0},
    .scalePos = {0.0, 0.0},
    .size = {116.0, 112.0}
};

SMTControlKnobMeta const SMT_CONTROL_KNOB_META_SMALL = {
    .pos = {0.0, 0.0},
    .scalePos = {0.0, 0.0},
    .size = {56.0, 56.0}
};


NSString *const SMT_DROPDOWN_OPTIONS_OSC[] = {@"Sine", @"Saw", @"Square", @"Triangle"};
