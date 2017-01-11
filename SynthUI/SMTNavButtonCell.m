//
//  SMTNavButtonCell.m
//  SynthUI
//
//  Created by Alec McCormick on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTNavButtonCell.h"


@implementation SMTNavButtonCell
-(id) init {
    self = [super init];
    if (self) {
//        NSImage *image = [NSImage imageNamed:@"button_big_uvi.png"];
        
        self.image = [NSImage imageNamed:@"button_big_uvi.png"];
        self.imagePosition = NSImageOnly;
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)decoder {
    return [super initWithCoder:decoder];
}
-(id) initImageCell:(NSImage *)image {
    return [super initImageCell:image];
}
-(id) initTextCell:(NSString *)string {
    return [super initTextCell:string];
}

- (NSRect)titleRectForBounds:(NSRect)theRect {
    NSRect titleFrame = [super titleRectForBounds:theRect];
//    NSSize titleSize = [[self attributedStringValue] size];
//    
//    titleFrame.origin.y = theRect.origin.y-(theRect.size.height-titleSize.height)*0.5;
//    
    return titleFrame;
}

@end
