//
//  QSUser.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSUser.h"

@implementation QSUser

- (instancetype)initWithUserID:(NSString *)userID password:(NSString *)pw {
    
    if (self = [super init]) {
        self.userID = userID;
        self.password = pw;
        self.mysql = [[QSMysql alloc] initWithIP:[self parseIPAddress]
                                        userName:@"root"
                                       passWords:@"123456"
                                        dataBase:@"exam"];
    }
    return self;
}

- (NSString *)parseIPAddress {
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"QSConfiguration.plist" ofType:nil];
    NSDictionary *configDic = [NSDictionary dictionaryWithContentsOfFile:resourcePath];
    NSLog(@".....[%@].....",configDic);
    return [configDic objectForKey:@"ipAddress"];
}

- (void)emptyAllProperties {
    self.userID = nil;
    self.password = nil;
    self.department = nil;
    self.isLogin = NO;
}

- (BOOL)login {
    NSLog(@"%@ - login! There is something wrong if you see this!",[self class]);
    return NO;
}



@end
