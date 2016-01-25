//
//  QSReviewViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSAdministrator.h"

@interface QSReviewViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

- (instancetype)initWithUser:(QSAdministrator *)administrator;

@end
