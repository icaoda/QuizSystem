//
//  QSPreferenceVC.m
//  TestSystem
//
//  Created by SW05 on 12/21/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#define kIPAddress @"ipAddress"
#import "QSPreferenceVC.h"

@interface QSPreferenceVC ()

@property (weak) IBOutlet NSTextField *ipLabel;

@end

@implementation QSPreferenceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self preferenceDictionary];
    [self.ipLabel setStringValue:[[self preferenceDictionary] objectForKey:kIPAddress]];
    [self.ipLabel setEnabled:NO];
}

- (IBAction)alterHostIPAddress:(NSButton *)sender {
    
    if (NO == self.ipLabel.enabled) {
        [self.ipLabel setEnabled:YES];
    } else {
        [self modifyIPConfigurationPlist:self.ipLabel.stringValue];
        [self.ipLabel setEnabled:NO];
    }
    
}

- (void)modifyIPConfigurationPlist:(NSString *)ip {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"QSConfiguration.plist" ofType:nil];
    NSDictionary *dic = [self preferenceDictionary];
    [dic setValue:ip forKey:kIPAddress];
    [dic writeToFile:plistPath atomically:NO];
}

- (NSDictionary *)preferenceDictionary {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"QSConfiguration.plist" ofType:nil];
    NSDictionary *dic   = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dic;
}

@end
