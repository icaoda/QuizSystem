//
//  QSLoginViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//
#import "QSTools.h"
#import "Constants.h"
#import "QSLoginViewController.h"

@interface QSLoginViewController ()

@property (weak) IBOutlet NSTextField *noteLabel;

@property (weak) IBOutlet NSTextField *usrNameLable;

@property (weak) IBOutlet NSSecureTextField *passwordLabel;

@property (weak) IBOutlet NSButton *loginBtn;

@property (nonatomic, assign) BOOL isCurrentUserAdmn;

@end

@implementation QSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setIsCurrentUserAdmn:NO];
}

- (void)layoutForUser:(BOOL)isCurrentUserAdmn {
    if (isCurrentUserAdmn == YES) {
        [self.noteLabel setStringValue:@"Note: Login as Administrator, click Left Panel to Tester login."];
    } else {
        [self.noteLabel setStringValue:@"Note: Login as Tester, click Left Panel to tester Administrator."];
    }
    [self setIsCurrentUserAdmn:isCurrentUserAdmn];
}

- (void)actionPostLoginFail {
    
    NSString *title = [NSString stringWithFormat:@"Login as %@ Failed, Wrong password or UserName!",self.isCurrentUserAdmn ? @"Administrator" : @"Tester"];
    [QSTools toolsGenerateAnAlertWithTitle:title];
    
    [self.passwordLabel setStringValue:@""];
}

- (void)actionPostLoginOK {
    NSLog(@"%@ - user info %@",self,self.usr);
    NSString *infoValue = self.isCurrentUserAdmn==YES ? NSNotificationInfoAdmnSetting : NSNotificationInfoTestTest;
    NSDictionary *info = @{ NSNotificationInfoKey   :   infoValue   };NSLog(@"Info:--%@",info);
    NSNotification *notification = [NSNotification notificationWithName:NSNotificationRightPanel
                                                                 object:nil userInfo:info];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
   
}

- (IBAction)loginAsRegisted:(NSButton *)sender {
    
    NSLog(@"%@ - login btn click",self);
    NSDictionary *info = @{ NSNotificationInfoKeyUserName   :   [self.usrNameLable stringValue],
                            NSNotificationInfoKeyPassword   :   [self.passwordLabel stringValue]    };
    NSNotification *notification = [NSNotification notificationWithName:NSNotificationLoginPanel
                                                                 object:nil userInfo:info];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
