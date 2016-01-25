//
//  QSAnalysisCell.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSAnalysisCell.h"

@interface QSAnalysisCell ()

@property (nonatomic, strong) QSQuestionAnalysis *question;

@property (unsafe_unretained) IBOutlet NSTextView *title;

@property (unsafe_unretained) IBOutlet NSTextView *answer;

@end

@implementation QSAnalysisCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setContentsOfCell:(QSQuestionAnalysis *)question {
    
    self.question = question;
    NSString *title = [NSString stringWithFormat:@"Analysis: %@",self.question.title];
    [self.title setString:title];
    [self.answer setString:@""];
}

- (IBAction)okBtnClick:(NSButton *)sender {
    
    if (self.answer.editable == YES) {
        
        self.answer.textColor = [NSColor grayColor];
        self.question.userAnswer = self.answer.string;
        self.answer.editable = NO;
    } else {
        
        self.answer.textColor = [NSColor blackColor];
        self.question.userAnswer = nil;
        self.answer.editable = YES;
    }
    NSLog(@"answer -- %@",self.question.userAnswer);
}


@end
