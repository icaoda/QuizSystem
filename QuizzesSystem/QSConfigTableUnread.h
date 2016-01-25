//
//  QSConfigTableUnread.h
//  TestSystem
//
//  Created by SW05 on 1/13/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSAdministrator.h"

@interface Item : NSObject

@property (nonatomic, strong) NSString *itemName;

@property (nonatomic, strong) NSMutableArray *children;

@end

@interface QSConfigTableUnread : NSOutlineView <NSOutlineViewDataSource, NSOutlineViewDelegate>

@property (nonatomic, strong) QSAdministrator *user;

@property (nonatomic, strong) NSString *selectedPaper;

- (void)prepareDataModelForView:(QSAdministrator *)user;

@end
