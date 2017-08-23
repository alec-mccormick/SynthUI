//
//  SMTDropdown.m
//  SynthUI
//
//  Created by Tiesto on 4/12/17.
//  Copyright © 2017 Sommaht. All rights reserved.
//

#import "SMTDropdown.h"

// =================================================================
// --- Private properties
// =================================================================
@interface SMTDropdown ()

- (void) updateAttributedTitle;

@end

@implementation SMTDropdown {
    NSColor *_color;
}

// =================================================================
// --- Initialization
// =================================================================

- (instancetype)initWithFrame:(NSRect)frameRect
{
    if(self = [self initWithFrame:frameRect pullsDown:YES])
    {
        self.color = [NSColor blackColor];
    }
    return self;
}

- (void) setColor:(NSColor *)color
{
    _color = color;
    [self updateAttributedTitle];
}
- (NSColor *) getColor
{
    return _color;
}

- (void) setTitle:(NSString *)title
{
    [super setTitle:title];
    [self updateAttributedTitle];
}

- (void) updateAttributedTitle
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.color, NSForegroundColorAttributeName, style, NSParagraphStyleAttributeName, nil];
    
    NSAttributedString *attrString = [[NSAttributedString alloc]initWithString:self.title attributes:attrsDictionary];
    [self setAttributedTitle:attrString];
}

// =================================================================
// --- Render
// =================================================================
- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
    
    [[NSColor darkGrayColor] setFill];
    NSRectFill(dirtyRect);

    
    [self.cell drawTitleWithFrame:dirtyRect inView:self];
}

@end
