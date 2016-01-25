//
//  QSTestTableObjective.h
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSPaper.h"

@interface QSTestTableObjective : NSTableView <NSTableViewDataSource, NSTableViewDelegate>

- (void)setDataModelForTable:(QSPaper *)paper;

@end
