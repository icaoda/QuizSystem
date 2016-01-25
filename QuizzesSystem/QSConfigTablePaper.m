//
//  QSConfigTablePaper.m
//  TestSystem
//
//  Created by SW05 on 1/15/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#define NSNotificationPaperSelected @"NSNotificationPaperSelected"
#define NSNotificationUnreadOK @"NSNotificationUnreadOK"
#define NSNotificationInfoKey @"NSNotificationInfoKey"

#import "QSConfigTablePaper.h"
#import "QSQuizAnalysis.h"
#import "QSTools.h"

@interface QSConfigTablePaper ()

@property (nonatomic, strong) NSMutableArray *dataModel;

@property (nonatomic, strong) NSString *paper;

@end

@implementation QSConfigTablePaper

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)prepareDataModelForView:(QSAdministrator *)user {
    [self setUser:user];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setDataModelWithData:)
                                                 name:NSNotificationPaperSelected object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scoredAndPuddingDataToServer)
                                                 name:NSNotificationUnreadOK object:nil];
}

- (void)setDataModelWithData:(NSNotification *)notify {NSLog(@"%@ recieved the notification!",self);
    // 解析通知，获取服务器数据
    self.paper = [notify.userInfo objectForKey:NSNotificationInfoKey];
    // 创建数据模型
    NSMutableArray *mArray = [NSMutableArray array];
    NSArray *indexes = [self.user.mysql queryRowIndexesForKey:@"score>0" inSheet:self.paper];
    for (NSString *index in indexes) {
        NSArray *row = [self.user.mysql queryWithIndex:[index integerValue] inSheet:self.paper];
        QSAnalysis *analysis = [[QSAnalysis alloc] initWithScore:row[1] title:row[2] answer:row[3]];
        [mArray addObject:analysis];NSLog(@"%@ - (%@,%@,%@)",self,analysis.score,analysis.title,analysis.answere);
    }
    // 赋值数据模型
    self.dataModel = mArray;NSLog(@"%@ set data model |%@|",self,self.dataModel);
    [self reloadData];
}

- (void)scoredAndPuddingDataToServer {
    CGFloat total = 0;
    for (QSAnalysis *quiz in self.dataModel) {
        if (quiz.scoreGot == -1) {
            [QSTools toolsGenerateAnAlertWithTitle:@"Please scored for all quizes!"];
            return;
        }
        total += quiz.scoreGot;
    }
    [self updatePaperStatesToServer:total];
}

- (void)updatePaperStatesToServer:(CGFloat)score {
    // 0. 解析表名，获取关键字
    NSArray *paperSheet = [self.paper componentsSeparatedByString:@"_"];
    NSString *user = paperSheet[0];
    NSString *time = paperSheet[1];
    
    // 1. 修改Testers_Record表格
    NSString *key = [NSString stringWithFormat:@"user='%@' and timeStamp='%@'",user,time];
    NSArray  *rowInRecord = [self.user.mysql queryWithKey:key inSheet:@"Testers_Record"];
    NSString *contents = [NSString stringWithFormat:@"unread='N'"];
    key = [NSString stringWithFormat:@"id=%@",rowInRecord[0]];
    [self.user.mysql updateContents:contents withKey:key inSheet:@"Testers_Record"];
    contents = [NSString stringWithFormat:@"score='%.0f'",score+[rowInRecord[6] integerValue]];
    [self.user.mysql updateContents:contents withKey:key inSheet:@"Testers_Record"];
    
    // 2. 修改Testers表格
    key = [NSString stringWithFormat:@"user='%@'",user];
    NSArray *rowInTesters = [self.user.mysql queryWithKey:key inSheet:@"Testers"];
    contents = [NSString stringWithFormat:@"unread='%lu'",[rowInTesters[5] integerValue]-1];
    [self.user.mysql updateContents:contents withKey:key inSheet:@"Testers"];
    
    // 3. 修改Administrators_Configuration表格
    key = [NSString stringWithFormat:@"department='%@'",rowInTesters[4]];
    NSArray *rowInAdminC = [self.user.mysql queryWithKey:key inSheet:@"Administrators_Configuration"];
    contents = [NSString stringWithFormat:@"unread='%lu'",[rowInAdminC[10] integerValue]-1];
    [self.user.mysql updateContents:contents withKey:key inSheet:@"Administrators_Configuration"];
    
    // 4. 删除答题表格
    [self.user.mysql dropTable:self.paper];
}

#pragma mark - table view Data Source method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {NSLog(@"^^^^^^^^^1^^^^^^^^|%lu|",[self.dataModel count]);
    return [self.dataModel count];
}

#pragma mark - table view Delegate method
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {NSLog(@"^^^^^^^^^3^^^^^^^^^");

    NSArray *nibs = [[NSArray alloc] init];
    [[NSBundle mainBundle] loadNibNamed:@"QSQuiz" owner:nil topLevelObjects:&nibs];
    NSLog(@"************&&&&&&&&&*********");
    NSLog(@"%@",nibs);
    
        QSQuizAnalysis *quizCell;
        for (id nib in nibs) {
            if ([nib isMemberOfClass:[QSQuizAnalysis class]]) {
                quizCell = nib;
                NSLog(@"*********|%@|********",nib);
            }
        }
        [quizCell setContents:self.dataModel[row]];
        return quizCell;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 300.0;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return NO;
}


@end
