//
//  QSRightViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/5/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSRightViewController.h"
#import "Constants.h"
#import "QSTools.h"

typedef NS_ENUM(NSUInteger,kViewTag) {
    kTag_Admin_setting = 901,
    kTag_Admin_load,
    kTag_Admin_review,
    
    kTag_Test_test = 911,
    kTag_Test_paper,
    kTag_Test_record,
};

@interface QSRightViewController ()

@property (weak) IBOutlet NSButton *upBtnAtRight;

@property (weak) IBOutlet NSButton *midBtnAtRight;

@property (weak) IBOutlet NSButton *lowBtnAtRight;

@end

@implementation QSRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self layoutForTesting];
}

- (void)layoutForAdministrator {
    NSLog(@"%@ : Layout for administrator!",self);
    
    [self.upBtnAtRight setImage: [NSImage imageNamed:@"admin_setting_btn"]];
    [self.midBtnAtRight setImage:[NSImage imageNamed:@"admin_add_btn"]];
    [self.lowBtnAtRight setImage:[NSImage imageNamed:@"admin_review_btn"]];
    
    [self.upBtnAtRight setTag:kTag_Admin_setting];
    [self.midBtnAtRight setTag:kTag_Admin_load];
    [self.lowBtnAtRight setTag:kTag_Admin_review];
}

- (void)layoutForTesting {
    NSLog(@"%@ : Layout for testing!",self);
    
    [self.upBtnAtRight  setImage: [NSImage imageNamed:@"test_random_btn"]];
    [self.midBtnAtRight setImage:[NSImage imageNamed:@"test_type_btn"]];
    [self.lowBtnAtRight setImage:[NSImage imageNamed:@"test_paper_btn"]];
    
    [self.upBtnAtRight setTag:kTag_Test_test];
    [self.midBtnAtRight setTag:kTag_Test_paper];
    [self.lowBtnAtRight setTag:kTag_Test_record];
}

- (IBAction)functionalBtnClick:(NSButton *)sender {
    NSLog(@"%@ - button %li clicked!",self,sender.tag);
    NSLog(@"%@ - user add %@",self,[self.user class]);
    if (self.user.isLogin == NO) {
        [QSTools toolsGenerateAnAlertWithTitle:@"Please login first!"];
        return;
    }
    
    NSButton *configBtn = [self.view viewWithTag:kTag_Admin_setting];
    if (configBtn != nil) {
        [configBtn setImage:[NSImage imageNamed:@"admin_setting_btn"]];
    }
    
    NSString *infoValue;
    switch (sender.tag) {
        case kTag_Admin_setting:
            infoValue = NSNotificationInfoAdmnSetting; break;
        case kTag_Admin_load:
            infoValue = NSNotificationInfoAdmnLoading; break;
        case kTag_Admin_review:
            infoValue = NSNotificationInfoAdmnReview; break;
        case kTag_Test_test:
            infoValue = NSNotificationInfoTestTest; break;
        case kTag_Test_paper:
            infoValue = NSNotificationInfoTestPaper; break;
        case kTag_Test_record:
            infoValue = NSNotificationInfoTestRecord; break;
        default:
            break;
    }
    NSDictionary *info = @{ NSNotificationInfoKey   :   infoValue   };NSLog(@"Info:--%@",info);
    NSNotification *notification = [NSNotification notificationWithName:NSNotificationRightPanel
                                                                 object:nil userInfo:info];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


@end
