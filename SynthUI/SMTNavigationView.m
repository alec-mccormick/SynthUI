//
//  NavigationView.m
//  SynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTNavigationView.h"
#import "SMTButtonCell.h"

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
        // --- Variables
        self.tabTitles = @[@"Keyboard", @"Osc", @"Mod", @"Filters", @"Fx"];
        
        // --- Initialization
        [self initTabMatrixView];
    }
    
    return self;
}

- (void)initTabMatrixView
{
    SMTButtonCell *prototype = [[SMTButtonCell alloc] init];
    prototype.isRadioButton = YES;
    
    // --- Constants
    CGFloat btnWidth = 85.0;
    CGFloat btnHeight = 30.0;
    CGFloat rightPadding = 25.0;
    CGFloat intercellSpacing = 1.0;
    
    // --- Derived variables
    NSRect frame = [self bounds];
    CGFloat tabMatrixWidth = (btnWidth + intercellSpacing) * [self.tabTitles count];
    
    
    // --- Create matrix
    NSMatrix *matrix = [[NSMatrix alloc] initWithFrame:NSMakeRect((frame.size.width - tabMatrixWidth) - rightPadding, (frame.size.height - btnHeight)/2 , tabMatrixWidth, btnHeight)
                                                    mode:NSRadioModeMatrix
                                               prototype:prototype
                                            numberOfRows:1
                                         numberOfColumns:[self.tabTitles count]];
    [matrix setAction:@selector(radioButtonClicked:)];
    [matrix setTarget:self];
    [matrix setCellSize:NSMakeSize(btnWidth, btnHeight)];
    [matrix setIntercellSpacing:NSMakeSize(intercellSpacing, 0.0)];
    
    // --- Setup titles & tags
    NSUInteger i = 0;
    for(NSButtonCell *cell in [matrix cells])
    {
        [cell setTitle:[self.tabTitles objectAtIndex:i]];
        [cell setTag:i];
        
        i++;
    }
    
    
    // --- Add subview
    self.tabMatrixView = matrix;
    [self addSubview:matrix];
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // --- Draw test color
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    
//    NSLog(@"Button state: %u", [self.testButton state]);
}

@end
