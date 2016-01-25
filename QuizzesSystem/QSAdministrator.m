//
//  QSAdministrator.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSAdministrator.h"

@implementation QSAdministrator

- (instancetype)initWithUserID:(NSString *)userID password:(NSString *)pw {
    if (self = [super initWithUserID:userID password:pw]) {
        NSLog(@"%@ - admin init here!",[self class]);
        self.isLogin = NO;
    }
    return self;
}

- (BOOL)login {
    
    NSString *queryKey = [NSString stringWithFormat:@"user='%@'",self.userID];
    NSArray *result = [self.mysql queryWithKey:queryKey inSheet:@"Administrators"];
    if (result != NULL && result[2] == self.password) { NSLog(@"%@ - login ok!",self);
        
        // 将查询结果赋值给管理员
        self.isLogin = YES;
        self.department = result[3];
        
        // 如果首次登录，则建立四张数据表
        BOOL create = [self.mysql createTablesForDepartment:self.department];
        if (create == YES) NSLog(@"%@ - create 4x new sheets for %@",self,self.department);
    } else {  NSLog(@"%@ - login failed!",self);
        self.isLogin = NO;
    }
    return self.isLogin;
}

- (void)setPaperWithSettings:(NSArray *)setting {
    
    self.paper = [[QSPaper alloc] init];
    [self.paper setPaperWithSettings:setting];NSLog(@"[%@]-pass",self);
}

@end
