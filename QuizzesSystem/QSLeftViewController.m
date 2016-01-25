//
//  QSLeftViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTools.h"
#import "Constants.h"
#import "QSLeftViewController.h"

typedef NS_ENUM(NSUInteger, kViewTag) {
    kTagTest = 1,
    kTagAdmin,
};

@interface QSLeftViewController ()

@end

@implementation QSLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)userLoginBtnClick:(NSButton *)sender {
    NSLog(@"%@ - button %li clicked!",self,(long)sender.tag);
    
    NSString *infoValue;
    switch (sender.tag) {
        case kTagTest:
            infoValue = NSNotificationInfoStartTest;break;
        case kTagAdmin:
            infoValue = NSNotificationInfoStartAdmn;break;
        default:
            break;
    }
    NSDictionary *info = @{ NSNotificationInfoKey : infoValue };
    NSNotification *notification = [NSNotification notificationWithName:NSNotificationLeftPanel
                                                                 object:nil
                                                               userInfo:info];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


@end
