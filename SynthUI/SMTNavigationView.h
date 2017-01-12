//
//  NavigationView.h
//  SynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SMTNavigationView : NSView

@property (strong, nonatomic) NSArray *tabTitles;

@property (strong, nonatomic) NSMatrix *tabMatrixView;


//-(void)buttonPressed;

@end
