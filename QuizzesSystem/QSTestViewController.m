//
//  QSTestViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTestViewController.h"
#import "QSTestingTab.h"
#import "Constants.h"
#import "QSTools.h"

typedef NS_ENUM(NSUInteger, kViewTag) {
    kTagTimeElasped = 20,
    kTagTimeRemain,
    kTagFinishBtn,
};

@interface QSTestViewController ()

@property (weak) IBOutlet NSTextField *departmentLabel;
@property (weak) IBOutlet NSTextField *testerNameLabel;
@property (weak) IBOutlet NSTextField *userIDLabel;
@property (weak) IBOutlet NSTableView *table;

@property (nonatomic, strong) NSArray *dataModel;

@property (nonatomic, strong) NSTimer * timer;

@property (nonatomic, strong) NSDate *startDate;

@end

@implementation QSTestViewController

- (instancetype)initWithUsers:(QSTester *)user {
    if (self = [super initWithNibName:@"QSTestViewController" bundle:nil]) {
        self.user = user;
        NSLog(@"%@",self.user);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    // 连接Administrator_Configuration表单：获取试题设置
    [self.departmentLabel setStringValue:self.user.department];
    [self.userIDLabel setStringValue:self.user.userID];
    [self.testerNameLabel setStringValue:self.user.testerName];
    
    // 设置表单数据模型
    [self setDataModelForConfigTable];
    [self.table setDataSource:self];
    [self.table setDelegate:self];
}

- (void)setDataModelForConfigTable {
    
    // 查询配置表单，获取设定
    NSString *key = [NSString stringWithFormat:@"department='%@'",self.user.department];
    NSArray *config = [self.user.mysql queryWithKey:key inSheet:@"Administrators_Configuration"];
    // 将设定信息传值给考生对象
    [self.user setPaperWithSettings:config];
    
    // 构建数据模型
    NSUInteger   sumQty =   [config[1] integerValue] + [config[3] integerValue] +
                            [config[5] integerValue] + [config[7] integerValue];
    NSString    *sumQTY =   [NSString stringWithFormat:@"%lu",sumQty];
    
    NSUInteger sumScore =   [config[1] integerValue] * [config[2] integerValue] +
                            [config[3] integerValue] * [config[4] integerValue] +
                            [config[5] integerValue] * [config[6] integerValue] +
                            [config[7] integerValue] * [config[8] integerValue];
    NSString *sumSCORE = [NSString stringWithFormat:@"%lu",sumScore];
    
    NSArray *items = @[@"time",@"unread",@"judge",@"single",@"multiple",@"analysis",@"sumScore"];
    NSArray *mArray = @[    @[items[0], config[9],  @"N/A"],
                            @[items[1], config[10], @"N/A"],
                            @[items[2], config[1],  config[2]],
                            @[items[3], config[3],  config[4]],
                            @[items[4], config[5],  config[6]],
                            @[items[5], config[7],  config[8]],
                            @[items[6], sumQTY,     sumSCORE],
                            ];
    self.dataModel = mArray;
}

- (void)viewWillDisappear {
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setTestingTables {
    NSArray *nibs = [[NSArray alloc] init];
    [[NSBundle mainBundle] loadNibNamed:@"QSTestViewController"
                                  owner:nil topLevelObjects:&nibs];
    NSLog(@"************&&&&&&&&&*********");
    NSLog(@"%@",nibs);
    for (id nib in nibs) {
        if ([nib isMemberOfClass:[QSTestingTab class]]) {
            [(QSTestingTab *)nib setPaperWithPaper:self.user.paper];
            [self.view addSubview:nib positioned:NSWindowAbove relativeTo:nil];
            [[self.view.subviews lastObject] setFrame:CGRectMake(0, 20, 700, 500)];
        }
    }
}

- (void)setTimerLabels:(NSUInteger)time {
    
    // 添加标签：已用时间
    NSTextField *timeLabel1 = [[NSTextField alloc] initWithFrame:CGRectMake(150, 530, 90, 20)];
    [timeLabel1 setEditable:NO];
    [timeLabel1 setBordered:NO];
    [timeLabel1 setTextColor:[NSColor blackColor]];
    [timeLabel1 setStringValue:@"Time elapsed:"];
    [timeLabel1 setAlignment:NSTextAlignmentLeft];
    [self.view addSubview:timeLabel1];
    // 添加标签: 总时间
    NSTextField *timeLabel2 = [[NSTextField alloc] initWithFrame:CGRectMake(320, 530, 120, 20)];
    [timeLabel2 setEditable:NO];
    [timeLabel2 setBordered:NO];
    [timeLabel2 setTextColor:[NSColor blackColor]];
    [timeLabel2 setStringValue:[NSString stringWithFormat:@"Total %lu', remain:",time]];
    [timeLabel2 setAlignment:NSTextAlignmentRight];
    [self.view addSubview:timeLabel2];
    // 时间标签：动态标签3--已用时间
    NSTextField *timeLabel3 = [[NSTextField alloc] initWithFrame:CGRectMake(250, 530, 60, 20)];
    [timeLabel3 setEditable:NO];
    [timeLabel3 setBordered:NO];
    [timeLabel3 setTextColor:[NSColor blueColor]];
    [timeLabel3 setStringValue:@"0'"];
    [timeLabel3 setAlignment:NSTextAlignmentCenter];
    [timeLabel3 setTag:kTagTimeElasped];
    [self.view addSubview:timeLabel3];
    // 时间标签：动态标签4--剩余时间
    NSTextField *timeLabel4 = [[NSTextField alloc] initWithFrame:CGRectMake(450, 530, 40, 20)];
    [timeLabel4 setEditable:NO];
    [timeLabel4 setBordered:NO];
    [timeLabel4 setTextColor:[NSColor redColor]];
    [timeLabel4 setStringValue:[NSString stringWithFormat:@"%lu'",time]];
    [timeLabel4 setAlignment:NSTextAlignmentCenter];
    [timeLabel4 setTag:kTagTimeRemain];
    [self.view addSubview:timeLabel4];
    // 交卷按钮：提交试卷功能按钮
    NSButton *pudBtn = [[NSButton alloc] initWithFrame:CGRectMake(500, 520, 140, 20)];
    [pudBtn setTitle:@"Examination Over!"];
    [pudBtn setAlignment:NSTextAlignmentCenter];
    [pudBtn setTag:kTagFinishBtn];
    [pudBtn setTarget:self];
    [pudBtn setAction:@selector(finishedExamination)];
    [self.view addSubview:pudBtn];
    
}

- (BOOL)isThereAnyUnselectedQuiz {
    
    // 遍历所有判断题
    for (QSQuestion *quiz in self.user.paper.judgeQuestions) {
        if (quiz.userAnswer == nil) {NSLog(@"judge");
            return NO;
        }
    }
    // 遍历所有单选题
    for (QSQuestionSelect *quiz in self.user.paper.singleQuestions) {
        if (quiz.userAnswer == nil) {NSLog(@"single");
            return NO;
        }
    }
    // 遍历所有多选题
    for (QSQuestionSelect *quiz in self.user.paper.multipleQuestions) {
        if (quiz.userAnswer == nil) {NSLog(@"multiple");
            return NO;
        }
    }
    // 遍历所有多选题
    for (QSQuestionAnalysis *quiz in self.user.paper.analysisQuestions) {NSLog(@"%@--analysis answer:%@",quiz.title,quiz.userAnswer);
        if (quiz.userAnswer == nil) {NSLog(@"analysis");
            return NO;
        }
    }
    // 全部题目答完，返回YES
    return YES;
}

- (void)finishedExamination {
    NSLog(@"考完了！");
    
    // 全部题目答完，返回YES
    if (NO == [self isThereAnyUnselectedQuiz]) {
        [QSTools toolsGenerateAnAlertWithTitle:@"Please make sure all questions answered!"];
        return;
    }
    
    // 核算成绩
    NSUInteger sumScore = [self.user.paper calculateAnswersAndReturnScoreSum];
    [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"Congratulation! You got Score = %lu",sumScore]];
    
    // 停止计时器
    NSString *timeStamp = [[self.view viewWithTag:kTagTimeRemain] stringValue];
    NSUInteger timeElasped = self.user.paper.settings.time - [timeStamp integerValue];
    [self.user.paper.userRank setTime:timeElasped];
    [self.timer invalidate];
    self.timer = nil;
    
    // 上传成绩
    BOOL pudOK = [self.user puddingTestRecordToServer];
    if (pudOK == NO){
        [QSTools toolsGenerateAnAlertWithTitle:@"Pudding test record to server fail!"];
    }
    
    // 发送通知，跳转到成绩页面
    [self sendNotificationForPaperView];
}

- (void)sendNotificationForPaperView {
    
    NSDictionary *info = @{ NSNotificationInfoKey   :   NSNotificationInfoTestPaper   };NSLog(@"Info:--%@",info);
    NSNotification *notification = [NSNotification notificationWithName:NSNotificationRightPanel
                                                                 object:nil userInfo:info];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
}

- (void)updateTimerLabels:(NSTimer *)timer {
    
    NSDateComponents *datecomp = [[NSCalendar currentCalendar] components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond)
                                                                 fromDate:self.startDate
                                                                   toDate:[NSDate date]
                                                                  options:NSCalendarWrapComponents];
    NSString *timeStamp = [NSString stringWithFormat:@"%@:%@:%@",
                           (datecomp.hour < 10 ? [NSString stringWithFormat:@"0%ld",datecomp.hour]:[NSString stringWithFormat:@"%ld",datecomp.hour]),
                           (datecomp.minute < 10 ? [NSString stringWithFormat:@"0%ld",datecomp.minute]:[NSString stringWithFormat:@"%ld",datecomp.minute]),
                           (datecomp.second < 10 ? [NSString stringWithFormat:@"0%ld",datecomp.second]:[NSString stringWithFormat:@"%ld",datecomp.second])];
    NSLog(@"%@",timeStamp);
    [[self.view viewWithTag:kTagTimeElasped] setStringValue:timeStamp];
    timeStamp = [NSString stringWithFormat:@"%ld",(self.user.paper.settings.time - datecomp.hour * 60 - datecomp.minute)];
    [[self.view viewWithTag:kTagTimeRemain] setStringValue:timeStamp];
}

- (IBAction)startTesting:(NSButton *)sender {
    
    // 清除所有非顶部的控件
    for (NSView *view in [[self.view subviews] copy]) {
        if (view.tag != 10) {
            [view removeFromSuperview];
        }
    }
    // 调用测试者方法，生成试题
    [self.user generaterPaper];NSLog(@"%@ - paper generated!",self);
    
    // 添加题目Tab和交卷按钮
    [self setTestingTables];
    [self setTimerLabels:self.user.paper.settings.time];
    
    // 开始计时器，考试开始
    self.startDate = [NSDate date];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                                selector:@selector(updateTimerLabels:)
                                                userInfo:nil repeats:YES];
}

#pragma mark - config table Data Source
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    return [self.dataModel count];
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn
                     row:(NSInteger)row {
    
    NSArray *rowContent = [self.dataModel objectAtIndex:row];
    NSUInteger column   = [tableView.tableColumns indexOfObject:tableColumn];
    
    return [rowContent objectAtIndex:column];
}

#pragma mark - config table Delegate
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return NO;
}

@end
