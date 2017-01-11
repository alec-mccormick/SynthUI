//
//  NavigationView.m
//  SynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTNavigationView.h"

@implementation SMTNavigationView

- (IBAction)radioButtonClicked:(NSMatrix *)sender {
    NSInteger tag = [[sender selectedCell] tag];
    
    NSLog(@"Radio Button clicked! Tag:%li", (long)tag);
}

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if(self)
    {
//        NSButtonCell *prototype = [[NSButtonCell alloc] init];
//        [prototype setButtonType:NSRadioButton];
//        
//        NSRect matrixRect = NSMakeRect(0.0, 0.0, 300.0, 25.0);
//        NSMatrix *myMatrix = [[NSMatrix alloc] initWithFrame:matrixRect
//                                                        mode:NSRadioModeMatrix
//                                                   prototype:(NSCell *)prototype
//                                                numberOfRows:1
//                                             numberOfColumns:3];
//        [myMatrix setAction:@selector(radioButtonClicked:)];
//        [myMatrix setTarget:self];
//        [self addSubview:myMatrix];
//        
//        NSArray *cellArray = [myMatrix cells];
//        [[cellArray objectAtIndex:0] setTitle:@"Apples"];
//        [[cellArray objectAtIndex:1] setTitle:@"Oranges"];
//        [[cellArray objectAtIndex:2] setTitle:@"Pears"];
    }
    
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // --- Draw test color
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    
//    NSLog(@"Button state: %u", [self.testButton state]);
}

@end
