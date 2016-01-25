//
//  QSConfigTableSetting.h
//  TestSystem
//
//  Created by SW05 on 1/11/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSAdministrator.h"

@interface QSConfigTableSetting : NSTableView <NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) QSAdministrator *user;

- (void)prepareDataModelForView:(QSAdministrator *)user;

@end
