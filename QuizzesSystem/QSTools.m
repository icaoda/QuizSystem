//
//  QSTools.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTools.h"
#import <Cocoa/Cocoa.h>

@implementation QSTools

+ (void)toolsGenerateAnAlertWithTitle:(NSString *)title {
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:title];
//    [alert setIcon: [NSImage imageNamed:@"alert_login_admin"]];
    [alert runModal];
}

+ (BOOL)toolsGenerateJudgeAlertWithTitle:(NSString *)title {
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:title];
    [alert addButtonWithTitle:@"No"];
    [alert addButtonWithTitle:@"Yes"];
    
    NSModalResponse res = [alert runModal];
    return res == NSAlertFirstButtonReturn ? NO : YES ;
}

+ (NSArray *)toolsGeneraterRandomListFrom:(NSUInteger)fCount to:(NSUInteger)tCount {
    
    if (fCount > 1) {
        NSMutableArray *list = [NSMutableArray array];
        while (list.count < tCount) {
            NSUInteger random = arc4random() % fCount + 1;
            NSNumber *num = [NSNumber numberWithInteger:random];
            if ([list containsObject:num] == NO) {
                [list addObject:num];
            }
        }
        return list;
    } else {
        NSArray *array = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:1], nil];
        return array;
    }
}

@end
