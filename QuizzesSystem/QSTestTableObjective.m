//
//  QSTestTableObjective.m
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSTestTableObjective.h"
#import "QSJudgeCell.h"
#import "QSSingleCell.h"
#import "QSMultipleCell.h"

@interface QSTestTableObjective ()

@property (nonatomic, strong) QSPaper *paper;

@end

@implementation QSTestTableObjective

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
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    return [self.paper.judgeQuestions count] +
           [self.paper.singleQuestions count] +
           [self.paper.multipleQuestions count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    // 判断row的类型
    if (row < [self.paper.judgeQuestions count]) {
        QSJudgeCell *cell = [self filterArrayWithTarget:[QSJudgeCell class]];
        NSUInteger index = row;
        [cell setContentsOfCell:self.paper.judgeQuestions[index]];
        return cell;
    } else
        if (row < [self.paper.judgeQuestions count] + [self.paper.singleQuestions count]) {
            QSSingleCell *cell = [self filterArrayWithTarget:[QSSingleCell class]];
            NSUInteger index = row - [self.paper.judgeQuestions count];
            [cell setContentsOfCell:self.paper.singleQuestions[index]];
            return cell;
        } else {
            QSMultipleCell *cell = [self filterArrayWithTarget:[QSMultipleCell class]];
            NSUInteger index = row - [self.paper.judgeQuestions count] - [self.paper.singleQuestions count];
            [cell setContentsOfCell:self.paper.multipleQuestions[index]];
            return cell;
        }
    
    // 如果为空返回空
    return nil;
}

#pragma mark - table view Delegate method
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return NO;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 200.0;
}

@end
