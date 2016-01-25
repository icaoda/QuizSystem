//
//  QSReviewViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSReviewViewController.h"
#import "QSTools.h"

/*----------------------------------------------------------------------------*/
/*              BreakLine: upper=data model below=view controller             */
/*----------------------------------------------------------------------------*/

@interface QSReviewViewController () 

@property (nonatomic, strong) QSAdministrator *user;

@property (nonatomic, strong) NSMutableArray *dataModel;

@property (weak) IBOutlet NSTextField *departLabel;

@property (weak) IBOutlet NSTextField *searchKey;

@property (weak) IBOutlet NSTableView *table;

@end

@implementation QSReviewViewController

- (instancetype)initWithUser:(QSAdministrator *)administrator {
    
    if (self=[super initWithNibName:@"QSReviewViewController" bundle:nil]) {
        self.user = administrator;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    // Set UI elements
    [self.departLabel setStringValue:self.user.department];
    self.table.dataSource = self;
    self.table.delegate = self;
}

- (void)setDataModelWithKey:(NSString *)key {
    
    NSString *searKey = [NSString stringWithFormat:@"user='%@'",key];
    NSArray *indexes = [self.user.mysql queryRowIndexesForKey:searKey inSheet:@"Testers_Record"];
    if ([indexes count] == 0) {
        searKey = [NSString stringWithFormat:@"name='%@'",key];
        indexes = [self.user.mysql queryRowIndexesForKey:searKey inSheet:@"Testers_Record"];
    }
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *index in indexes) {
        NSArray *row = [self.user.mysql queryWithIndex:[index integerValue] inSheet:@"Testers_Record"];
        [mArray addObject:row];
    }
    self.dataModel = mArray;NSLog(@"********|%@|**********",self.dataModel);
}

- (IBAction)searchBtnClick:(NSButton *)sender {
    
    if ([self.searchKey.stringValue isEqualToString:@""] == YES) {
        [QSTools toolsGenerateAnAlertWithTitle:@"No record found!"];
        self.dataModel = nil;
        [self.table reloadData];
    } else {
        [self setDataModelWithKey:self.searchKey.stringValue];
        [self.table reloadData];
    }
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
