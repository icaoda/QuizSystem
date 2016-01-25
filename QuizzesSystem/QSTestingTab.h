//
//  QSTestingTab.h
//  TestSystem
//
//  Created by SW05 on 1/19/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSTestTableObjective.h"
#import "QSTestTableSubjective.h"
#import "QSPaper.h"

@interface QSTestingTab : NSTabView

@property (weak) IBOutlet QSTestTableObjective *tableObj;

@property (weak) IBOutlet QSTestTableSubjective *tableSubj;

@property (nonatomic, strong) QSPaper *paper;

- (void)setPaperWithPaper:(QSPaper *)paper;

@end
