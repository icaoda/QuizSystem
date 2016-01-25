//
//  QSPaperViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSPaperViewController.h"

@interface QSPaperViewController ()

@property (nonatomic, strong) QSTester *tester;

@property (nonatomic, strong) NSMutableArray *dataModel;

@property (weak) IBOutlet NSTextField *timeLabel;

@property (weak) IBOutlet NSTableView *table;


@end

@implementation QSPaperViewController

- (instancetype)initWithUsers:(QSTester *)tester {
    if (self = [super initWithNibName:@"QSPaperViewController" bundle:nil]) {
        self.tester = tester;NSLog(@"%@ init of %@",self,self.tester);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    // 设置代理
    [self.table setDataSource:self];
    [self.table setDelegate:self];
    // 设置标签，创建数据模型
    NSString *timeStr = [NSString stringWithFormat:@"Time: total %lu', cost %lu'",
                         self.tester.paper.settings.time,
                         self.tester.paper.userRank.time];
    [self.timeLabel setStringValue:timeStr];
    [self setDataModelFromPaper];
}

- (void)setDataModelFromPaper {
    
    NSMutableArray *mArray = [NSMutableArray array];
    [mArray addObject: @[@"Judge",
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.judgeCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.judgeCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.judgeScore],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.judgeCount *
                          self.tester.paper.settings.judgeScore] ]];
    [mArray addObject: @[@"Single",
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.singleCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.singleCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.singleScore],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.singleCount *
                          self.tester.paper.settings.singleScore] ]];
    [mArray addObject: @[@"Multiple",
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.multipleCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.multipleCount],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.settings.multipleScore],
                         [NSString stringWithFormat:@"%lu",self.tester.paper.userRank.multipleCount *
                          self.tester.paper.settings.multipleScore] ]];
    [mArray addObject: @[@"Total",
                         [NSString stringWithFormat:@"%lu",[mArray[0][1] integerValue] +
                                                           [mArray[1][1] integerValue] + [mArray[2][1] integerValue]],
                         [NSString stringWithFormat:@"%lu",[mArray[0][2] integerValue] +
                                                           [mArray[1][2] integerValue] + [mArray[2][2] integerValue]],
                         @"N/A",
                         [NSString stringWithFormat:@"%lu",[mArray[0][4] integerValue] +
                                                           [mArray[1][4] integerValue] + [mArray[2][4] integerValue]]
                         ]];
    self.dataModel = mArray;NSLog(@"data model set ---- %@",self.dataModel);
}

#pragma mark - table view Data Source
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.dataModel count];
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn
                     row:(NSInteger)row {
    NSArray *rowData = [self.dataModel objectAtIndex:row];
    NSUInteger colum = [self.table.tableColumns indexOfObject:tableColumn];
    return [rowData objectAtIndex:colum];
}

#pragma mark - table view Delegate
- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return NO;
}

@end
