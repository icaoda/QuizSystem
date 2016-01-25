//
//  QSLoginViewController.h
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSUser.h"

@interface QSLoginViewController : NSViewController

@property (nonatomic, strong) QSUser *usr;

- (void)layoutForUser:(BOOL)isCurrentUserAdmn;

- (void)actionPostLoginFail;

- (void)actionPostLoginOK;

@end
