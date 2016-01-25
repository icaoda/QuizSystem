//
//  QSJudgeCell.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSJudgeCell.h"

@interface QSJudgeCell ()

@property (nonatomic, strong) QSQuestion *question;

@property (weak) IBOutlet NSTextField *title;

@property (weak) IBOutlet NSButton *yesBtn;

@property (weak) IBOutlet NSButton *noBtn;

@end

@implementation QSJudgeCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setContentsOfCell:(QSQuestion *)question {
    
    self.question = question;
    
    NSString *title = [NSString stringWithFormat:@"Judge: %@",question.title];
    self.title.stringValue = title;
}

- (IBAction)optionSelected:(NSButton *)sender {
    
    if (sender.state == NSOffState) {
        self.question.userAnswer = nil;NSLog(@"Judge option is %@",self.question.userAnswer);
        return;
    }
    if (sender.tag == 0 ) {
        [self.question setUserAnswer:@"T"];
        [self.noBtn setState:NSOffState];
    } else if (sender.tag==1 ) {
        [self.question setUserAnswer:@"F"];
        [self.yesBtn setState:NSOffState];
    }
    
    self.question.isMatch = [self.question.userAnswer isEqualToString:self.question.answer];
    NSLog(@"Judge option is %@ ,match - %hhd",self.question.userAnswer,self.question.isMatch);
}


@end
