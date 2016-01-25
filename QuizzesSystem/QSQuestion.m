//
//  QSQuestion.m
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSQuestion.h"


/*------------------------------简单问答题类结构----------------------------*/
@implementation QSQuestion

- (instancetype)initWithTitle:(NSString *)title answer:(NSString *)answer {
    if (self = [super init]) {
        self.title = title;
        self.answer = answer;
    }
    return self;
}

- (BOOL)isAnswerMatched {
    
    if ([self.answer isEqualToString:self.userAnswer] == YES) {
        self.isMatch = YES;
        return YES;
    } else {
        self.isMatch = NO;
        return NO;
    }
}

@end
/*-----------------------------------------------------------------------*/


/*------------------------------选择题类结构-------------------------------*/
@implementation QSQuestionSelect

@end
/*-----------------------------------------------------------------------*/


/*------------------------------简答题类结构-------------------------------*/
@implementation QSQuestionAnalysis

@end
/*-----------------------------------------------------------------------*/