//
//  QSSingleCell.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSSingleCell.h"

@interface QSSingleCell ()

@property (nonatomic, strong) QSQuestionSelect *question;

@property (weak) IBOutlet NSTextField *title;

@property (weak) IBOutlet NSButton *aBtn;
@property (weak) IBOutlet NSButton *bBtn;
@property (weak) IBOutlet NSButton *cBtn;
@property (weak) IBOutlet NSButton *dBtn;

@end

@implementation QSSingleCell

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
    
    NSString *title = [NSString stringWithFormat:@"Single: %@",question.title];
    self.title.stringValue = title;
}


- (IBAction)optionSelected:(NSButton *)sender {
    
    if (sender.state == NSOffState) {
        [self.question setUserAnswer:nil];NSLog(@"Judge option is %@",self.question.userAnswer);
        return;
    }
    
    switch (sender.tag) {
        case 1:
            [self.question setUserAnswer:@"A"];
            [[self viewWithTag:2] setState:NSOffState];
            [[self viewWithTag:3] setState:NSOffState];
            [[self viewWithTag:4] setState:NSOffState];
            break;
        case 2:
            [self.question setUserAnswer:@"B"];
            [[self viewWithTag:1] setState:NSOffState];
            [[self viewWithTag:3] setState:NSOffState];
            [[self viewWithTag:4] setState:NSOffState];
            break;
        case 3:
            [self.question setUserAnswer:@"C"];
            [[self viewWithTag:1] setState:NSOffState];
            [[self viewWithTag:2] setState:NSOffState];
            [[self viewWithTag:4] setState:NSOffState];
            break;
        case 4:
            [self.question setUserAnswer:@"D"];
            [[self viewWithTag:1] setState:NSOffState];
            [[self viewWithTag:2] setState:NSOffState];
            [[self viewWithTag:3] setState:NSOffState];
            break;
        default:
            break;
    }
    
    self.question.isMatch = [self.question.userAnswer isEqualToString:self.question.answer];
    NSLog(@"single option is %@ ,match - %hhd",self.question.userAnswer,self.question.isMatch);
}


@end
