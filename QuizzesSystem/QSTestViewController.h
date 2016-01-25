//
//  QSTestViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTester.h"
#import <Cocoa/Cocoa.h>

@interface QSTestViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) QSTester *user;

- (instancetype)initWithUsers:(QSTester *)user;

@end
