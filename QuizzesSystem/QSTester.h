//
//  QSTester.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSUser.h"
#import "QSPaper.h"

@interface QSTester : QSUser

@property (nonatomic, copy) NSString *testerName;

@property (nonatomic, strong) QSPaper *paper;

- (instancetype)initWithUserID:(NSString *)userID password:(NSString *)pw;

- (void)setPaperWithSettings:(NSArray *)setting;

- (void)generaterPaper;

- (BOOL)puddingTestRecordToServer;

@end
