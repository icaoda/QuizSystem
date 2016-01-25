//
//  QSTools.h
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface QSTools : NSObject

+ (void)toolsGenerateAnAlertWithTitle:(NSString *)title;

+ (BOOL)toolsGenerateJudgeAlertWithTitle:(NSString *)title;

+ (NSArray *)toolsGeneraterRandomListFrom:(NSUInteger)fCount to:(NSUInteger)tCount;

@end
