//
//  QSTableViewSubjective.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSTestTableSubjective.h"
#import "QSAnalysisCell.h"

@interface QSTestTableSubjective ()

@property (nonatomic, strong) QSPaper *paper;

@end

@implementation QSTestTableSubjective

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setDataModelForTable:(QSPaper *)paper {
    
    self.paper = paper;
}

- (id)filterArrayWithTarget:(id)type {
    
    NSArray *nibs = [[NSArray alloc] init];
    [[NSBundle mainBundle] loadNibNamed:@"QSTestViewController" owner:nil topLevelObjects:&nibs];
    NSLog(@"***1111*********&&&&&&&&&*********");
    NSLog(@"%@",nibs);
    
    for (id nib in nibs) {
        NSLog(@"%@-- type --%@",nib,type);
        if ([nib isMemberOfClass:type] == YES) {
            NSLog(@"-------%@",nib);
            return nib;
        }
    }
    return nil;
}

#pragma mark - table view Data Source method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {NSLog(@"答复都是拉风的经适房 -- %lu",[self.paper.analysisQuestions count]);
    
    return [self.paper.analysisQuestions count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    // 判断row的类型
    QSAnalysisCell *cell = [self filterArrayWithTarget:[QSAnalysisCell class]];
    [cell setContentsOfCell:self.paper.analysisQuestions[row]];
    
    // 如果为空返回空
    return cell;
}

#pragma mark - table view Delegate method
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return NO;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 200.0;
}


@end
