//
//  QSQuizSelection.m
//  TestSystem
//
//  Created by SW05 on 1/15/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSQuizSelection.h"

@interface QSQuizSelection ()

@property (unsafe_unretained) IBOutlet NSTextView *title;

@property (weak) IBOutlet NSButton *optionA;

@property (weak) IBOutlet NSButton *optionB;

@property (weak) IBOutlet NSButton *optionC;

@property (weak) IBOutlet NSButton *optionD;

@end

@implementation QSQuizSelection

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
