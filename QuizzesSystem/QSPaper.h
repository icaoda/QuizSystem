//
//  QSPaper.h
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSQuestion.h"
#import "QSPaperCount.h"
#import "QSMysql.h"

@interface QSPaper : NSObject
// 记录用户考试得分情况
@property (nonatomic, strong) QSPaperCount *userRank;
// 保存系统考卷设定
@property (nonatomic, strong) QSConfiguration *settings;
// 储存判断题数组，元素为QSQuestion对象
@property (nonatomic, strong) NSMutableArray *judgeQuestions;
// 储存单选题数组，元素为QSSelection对象
@property (nonatomic, strong) NSMutableArray *singleQuestions;
// 储存多选题数组，元素为QSSelection对象
@property (nonatomic, strong) NSMutableArray *multipleQuestions;

@property (nonatomic, strong) NSMutableArray *analysisQuestions;

- (void)setPaperWithSettings:(NSArray *)setting;

- (NSUInteger)sumOfQuestions;

- (NSUInteger)calculateAnswersAndReturnScoreSum;

- (void)generatorPaperWithMysql:(QSMysql *)mysql forDepart:(NSString *)department;

@end
