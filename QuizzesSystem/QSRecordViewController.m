//
//  QSRecordViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSRecordViewController.h"

@interface QSRecordViewController ()

@property (nonatomic, strong) QSTester *tester;

@property (nonatomic, copy) NSArray *dataModel;

@property (weak) IBOutlet NSTableView *table;

@end

@implementation QSRecordViewController

- (instancetype)initWithUser:(QSTester *)tester {
    if (self = [super initWithNibName:@"QSRecordViewController" bundle:nil]) {
        self.tester = tester;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.table.dataSource = self;
    self.table.delegate = self;
    [self setDataModelWithKey:self.tester.userID];
}

- (void)setDataModelWithKey:(NSString *)key {
    
    NSString *searKey = [NSString stringWithFormat:@"user='%@'",key];
    NSArray *indexes = [self.tester.mysql queryRowIndexesForKey:searKey inSheet:@"Testers_Record"];
    if ([indexes count] == 0) {
        searKey = [NSString stringWithFormat:@"name='%@'",key];
        indexes = [self.tester.mysql queryRowIndexesForKey:searKey inSheet:@"Testers_Record"];
    }
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *index in indexes) {
        NSArray *row = [self.tester.mysql queryWithIndex:[index integerValue] inSheet:@"Testers_Record"];
        [mArray addObject:row];
    }
    self.dataModel = mArray;NSLog(@"********|%@|**********",self.dataModel);
}

#pragma mark - table view Data Source
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.dataModel count];
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn
                     row:(NSInteger)row {
    NSArray *rowData = [self.dataModel objectAtIndex:row];
    NSUInteger colum = [self.table.tableColumns indexOfObject:tableColumn];
    return [rowData objectAtIndex: colum+1];
}

#pragma mark - table view Delegate
- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return NO;
}

@end
