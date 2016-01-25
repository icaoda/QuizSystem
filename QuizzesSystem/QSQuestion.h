//
//  QSQuestion.h
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Foundation/Foundation.h>

/*-----------------------------------------------------------------------*/
/*------------------------------简单问答题类结构----------------------------*/
/*-----------------------------------------------------------------------*/

@interface QSQuestion : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *answer;

@property (nonatomic, copy) NSString *userAnswer;

@property (nonatomic, assign) BOOL isMatch;

- (instancetype)initWithTitle:(NSString *)title answer:(NSString *)answer;

- (BOOL)isAnswerMatched;

@end

/*-----------------------------------------------------------------------*/
/*------------------------------选择题类结构-------------------------------*/
/*-----------------------------------------------------------------------*/

@interface QSQuestionSelect : QSQuestion

@property (nonatomic, copy) NSArray *options;

@end

/*-----------------------------------------------------------------------*/
/*------------------------------简答题类结构-------------------------------*/
/*-----------------------------------------------------------------------*/

@interface QSQuestionAnalysis : QSQuestion

@end