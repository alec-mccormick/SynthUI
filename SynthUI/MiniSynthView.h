//
//  MiniSynthView.h
//  MiniSynthUI
//
//  Created by Tiesto on 1/10/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMTNavigationView.h"
//#import "SMTNavButtonCell.h"
#import "SMTButton.h"

@interface MiniSynthView : NSView

@property (strong, nonatomic) SMTNavigationView* navigationView;


- (void)logRect:(NSRect)rect
          title:(NSString*)title;

@end
