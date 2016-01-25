//
//  QSRecordViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSTester.h"

@interface QSRecordViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

- (instancetype)initWithUser:(QSTester *)tester;

@end
