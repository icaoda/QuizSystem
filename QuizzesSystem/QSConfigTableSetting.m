//
//  QSConfigTableSetting.m
//  TestSystem
//
//  Created by SW05 on 1/11/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSConfigTableSetting.h"
#import "QSTools.h"

@interface QSConfigTableSetting ()

@property (nonatomic, strong) NSMutableArray *dataModel;

@end

@implementation QSConfigTableSetting

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)prepareDataModelForView:(QSAdministrator *)user {
    
    [self setUser:user];
    [self setDataModelWithData];
}

- (void)setDataModelWithData {
    // 创建数据模型，记录需要展示的信息
    NSArray *itemArray = @[@"judge",@"single",@"multiple",@"analysis",@"time"];
    NSArray *dataArray = [self parseDataFromServer];
    NSMutableArray *dataModel = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [dataModel addObject:itemArray[i]];
        [dataModel addObject:dataArray[2*i+1]];
        [dataModel addObject:dataArray[2*(i+1)]];
    }
    [dataModel removeLastObject];
    [dataModel addObject:@"N/A"];
    self.dataModel = dataModel;
}

- (NSArray *)parseDataFromServer {
    // 查询表单，获取设定
    NSString *key = [NSString stringWithFormat:@"department='%@'",self.user.department];
    NSArray *config = [self.user.mysql queryWithKey:key inSheet:@"Administrators_Configuration"];
    
    // 将设定信息传值给管理员对象
    [self.user setPaperWithSettings:config];
    return config;
}

- (NSString *)filterStringNotNumeric:(NSString *)str {
    // 过滤数据，如果不为数字，剔除
    for (int i=0; i<7; i++) {
        for (int j=0; j<[str length]; j++) {
            char c = [str characterAtIndex:j];
            if (c>'9' || c<'0') {
                [QSTools toolsGenerateAnAlertWithTitle:@"Please set as integer value!"];
                return nil;
            }
        }
    }
    return str;
}

#pragma mark - table view Data Source method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.dataModel count]/3;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row {
    
    NSUInteger index = [self.tableColumns indexOfObject:tableColumn];
    index = index + row * 3;
    return [self.dataModel objectAtIndex:index];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {NSLog(@"colums query &&&&&&*******&&&&&&");
    // 过滤传入的字符
    NSString *cellValue = [self filterStringNotNumeric:object];
    // 如果为空，则返回 不作处理
    if (cellValue == nil) {
        return;
    } else {
        // 不为空，修改数据模型，重新刷新表格
        NSUInteger column = [self.tableColumns indexOfObject:tableColumn];
        NSUInteger index = column + row * 3;
        // 修改数据库中的设定
        static NSString *sheet = @"Administrators_Configuration";
        NSString *queryKey = [NSString stringWithFormat:@"department='%@'",self.user.department];
        NSString *content = column==1 ? self.dataModel[row*3]
        : [NSString stringWithFormat:@"%@_score",self.dataModel[row*3]];
        // 修改考试时间
        content = [NSString stringWithFormat:@"%@=%@",content,cellValue];
        [self.user.mysql updateContents:content withKey:queryKey inSheet:sheet];
        
        // 修改表格
        self.dataModel[index] = cellValue;
        [self reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:row]
                                  columnIndexes:[NSIndexSet indexSetWithIndex:column]];
    }
}

#pragma mark - table view delegate method
- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSUInteger index = [self.tableColumns indexOfObject:tableColumn];
    if (index==0 || (index==2 && row==4)) {NSLog(@"&&&&& edit forbide");
        return NO;
    } else {
        return YES;
    }
}

@end
