//
//  SMTSpriteCell.h
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SMTSpriteCell : NSCell

@property (nonatomic) NSInteger numFrames;
@property (nonatomic) NSInteger activeFrame;

- (instancetype)initImageCell:(NSImage *)image
                       frames:(NSInteger)frames;


- (void)calcActiveFrame:(CGFloat)value; //Expects a value between 0 -> 100
@end
