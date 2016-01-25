//
//  ViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSSplitViewController.h"
#import "QSLeftViewController.h"
#import "QSRightViewController.h"
#import "QSMiddlePanel.h"
#import "Constants.h"

#import "QSUser.h"
#import "QSTester.h"
#import "QSAdministrator.h"

#import "QSTools.h"

@interface QSSplitViewController ()

@property (nonatomic, strong) QSUser *user;

@property (nonatomic, assign) BOOL isCurrentUserAdmn;

@end

@implementation QSSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSLog(@"hahah%@",self.splitViewItems);
    
    // 添加左侧视图控制器：用户切换面板
    QSLeftViewController *lvc = [[QSLeftViewController alloc] initWithNibName:@"QSLeftViewController" bundle:nil];
    NSSplitViewItem *lsplitItem = [NSSplitViewItem splitViewItemWithViewController:lvc];
    [self insertSplitViewItem:lsplitItem atIndex:0];
    
    // 添加中间视图控制器：登陆界面
    QSLoginViewController *mvc = [[QSLoginViewController alloc] initWithNibName:@"QSLoginViewController" bundle:nil];
    NSSplitViewItem *msplitItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
    [self insertSplitViewItem:msplitItem atIndex:1];
    
    // 添加右侧视图控制器：功能切换面板
    QSRightViewController *rmv = [[QSRightViewController alloc] initWithNibName:@"QSRightViewController" bundle:nil];
    [rmv setUser:self.user];
    NSSplitViewItem *rsplitItem = [NSSplitViewItem splitViewItemWithViewController:rmv];
    [self insertSplitViewItem:rsplitItem atIndex:2];
    
    // 注册通知中心：监测系统通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveLeftPanelAction:)
                                                 name:NSNotificationLeftPanel object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveRightPanelAction:)
                                                 name:NSNotificationRightPanel object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initializingUsers:)
                                                 name:NSNotificationLoginPanel object:nil];
    // 初始化属性
    self.isCurrentUserAdmn = NO;
}

