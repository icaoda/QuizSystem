//
//  QSPaperViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSTester.h"

@interface QSPaperViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

- (instancetype)initWithUsers:(QSTester *)tester;

@end
