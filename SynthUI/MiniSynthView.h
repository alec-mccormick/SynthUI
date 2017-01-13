//
//  MiniSynthView.h
//  MiniSynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMTSynthView.h"

@interface MiniSynthView : NSView

@property (strong, nonatomic) SMTSynthView* synthView;

//- (void)logRect:(NSRect)rect
//          title:(NSString*)title;

@end
