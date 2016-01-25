//
//  NSString+ExamPaper.h
//  QSSupport
//
//  Created by SW05 on 11/27/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#define kKeyTitle @"title"
#define kKeyOptions @"options"
#define kKeyAnswere @"answere"
#define kKeyItem1 @"[一、判断题]"
#define kKeyItem2 @"[二、单选题]"
#define kKeyItem3 @"[三、多选题]"
#define kKeyItem4 @"[四、解答题]"
#define kPaperKeyTrue @"kPaperKeyTrue"
#define kPaperKeySing @"kPaperKeySing"
#define kPaperKeyMult @"kPaperKeyMult"
#define kPaperKeyAnly @"kPaperKeyAnly"

#import <Foundation/Foundation.h>

@interface NSString (ExamPaper)

- (NSDictionary *)parseExamPaperFromFile:(NSString *)filePath;

@end
