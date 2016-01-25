//
//  QSTester.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTester.h"
#import "QSQuestion.h"

@implementation QSTester

- (instancetype)initWithUserID:(NSString *)userID password:(NSString *)pw {
    if (self = [super initWithUserID:userID password:pw]) {
        NSLog(@"user login");
        self.isLogin = NO;
    }
    return self;
}

- (BOOL)login {
    
    NSString *queryKey = [NSString stringWithFormat:@"user='%@'",self.userID];
    NSArray *result = [self.mysql queryWithKey:queryKey inSheet:@"Testers"];
    if (result != NULL && result[2] == self.password) {NSLog(@"%@ - login ok!",self);
        
        // 查询结果赋值给测试者
        self.isLogin = YES;
        self.testerName = result[3];
        self.department = result[4];
        
    } else {
        NSLog(@"%@ - login failed!",self);
        self.isLogin = NO;
    }
    return self.isLogin;
}

- (void)setPaperWithSettings:(NSArray *)setting {
    
    self.paper = [[QSPaper alloc] init];
    [self.paper setPaperWithSettings:setting];NSLog(@"[%@]-pass here",self);
}

- (void)generaterPaper {
    
    [self.paper generatorPaperWithMysql:self.mysql forDepart:self.department];
    NSLog(@"%@ - paper generated!",self);
    
}

- (NSString *)combineStringWithPrefix0:(NSUInteger)num {
    if (num > 10) {
        return [NSString stringWithFormat:@"%lu",num];
    } else {
        return [NSString stringWithFormat:@"0%lu",num];
    }
}

- (BOOL)puddingTestRecordToServer {
    
    BOOL puddingOK = YES;NSLog(@"puok - init -%hhd-",puddingOK);
    // 1.上传数据，Tester_Record表格：添加考试记录
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear|NSCalendarUnitMonth|
                                                                           NSCalendarUnitDay|NSCalendarUnitHour|
                                                                           NSCalendarUnitMinute|NSCalendarUnitSecond)
                                                                 fromDate:[NSDate date]];
    NSString *timeStamp = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                           [self combineStringWithPrefix0:dateComp.year],
                           [self combineStringWithPrefix0:dateComp.month],
                           [self combineStringWithPrefix0:dateComp.day],
                           [self combineStringWithPrefix0:dateComp.hour],
                           [self combineStringWithPrefix0:dateComp.minute],
                           [self combineStringWithPrefix0:dateComp.second]];
    NSArray *contents = @[ self.userID, self.testerName,
                           [NSString stringWithFormat:@"%lu",self.paper.settings.time],
                           [NSString stringWithFormat:@"%lu",self.paper.userRank.time],
                           [NSString stringWithFormat:@"%lu",[self.paper.settings totalScore]],
                           [NSString stringWithFormat:@"%lu",[self.paper calculateAnswersAndReturnScoreSum]],
                           timeStamp, @"Y", @"0"];
    if ([self.mysql insertRow:contents forTable:@"Testers_Record"]==NO) {
        puddingOK = NO;
    }
    
    // 2.上传数据，Testers表格：修改unread列
    NSString *key = [NSString stringWithFormat:@"user='%@'",self.userID];
    NSArray *rowInTesters = [self.mysql queryWithKey:key inSheet:@"Testers"];
    NSString *content = [NSString stringWithFormat:@"unread='%lu'",[rowInTesters[5] integerValue]+1];
    if ([self.mysql updateContents:content withKey:key inSheet:@"Testers"]==NO) {
        puddingOK = NO;
    }NSLog(@"puok - post testers -%hhd-",puddingOK);
    
    // 3.上传数据，Administrator_Config表格：修改unread列
    key = [NSString stringWithFormat:@"department='%@'",rowInTesters[4]];
    NSArray *rowInAdminC = [self.mysql queryWithKey:key inSheet:@"Administrators_Configuration"];
    content = [NSString stringWithFormat:@"unread='%lu'",[rowInAdminC[10] integerValue]+1];
    if ([self.mysql updateContents:content withKey:key inSheet:@"Administrators_Configuration"]==NO) {
        puddingOK = NO;
    }NSLog(@"puok - post config -%hhd-",puddingOK);
    
    // 4.上传数据，UserID_TimeStamp表格：添加表格
    NSString *tableName = [NSString stringWithFormat:@"%@_%@",self.userID,timeStamp];
    if ([self.mysql createAnalysisRecordTable:tableName]==NO) {
        puddingOK = NO;
    }NSLog(@"puok - post create analy -%hhd-",puddingOK);
    
    for (QSQuestionAnalysis *analy in self.paper.analysisQuestions) {
        contents = @[[NSString stringWithFormat:@"%lu",self.paper.settings.analysisScore],
                     analy.title, analy.userAnswer ];
        if ([self.mysql insertRow:contents intoAnalysisRecord:tableName]==NO) {
            puddingOK = NO;
        }NSLog(@"puok - post insert anal -%hhd-",puddingOK);
    }
    
    return puddingOK;
}

@end
