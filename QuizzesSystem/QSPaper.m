//
//  QSPaper.m
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSPaper.h"
#import "QSTools.h"

@implementation QSPaper

- (void)setPaperWithSettings:(NSArray *)setting {
    
    self.settings = [[QSConfiguration alloc] init];
    [self.settings setPaperWithSettings:setting];NSLog(@"[%@]-pass here",self);
}

- (void)generatorPaperWithMysql:(QSMysql *)mysql forDepart:(NSString *)department {
    
    // 创建、初始化用户考情类
    self.userRank = [[QSPaperCount alloc] initAsNull];
    
    // 创建判断题对象数组
    NSString *judgeSheet = [NSString stringWithFormat:@"%@_judge",department];
    NSUInteger judgeSum = [mysql querySumOfRowsInSheet:judgeSheet withAnyKey:@"id"];
    if (judgeSum == 0) {
        [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"No data in sheet %@",judgeSheet]];
        return;
    } else {
        if (judgeSum < self.settings.judgeCount)
            self.settings.judgeCount = judgeSum;
    }
    NSArray *randomArray = [QSTools toolsGeneraterRandomListFrom:judgeSum to:self.settings.judgeCount];NSLog(@"random judge: %@",randomArray);
    self.judgeQuestions = [NSMutableArray array];
    for (NSNumber *num in randomArray) {
        NSUInteger index = [num integerValue];
        
        NSArray *rowContents = [mysql queryWithIndex:index inSheet:judgeSheet];
        QSQuestion *quetion = [[QSQuestion alloc] initWithTitle:rowContents[1] answer:rowContents[2]];NSLog(@"question tilte: %@",quetion.title);
        [self.judgeQuestions addObject:quetion];
    }NSLog(@"%@ - judge part ok!",self);
    
    // 创建单选题对象数组
    NSString *singleSheet = [NSString stringWithFormat:@"%@_single",department];
    NSUInteger singleSum = [mysql querySumOfRowsInSheet:singleSheet withAnyKey:@"id"];NSLog(@"%@ - %lu",self,singleSum);
    if (singleSum == 0) {
        [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"No data in sheet %@",singleSheet]];
        return;
    } else {
        if (singleSum < self.settings.singleCount) {
            self.settings.singleCount = singleSum;
        }
    }
    randomArray = [QSTools toolsGeneraterRandomListFrom:singleSum to:self.settings.singleCount];NSLog(@"%@ -randomArr %@",self,randomArray);
    self.singleQuestions = [NSMutableArray array];
    for (NSNumber *num in randomArray) {NSLog(@"%@ -num- %@",self,num);
        NSUInteger index = [num integerValue];
        NSArray *rowContents = [mysql queryWithIndex:index inSheet:singleSheet];NSLog(@"%@ -rwocont- %@",self,rowContents);
        QSQuestionSelect *qusetion = [[QSQuestionSelect alloc] initWithTitle:rowContents[1] answer:rowContents[6]];
        qusetion.options = @[ rowContents[2],rowContents[3],rowContents[4],rowContents[5]];
        [self.singleQuestions addObject:qusetion];NSLog(@"single quest-%@",qusetion.title);
    }NSLog(@"%@ - single part ok!",self);
    
    // 创建多选题对象数组
    NSString *multipleSheet = [NSString stringWithFormat:@"%@_multiple",department];
    NSUInteger multipleSum = [mysql querySumOfRowsInSheet:multipleSheet withAnyKey:@"id"];
    if (multipleSum == 0) {
        [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"No data in sheet %@",multipleSheet]];
        return;
    } else {
        if (multipleSum < self.settings.singleCount) {
            self.settings.singleCount = singleSum;
        }
    }
    randomArray = [QSTools toolsGeneraterRandomListFrom:multipleSum to:self.settings.multipleCount];NSLog(@"%@ -randomArr %@",self,randomArray);
    self.multipleQuestions = [NSMutableArray array];
    for (NSNumber *num in randomArray) {
        NSUInteger index = [num integerValue];
        NSArray *rowContents = [mysql queryWithIndex:index inSheet:multipleSheet];
        QSQuestionSelect *question = [[QSQuestionSelect alloc] initWithTitle:rowContents[1] answer:rowContents[6]];
        question.options = @[ rowContents[2],rowContents[3],rowContents[4],rowContents[5]];
        [self.multipleQuestions addObject:question];NSLog(@"multi question - %@",question.title);
    }
    
    // 创建简单题对象数组
    NSString *analysisSheet = [NSString stringWithFormat:@"%@_analysis",department];
    NSUInteger analysisSum = [mysql querySumOfRowsInSheet:analysisSheet withAnyKey:@"id"];
    if (analysisSum == 0) {
        [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"No data in sheet %@",analysisSheet]];
        return;
    } else {
        if (analysisSum < self.settings.analysisCount) {
            self.settings.analysisCount = analysisSum;
        }
    }
    randomArray = [QSTools toolsGeneraterRandomListFrom:analysisSum to:self.settings.analysisCount];NSLog(@"%@ -randomArr %@",self,randomArray);
    self.analysisQuestions = [NSMutableArray array];
    for (NSNumber *num in randomArray) {
        NSUInteger index = [num integerValue];
        NSArray *rowContents = [mysql queryWithIndex:index inSheet:analysisSheet];
        QSQuestionAnalysis *question = [[QSQuestionAnalysis alloc] initWithTitle:rowContents[1] answer:nil];
        [self.analysisQuestions addObject:question];NSLog(@"analy question - %@",question.title);
    }
    
    NSLog(@"%@ - paper generated!",self);
}

- (NSUInteger)sumOfQuestions {
    
    NSUInteger sum = self.judgeQuestions.count + self.singleQuestions.count +
                     self.multipleQuestions.count + self.analysisQuestions.count;
    return sum;
}

- (NSUInteger)calculateAnswersAndReturnScoreSum {
    // 0.清空分数计数器
    [self.userRank emptyCounter];
    
    // 1.计算判断的得分情况
    for (QSQuestion *question in self.judgeQuestions) {
        question.isMatch = [question.userAnswer isEqualToString:question.answer];
        if (question.isMatch) {
            self.userRank.judgeCount += 1;
        }
    }
    // 2.计算单选题的得分情况
    for (QSQuestionSelect *question in self.singleQuestions) {
        question.isMatch = [question.userAnswer isEqualToString:question.answer];
        if (question.isMatch) {
            self.userRank.singleCount += 1;
        }
    }
    // 3.计算多选题的得分情况
    for (QSQuestionSelect *question in self.multipleQuestions) {
        question.isMatch = [question.userAnswer isEqualToString:question.answer];
        if (question.isMatch) {
            self.userRank.multipleCount += 1;
        }
    }
    NSUInteger score = self.settings.judgeScore * self.userRank.judgeCount +
                       self.settings.singleScore * self.userRank.singleCount +
                       self.settings.multipleScore * self.userRank.singleCount;
    NSLog(@"score= %lu, judge count = %lu,single Count = %lu, multi count = %lu",score,self.userRank.judgeCount,self.userRank.singleCount,self.userRank.multipleCount);
    
    return score;
}

@end
