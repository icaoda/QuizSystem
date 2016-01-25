//
//  QSTestingTab.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSTestingTab.h"
#import "QSTools.h"

@implementation QSTestingTab

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setPaperWithPaper:(QSPaper *)paper {
    
    self.paper = paper;
    
    [self.tableObj setDataModelForTable:self.paper];
    [self.tableObj setDataSource:self.tableObj];
    [self.tableObj setDelegate:self.tableObj];
    [self.tableObj reloadData];
    
    [self.tableSubj setDataModelForTable:self.paper];
    [self.tableSubj setDataSource:self.tableSubj];
    [self.tableSubj setDelegate:self.tableSubj];
    [self.tableSubj reloadData];
}

@end
