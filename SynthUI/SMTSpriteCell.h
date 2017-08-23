//
//  SMTSpriteCell.h
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SMTSpriteCell : NSCell

@property(nonatomic) NSInteger numFrames;
@property(nonatomic) NSInteger activeFrame;

@property(nonatomic) CGFloat frameWidth;
@property(nonatomic) CGFloat frameHeight;

@property(nonatomic) NSPoint startPoint;
@property(nonatomic) NSPoint *currentPoint;
@property(nonatomic) NSPoint endPoint;

+ (instancetype)createKnob;
+ (instancetype)createKnobWithSize:(NSUInteger)size;
+ (instancetype)createButton;
+ (instancetype)createButtonWithSize:(NSUInteger)size;
+ (instancetype)createButtonWithSize:(NSUInteger)size
                               style:(NSUInteger)style;

- (instancetype)initImageCell:(NSImage *)image
                       frames:(NSInteger)frames;



- (void)calcActiveFrame:(CGFloat)value; //Expects a value between 0 -> 100
@end
