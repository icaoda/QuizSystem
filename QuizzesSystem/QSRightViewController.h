//
//  QSRightViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSUser.h"

@interface QSRightViewController : NSViewController

@property (nonatomic, strong) QSUser *user;

- (void)layoutForAdministrator;

- (void)layoutForTesting;

@end
