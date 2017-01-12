//
//  SMTButton.m
//  SynthUI
//
//  Created by Alec McCormick on 1/11/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTButton.h"
#import "SMTButtonCell.h"



@implementation SMTButton

- (instancetype) initWithFrame:(NSRect)frameRect
{
//    NSLog(@"init with frame ");
    
    if(self = [super initWithFrame:frameRect])
    {
        // --- Make new cell
        NSButtonCell *originalCell = [self cell];
        SMTButtonCell *customCell = [[SMTButtonCell alloc] init];
        customCell.bezelStyle = originalCell.bezelStyle;
        customCell.font = originalCell.font;
        customCell.title = originalCell.title;
        [customCell setEnabled:originalCell.isEnabled];
        
        [self setCell:customCell];   
    }
    
    return self;
}


- (instancetype) initWithFrame:(NSRect)frameRect
                         title:(NSString*)btnTitle
                        target:(id)target
                        action:(SEL)action
{
    if(self = [self initWithFrame:frameRect])
    {
        [self setTitle:btnTitle];
        [self setTarget:target];
        [self setAction:action];
    }
    
    return self;
}

+ (instancetype) buttonWithFrame:(NSRect)frameRect
                           title:(NSString*)btnTitle
                          target:(id)target
                          action:(SEL)action
{
    return [[self alloc] initWithFrame:frameRect title:btnTitle target:target action:action];
}

+ (instancetype) buttonWithFrame:(NSRect)frameRect
                          target:(id)target
                          action:(SEL)action
{
    return [[self alloc] initWithFrame:frameRect title:@"" target:target action:action];
}


@end
