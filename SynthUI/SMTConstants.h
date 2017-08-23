//
//  Constants.h
//  SynthUI
//
//  Created by Alec McCormick on 1/11/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

enum
{
    SYNTH_PAGE_KEYBOARD,
    SYNTH_PAGE_OSC,
    SYNTH_PAGE_MOD,
    SYNTH_PAGE_FILTERS,
    SYNTH_PAGE_FX,
};

enum
{
    SMT_CONTROL_SIZE_SMALL,
    SMT_CONTROL_SIZE_MED,
    SMT_CONTROL_SIZE_LARGE
};

enum
{
    SMT_BUTTON_STYLE_BLUE,
    SMT_BUTTON_STYLE_ORANGE
};


typedef struct SMTControlKnobMeta
{
    CGPoint const pos;
    CGPoint const scalePos;
    CGSize const size;
} SMTControlKnobMeta;


FOUNDATION_EXPORT CGFloat const SMT_CONTROL_DRAG_DISTANCE_FACTOR;

FOUNDATION_EXPORT NSUInteger const SMT_CONTROL_SIZE_DEFAULT;
FOUNDATION_EXPORT NSUInteger const SMT_BUTTON_SIZE_DEFAULT;
FOUNDATION_EXPORT NSUInteger const SMT_BUTTON_STYLE_DEFAULT;

FOUNDATION_EXPORT NSString *const SMT_SRC_BUTTON_BLUE_LARGE;
FOUNDATION_EXPORT NSString *const SMT_SRC_BUTTON_BLUE_SMALL;
FOUNDATION_EXPORT NSString *const SMT_SRC_BUTTON_ORANGE_LARGE;
FOUNDATION_EXPORT NSString *const SMT_SRC_BUTTON_ORANGE_SMALL;
FOUNDATION_EXPORT NSString *const SMT_SRC_KNOB_LARGE;
FOUNDATION_EXPORT NSString *const SMT_SRC_KNOB_MED;
FOUNDATION_EXPORT NSString *const SMT_SRC_KNOB_SMALL;
FOUNDATION_EXPORT NSString *const SMT_SRC_KNOB_SCALE_LARGE;
FOUNDATION_EXPORT NSString *const SMT_SRC_KNOB_SCALE_MED;

FOUNDATION_EXPORT NSInteger const SMT_NUM_FRAMES_BUTTON;
FOUNDATION_EXPORT NSInteger const SMT_NUM_FRAMES_KNOB;

FOUNDATION_EXPORT SMTControlKnobMeta const SMT_CONTROL_KNOB_META_LARGE;
FOUNDATION_EXPORT SMTControlKnobMeta const SMT_CONTROL_KNOB_META_MED;
FOUNDATION_EXPORT SMTControlKnobMeta const SMT_CONTROL_KNOB_META_SMALL;

FOUNDATION_EXPORT NSString *const SMT_DROPDOWN_OPTIONS_OSC[];

#endif /* Constants_h */