- (void)initializingUsers:(NSNotification *)notification {
    
    NSString *password = [notification.userInfo objectForKey:NSNotificationInfoKeyPassword];
    NSString *userName = [notification.userInfo objectForKey:NSNotificationInfoKeyUserName];
    
    if (self.isCurrentUserAdmn == YES) {
        self.user = [[QSAdministrator alloc] initWithUserID:userName password:password];
    } else {
        self.user = [[QSTester alloc] initWithUserID:userName password:password];
    }
    [self.user login];
    // 如果登陆失败，弹窗提醒
    QSLoginViewController *mvc = (QSLoginViewController *)[self.splitViewItems objectAtIndex:1].viewController;
    if (self.user.isLogin == NO) {
        [mvc actionPostLoginFail];
    } else {
        // 如果登陆成功，将用户信息赋值给所有的子对象
        QSLoginViewController *lgvc = (QSLoginViewController *)[self.splitViewItems objectAtIndex:1].viewController;
        [lgvc setUsr:self.user];
        QSRightViewController *rvc = (QSRightViewController *)[self.splitViewItems objectAtIndex:2].viewController;
        [rvc setUser:self.user];
        [mvc setUsr:self.user];
        [mvc actionPostLoginOK];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)recieveLeftPanelAction:(NSNotification *)notification {
    NSLog(@"%@ - left panel action: %@",self,notification.userInfo[NSNotificationInfoKey]);
    self.user = [[QSUser alloc] init];
    [self.user setIsLogin:NO];
    
    NSString *notifInfo = [notification.userInfo objectForKey:NSNotificationInfoKey];
    QSLoginViewController *mvc = [[QSLoginViewController alloc] initWithNibName:@"QSLoginViewController" bundle:nil];
    NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
    [self removeSplitViewItem:[self.splitViewItems objectAtIndex:1]];
    [self insertSplitViewItem:mItem atIndex:1];
    
    if ([notifInfo isEqualToString:NSNotificationInfoStartAdmn] == YES) {
        // 中间视图：加载管理员登陆界面
        QSLoginViewController *mvc = (QSLoginViewController *)[self.splitViewItems objectAtIndex:1].viewController;
        [self setIsCurrentUserAdmn:YES];
        [mvc layoutForUser:self.isCurrentUserAdmn];
        
        // 右侧视图：加载管理员功能面板
        QSRightViewController *rmv = (QSRightViewController *)[self.splitViewItems objectAtIndex:2].viewController;
        [rmv layoutForAdministrator];
        [rmv.user setIsLogin:NO];
        
    } else {
        // 中间视图：加载测试登陆界面
        QSLoginViewController *mvc = (QSLoginViewController *)[self.splitViewItems objectAtIndex:1].viewController;
        [self setIsCurrentUserAdmn:NO];
        [mvc layoutForUser:self.isCurrentUserAdmn];
        
        // 右侧视图：加载测试功能面板
        QSRightViewController *rmv = (QSRightViewController *)[self.splitViewItems objectAtIndex:2].viewController;
        [rmv layoutForTesting];
        [rmv.user setIsLogin:NO];
    }
}

- (void)recieveRightPanelAction:(NSNotification *)notification {
    NSLog(@"%@ - right panel action: %@",self,notification.userInfo[NSNotificationInfoKey]);
    
     // 获取通知附带的信息，移除旧有的中间视图
    NSString *notifInfo = [notification.userInfo objectForKey:NSNotificationInfoKey];
    [self removeSplitViewItem:[self.splitViewItems objectAtIndex:1]];
    
    // 管理员设置面板：添加管理员设置视图
    if ([notifInfo isEqualToString:NSNotificationInfoAdmnSetting] == YES) {
        QSConfigViewController *mvc = [[QSConfigViewController alloc] initWithUser:(QSAdministrator *)self.user];
        NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
        [self insertSplitViewItem:mItem atIndex:1];
    } else {
        // 管理员导入面板：添加管理员daoru视图
        if ([notifInfo isEqualToString:NSNotificationInfoAdmnLoading] == YES) {
            QSLoadingViewController *mvc = [[QSLoadingViewController alloc] initWithUser:(QSAdministrator *)self.user];
            NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
            [self insertSplitViewItem:mItem atIndex:1];
        } else {
            // 管理员查看面板：添加管理员查看视图
            if ([notifInfo isEqualToString:NSNotificationInfoAdmnReview] == YES) {
                
                QSReviewViewController *mvc = [[QSReviewViewController alloc] initWithUser:(QSAdministrator *)self.user];
                NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
                [self insertSplitViewItem:mItem atIndex:1];
            } else {
                // 考生考试面板：添加考生考试视图
                if ([notifInfo isEqualToString:NSNotificationInfoTestTest] == YES) {
                    QSTestViewController *mvc = [[QSTestViewController alloc] initWithUsers:(QSTester *)self.user];
                    NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
                    [self insertSplitViewItem:mItem atIndex:1];
                } else {
                    // 考生试题面板：添加考生试题视图
                    if ([notifInfo isEqualToString:NSNotificationInfoTestPaper] == YES) {
                        QSPaperViewController *mvc = [[QSPaperViewController alloc] initWithUsers:(QSTester *)self.user];
                        NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
                        [self insertSplitViewItem:mItem atIndex:1];
                    } else {
                        // 考生考试记录面板：添加考生考试视图
                        if ([notifInfo isEqualToString:NSNotificationInfoTestRecord] == YES) {
                            QSRecordViewController *mvc = [[QSRecordViewController alloc] initWithUser:(QSTester *)self.user];
                            NSSplitViewItem *mItem = [NSSplitViewItem splitViewItemWithViewController:mvc];
                            [self insertSplitViewItem:mItem atIndex:1];
                        }
                    }
                }
            }
        }
    }
}

@end
