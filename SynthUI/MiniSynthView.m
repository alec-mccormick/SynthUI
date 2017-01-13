//
//  MiniSynthView.m
//  MiniSynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "MiniSynthView.h"

@implementation MiniSynthView


- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if(self)
    {
        self.synthView = [[SMTSynthView alloc] initWithFrame:frameRect];
        [self addSubview:self.synthView];
    }
    
    return self;
}



//- (void)logRect:(NSRect)rect
//          title:(NSString*)title
//{
//    NSLog(@"%@ x:%f, y:%f, width:%f, height:%f", title, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//}



@end
