//
//  QSUser.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSMysql.h"

@interface QSUser : NSObject

@property (nonatomic, strong) QSMysql *mysql;

@property (nonatomic, copy) NSString *userID;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *department;

@property (nonatomic, assign) BOOL isLogin;

- (instancetype)initWithUserID:(NSString *)userID password:(NSString *)pw;

- (void)emptyAllProperties;

- (BOOL)login;

@end
