//
//  SMTSynthView.h
//  SynthUI
//
//  Created by Alec McCormick on 1/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMTHeaderView.h"
#import "SMTPageKeyboardView.h"
#import "SMTPageOscillatorsView.h"
#import "SMTPageModulationView.h"
#import "SMTPageFiltersView.h"
#import "SMTPageFxView.h"

@interface SMTSynthView : NSView

@property (nonatomic) NSUInteger activePageIndex;

@property (strong, nonatomic) SMTHeaderView *headerView;
@property (strong, nonatomic) SMTPageKeyboardView *pageKeyboardView;
@property (strong, nonatomic) SMTPageOscillatorsView *pageOscillatorsView;
@property (strong, nonatomic) SMTPageModulationView *pageModulationView;
@property (strong, nonatomic) SMTPageFiltersView *pageFiltersView;
@property (strong, nonatomic) SMTPageFxView *pageFxView;

@end
