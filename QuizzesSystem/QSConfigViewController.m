//
//  QSSettingPaperViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#define NSNotificationUnreadOK @"NSNotificationUnreadOK"

#import "QSConfigViewController.h"
#import "QSConfigTableSetting.h"
#import "QSConfigTableUnread.h"
#import "QSConfigTablePaper.h"
#import "QSTools.h"

@interface QSConfigViewController ()

@property (nonatomic, strong) QSAdministrator *user;

@property (weak) IBOutlet QSConfigTableSetting *settingTable;

@property (weak) IBOutlet QSConfigTableUnread *unreadTable;

@property (weak) IBOutlet QSConfigTablePaper *paperTable;

@property (weak) IBOutlet NSTextField *departLabel;

@property (weak) IBOutlet NSTextField *adminLabel;

@end

@implementation QSConfigViewController

- (instancetype)initWithUser:(QSAdministrator *)user {
    if (self = [super initWithNibName:@"QSConfigViewController" bundle:nil]) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 为设置表格加载数据模型
    [self.settingTable prepareDataModelForView:self.user];
    [self.settingTable setDataSource:self.settingTable];
    [self.settingTable setDelegate:self.settingTable];
    
    // 为未读表格加载数据模型
    [self.unreadTable prepareDataModelForView:self.user];
    [self.unreadTable setDataSource:self.unreadTable];
    [self.unreadTable setDelegate:self.unreadTable];
    
    // 为试题表格加载数据模型
    [self.paperTable prepareDataModelForView:self.user];
    [self.paperTable setDataSource:self.paperTable];
    [self.paperTable setDelegate:self.paperTable];
    
    // 设置静态的控件
    [self.adminLabel setStringValue:self.user.userID];
    [self.departLabel setStringValue:self.user.department];
}

- (IBAction)puddingToServer:(NSButton *)sender {
    NSNotification *notify = [NSNotification notificationWithName:NSNotificationUnreadOK object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notify];
}

@end
