//
//  QSMultipleCell.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSMultipleCell.h"

@interface QSMultipleCell ()

@property (nonatomic, strong) QSQuestionSelect *question;

@property (weak) IBOutlet NSTextField *title;

@property (weak) IBOutlet NSButton *aBtn;
@property (weak) IBOutlet NSButton *bBtn;
@property (weak) IBOutlet NSButton *cBtn;
@property (weak) IBOutlet NSButton *dBtn;

@end

@implementation QSMultipleCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setContentsOfCell:(QSQuestionSelect *)question {
    
    self.question = question;
    self.aBtn.title = question.options[0];
    self.bBtn.title = question.options[1];
    self.cBtn.title = question.options[2];
    self.dBtn.title = question.options[3];
    
    NSString *title = [NSString stringWithFormat:@"Multiple: %@",question.title];
    self.title.stringValue = title;
}

- (IBAction)optionBtnClick:(NSButton *)sender {
    
    NSString *answer = [NSString stringWithFormat:@"%@%@%@%@",
                        self.aBtn.state != NSOffState ? @"A" : @"",
                        self.bBtn.state != NSOffState ? @"B" : @"",
                        self.cBtn.state != NSOffState ? @"C" : @"",
                        self.dBtn.state != NSOffState ? @"D" : @""];NSLog(@"anser = %@",answer);
    if ([answer isEqualToString:@""] == YES) {
        [self.question setUserAnswer:nil];
    } else {
        [self.question setUserAnswer:answer];
    }
    
    self.question.isMatch = [self.question.userAnswer isEqualToString:self.question.answer];
    NSLog(@"multi option is %@ ,match - %hhd",self.question.userAnswer,self.question.isMatch);
}


@end
