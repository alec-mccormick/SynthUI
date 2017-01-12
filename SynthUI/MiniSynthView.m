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
        CGRect bounds = [self bounds];
        
        // --- Add Navigation bar
//        CGFloat navHeightPercentage = 0.06038647343; // 25px for 414px tall
//        CGFloat navHeight = navHeightPercentage * bounds.size.height;
        CGFloat navHeight = 50.0;
        CGRect navFrame = CGRectMake(0, bounds.size.height - navHeight, bounds.size.width, navHeight);
        self.navigationView = [[SMTNavigationView alloc] initWithFrame:navFrame];
        

        [self addSubview:self.navigationView];
        
        
//        SMTButton *btn = [SMTButton buttonWithFrame:NSMakeRect(25.0, 25.0, 169.0, 60.0)
//                                              title:@"testTitle"
//                                             target:self
//                                             action:@selector(buttonPressed)];
//        
//        [self addSubview:btn];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // --- Draw test color
    [[NSColor blackColor] setFill];
    NSRectFill(dirtyRect);
}



- (void)logRect:(NSRect)rect
          title:(NSString*)title
{
    NSLog(@"%@ x:%f, y:%f, width:%f, height:%f", title, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (IBAction)radioButtonClicked:(NSButton *)sender {
//    NSInteger tag = [[sender selectedCell] tag];
    
    NSLog(@"Radio Button clicked!");
}

-(void)buttonPressed {
    NSLog(@"Button pressed!");
    
    //Do what You want here...
}

@end
