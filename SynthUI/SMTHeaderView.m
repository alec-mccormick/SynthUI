//
//  NavigationView.m
//  SynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTHeaderView.h"
#import "SMTButtonCell.h"

@implementation SMTHeaderView

// =================================================================
// --- Initialization
// =================================================================
- (id)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        // --- Variables
        self.tabTitles = @[@"Keyboard", @"Osc", @"Mod", @"Filters", @"Fx"];
        
        // --- Initialization
        self.tabMatrixView = [self initializeTabMatrixView];
        [self addSubview:self.tabMatrixView];
    }
    
    return self;
}

- (NSMatrix *)initializeTabMatrixView
{
    SMTButtonCell *prototype = [[SMTButtonCell alloc] init];
    prototype.isRadioButton = YES;
    
    // --- Derived variables
    NSUInteger count = [self.tabTitles count];
    
    // --- Create matrix
    NSMatrix *matrix = [[NSMatrix alloc] initWithFrame:NSZeroRect
                                                    mode:NSRadioModeMatrix
                                               prototype:prototype
                                            numberOfRows:1
                                         numberOfColumns:count];
    [matrix setTarget:self];
    [matrix setAction:@selector(handleNavigationBarChanged:)];

    // --- Setup titles & tags
    NSUInteger i = 0;
    for(NSButtonCell *cell in [matrix cells])
    {
        [cell setTitle:self.tabTitles[i]];
        [cell setTag:i];
        
        i++;
    }

    return matrix;
}

// =================================================================
// --- Overwrites
// =================================================================
- (void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    
    // --- Constants
    CGFloat btnWidth = 85.0;
    CGFloat btnHeight = 30.0;
    CGFloat rightPadding = 50.0;
    CGFloat intercellSpacing = 1.0;
    
    // --- Derived variables
    NSUInteger count = [self.tabTitles count];
    CGFloat tabMatrixWidth = (btnWidth + intercellSpacing) * count;

    [self.tabMatrixView setFrame:NSMakeRect((frame.size.width - tabMatrixWidth) - rightPadding, (frame.size.height - btnHeight)/2 , tabMatrixWidth, btnHeight)];
    [self.tabMatrixView setCellSize:NSMakeSize(btnWidth, btnHeight)];
    [self.tabMatrixView setIntercellSpacing:NSMakeSize(intercellSpacing, 0.0)];
}

// =================================================================
// --- Actions
// =================================================================
- (IBAction)handleNavigationBarChanged:(NSMatrix *)sender {
    NSInteger tag = [[sender selectedCell] tag];
    
    NSLog(@"Radio Button clicked! Tag:%li", (long)tag);
}

// =================================================================
// --- Render
// =================================================================
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // --- Draw test color
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    
//    NSLog(@"Button state: %u", [self.testButton state]);
}

@end
