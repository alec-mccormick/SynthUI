//
//  SMTSynthView.m
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTSynthView.h"
#import "SMTConstants.h"

@implementation SMTSynthView

// =================================================================
// --- Initialization
// =================================================================
- (id)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect])
    {
        // --- Variables
        self.activePageIndex = 0;
        
        // --- Init Views
        [self initializeHeaderView];
        [self initializePageViews];
        
        [self setFrame:frameRect];
    }
    
    return self;
}

- (void)initializeHeaderView
{
    self.headerView = [[SMTHeaderView alloc] init];
    
    [self.headerView.tabMatrixView setTarget:self];
    [self.headerView.tabMatrixView setAction:@selector(handleNavigationBarChanged:)];
    
    [self addSubview:self.headerView];
}

- (void)initializePageViews
{
    self.pageKeyboardView = [[SMTPageKeyboardView alloc] init];
    self.pageOscillatorsView = [[SMTPageOscillatorsView alloc] init];
    self.pageModulationView = [[SMTPageModulationView alloc] init];
    self.pageFiltersView = [[SMTPageFiltersView alloc] init];
    self.pageFxView = [[SMTPageFxView alloc] init];
    
    [self addSubview:[self getPage:self.activePageIndex]];
}

// =================================================================
// --- Internal functions
// =================================================================
- (NSView *)getPage:(NSUInteger)i
{
    switch(i)
    {
        case SYNTH_PAGE_KEYBOARD:
            return self.pageKeyboardView;
        case SYNTH_PAGE_OSC:
            return self.pageOscillatorsView;
        case SYNTH_PAGE_MOD:
            return self.pageModulationView;
        case SYNTH_PAGE_FILTERS:
            return self.pageFiltersView;
        case SYNTH_PAGE_FX:
            return self.pageFxView;
        default:
            return nil;
    }
}

- (void)setActivePage:(NSUInteger)i
{
    NSView *activePage = [self getPage:self.activePageIndex];
    NSView *newPage = [self getPage:i];
    
    self.activePageIndex = i;
    [self replaceSubview:activePage with:newPage];
}

// =================================================================
// --- Overwrites
// =================================================================
- (void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    
    // --- Add Navigation bar
    //        CGFloat navHeightPercentage = 0.06038647343; // 25px for 414px tall
    //        CGFloat navHeight = navHeightPercentage * bounds.size.height;
    CGFloat navHeight = 50.0;
    CGRect navFrame = CGRectMake(0, frame.size.height - navHeight, frame.size.width, navHeight);

    [self.headerView setFrame:navFrame];
    
    // --- Page Frame
    NSRect pageFrame = NSMakeRect(0.0, 0.0, frame.size.width, frame.size.height - navHeight);
    
    [self.pageKeyboardView setFrame:pageFrame];
    [self.pageOscillatorsView setFrame:pageFrame];
    [self.pageModulationView setFrame:pageFrame];
    [self.pageFiltersView setFrame:pageFrame];
    [self.pageFxView setFrame:pageFrame];
}

// =================================================================
// --- Actions/Events
// =================================================================
- (IBAction)handleNavigationBarChanged:(NSMatrix *)sender {
    NSInteger tag = [[sender selectedCell] tag];
    
//    NSLog(@"Radio Button clicked!! Tag:%li", (long)tag);
    [self setActivePage:tag];
}



@end
