//
//  SMTButton.h
//  SynthUI
//
//  Created by Alec McCormick on 1/11/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SMTButton : NSButton

- (instancetype) initWithFrame:(NSRect)frameRect
                         title:(NSString*)btnTitle
                        target:(id)target
                        action:(SEL)action;

+ (instancetype) buttonWithFrame:(NSRect)frameRect
                         title:(NSString*)btnTitle
                        target:(id)target
                        action:(SEL)action;

+ (instancetype) buttonWithFrame:(NSRect)frameRect
                          target:(id)target
                          action:(SEL)action;

@end
