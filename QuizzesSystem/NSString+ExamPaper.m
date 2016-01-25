//
//  NSString+ExamPaper.m
//  QSSupport
//
//  Created by SW05 on 11/27/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSTools.h"
#import "NSString+ExamPaper.h"

@implementation NSString (ExamPaper)


- (NSDictionary *)parseExamPaperFromFile:(NSString *)filePath {
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (str == nil) {
        [QSTools toolsGenerateAnAlertWithTitle:@"File Error, select agian!"];
        return nil;
    }
    NSRange rangeRefer = [str rangeOfString:@"Do DELETE All this INSTRUCTIONS"];
    if (rangeRefer.location != NSNotFound) str = [str substringFromIndex:rangeRefer.location];
    
    NSRange mark1 = [str rangeOfString:kKeyItem1];
    NSRange mark2 = [str rangeOfString:kKeyItem2];
    NSRange mark3 = [str rangeOfString:kKeyItem3];
    NSRange mark4 = [str rangeOfString:kKeyItem4];
    if (mark1.location == NSNotFound || mark2.location == NSNotFound ||
        mark3.location == NSNotFound || mark4.location == NSNotFound ) {
        // 弹窗提醒，退出
        [QSTools toolsGenerateAnAlertWithTitle:@"Part markString not found, please check your paper and reload!"];
        NSLog(@"题目关键字找不到，请核对试题。");
        return nil;
    }
    
    NSString *str1 = [str substringWithRange:NSMakeRange(mark1.location, mark2.location - mark1.location)];
    NSString *str2 = [str substringWithRange:NSMakeRange(mark2.location, mark3.location - mark2.location)];
    NSString *str3 = [str substringWithRange:NSMakeRange(mark3.location, mark4.location - mark3.location)];
    NSString *str4 = [str substringFromIndex:mark4.location];

    NSArray *array1 = [self divideStringIntoParts:str1];
    array1 = [self transferTureOrFalseStringIntoDictionary:array1];

    NSArray *array2 = [self divideStringIntoParts:str2];
    array2 = [self transferSingleStringIntoDictionary:array2];
    
    
    NSArray *array3 = [self divideStringIntoParts:str3];
    array3 = [self transferSingleStringIntoDictionary:array3];
    
    NSArray *array4 = [self divideStringIntoParts:str4];
    array4 = [self transferAnalysisStringIntoDictionary:array4];
    
    NSDictionary *dic = @{  kPaperKeyTrue   :   array1,
                            kPaperKeySing   :   array2,
                            kPaperKeyMult   :   array3,
                            kPaperKeyAnly   :   array4,
                          };
    return dic;
}

/*  单一的大题用 ".]" 字符串分割，得到每个小题的字段数组 */
- (NSArray *)divideStringIntoParts: (NSString *)str {
    
    NSArray *array = [str componentsSeparatedByString:@".]"];
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *ele in array) {
        if ([array indexOfObject:ele] == 0) continue;
        NSString *item = [NSString stringWithString:ele];
        if (item != nil) [mArray addObject:item];
    }
    return mArray;
}
/*    判断题拆分：判断题拆分为题目和答案两个字段  */
- (NSArray *)transferTureOrFalseStringIntoDictionary: (NSArray *)array {
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *ele in array) {
        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"[(|（].*[TF].*[)|）]"
                                                                          options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
        NSRange rangeBrackets = [regex rangeOfFirstMatchInString:ele options:NSMatchingReportCompletion range:NSMakeRange(0, [ele length])];
        if (rangeBrackets.location == NSNotFound) {
            [QSTools toolsGenerateAnAlertWithTitle: [NSString stringWithFormat:@"No bracket found in question{%@}!",ele]];
            NSLog(@"找不到答案");
        }
        
        NSString *answere = [ele substringWithRange:NSMakeRange(rangeBrackets.location + 1, rangeBrackets.length - 2)];
        NSRange rangeYes = [answere rangeOfString:@"T"];
        NSString *title = [ele substringToIndex:rangeBrackets.location];
        if (rangeYes.location == NSNotFound) {
            NSDictionary *dic = @{ kKeyTitle    :   title,
                                   kKeyAnswere  :   @"F",
                                   };
            [mArray addObject:dic];
        } else {
            NSDictionary *dic = @{ kKeyTitle     : title ,
                                   kKeyAnswere   : @"T",
                                   };
            [mArray addObject:dic];
        }
    }
    return mArray;
}

/*  分析题拆分：解析解答题     */
- (NSArray *)transferAnalysisStringIntoDictionary:(NSArray *)array {
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *ele in array) {
        NSString *str = [ele substringFromIndex:2];
        str = [self removeEnterCharactersOfString:ele];
        str = [self removePostfixedBlanksplace:str];
        [mArray addObject:str];
    }
    return mArray;
}

/*  选择题拆分：单选题拆分为题目、选项和答案三个字段 */
- (NSArray *)transferSingleStringIntoDictionary: (NSArray *)array {
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *ele in array) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        // 获取标题字段和答案字段
        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"[(|（].*[)|）]"
                                                                          options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
        NSRange rangeBrackets = [regex rangeOfFirstMatchInString:ele options:NSMatchingReportCompletion range:NSMakeRange(0, [ele length])];
        if (rangeBrackets.location == NSNotFound) {
            [QSTools toolsGenerateAnAlertWithTitle: [NSString stringWithFormat:@"No bracket found in question{%@}!",ele]];
            NSLog(@"答案缺失，");continue;
        }
        
        NSString *title = [ele substringToIndex:rangeBrackets.location];
        NSString *answere = [ele substringWithRange:NSMakeRange(rangeBrackets.location + 1,rangeBrackets.length - 2)];
        NSString *absolute = [[NSString alloc] init];
        for (int i = 0; i < [answere length]; i++) {
            char c = [answere characterAtIndex: i];
            if (c > 'D' || c < 'A') continue;
            NSString *charStr = [NSString stringWithFormat:@"%c",c];
            if ([absolute containsString:charStr] == NO) {
                absolute = [absolute stringByAppendingString:charStr];
            }
        }
        
        title = [self removePostfixedBlanksplace:title];
        [dic setObject:title forKey:kKeyTitle];
        [dic setObject:absolute forKey:kKeyAnswere];
        
        // 获取选项字段，处理为数组
        NSRange rangeA = [ele rangeOfString:@"A."];
        NSRange rangeB = [ele rangeOfString:@"B."];
        NSRange rangeC = [ele rangeOfString:@"C."];
        NSRange rangeD = [ele rangeOfString:@"D."];
        if (rangeA.location == NSNotFound || rangeB.location == NSNotFound ||
            rangeC.location == NSNotFound || rangeD.location == NSNotFound) {
            [QSTools toolsGenerateAnAlertWithTitle: [NSString stringWithFormat:@"Option key not found in question{%@}!",ele]];
            continue;
        }
        // 截取并处理optionA
        NSString *optionA = [ele substringWithRange:NSMakeRange(rangeA.location + rangeA.length,
                                                                rangeB.location - (rangeA.location + rangeA.length) )];
        // 截取并处理optionB
        NSString *optionB = [ele substringWithRange:NSMakeRange(rangeB.location + rangeB.length,
                                                                rangeC.location - (rangeB.location + rangeB.length) )];
        // 截取并处理optionC
        NSString *optionC = [ele substringWithRange:NSMakeRange(rangeC.location + rangeC.length,
                                                                rangeD.location - (rangeC.location + rangeC.length) )];
        // 截取并处理optionD
        NSString *optionD = [ele substringFromIndex:rangeD.location + rangeD.length];
        
        // 将中间的制表符换位回车
        optionA = [optionA stringByReplacingOccurrencesOfString:@"\t" withString:@" "];
        optionB = [optionB stringByReplacingOccurrencesOfString:@"\t" withString:@" "];
        optionC = [optionC stringByReplacingOccurrencesOfString:@"\t" withString:@" "];
        optionD = [optionD stringByReplacingOccurrencesOfString:@"\t" withString:@" "];
        
        // 移除其中的换行符
        optionA = [self removeEnterCharactersOfString:optionA];
        optionB = [self removeEnterCharactersOfString:optionB];
        optionC = [self removeEnterCharactersOfString:optionC];
        optionD = [self removeEnterCharactersOfString:optionD];
        
        // 移除其中的空格
        optionA = [self removePostfixedBlanksplace:optionA];
        optionB = [self removePostfixedBlanksplace:optionB];
        optionC = [self removePostfixedBlanksplace:optionC];
        optionD = [self removePostfixedBlanksplace:optionD];
        
        [dic setObject:@[optionA,optionB,optionC,optionD] forKey:kKeyOptions];
        [mArray addObject:dic];
    }
    return mArray;
}

/*  功能方法：用来去除字串中的换行符  */
- (NSString *)removeEnterCharactersOfString:(NSString *)str {
    
    NSRange rangeOfN = [str rangeOfString:@"\n"];
    if (rangeOfN.location != NSNotFound) {
        str = [str substringToIndex:rangeOfN.location];
    }
    
    NSRange rangeOfR = [str rangeOfString:@"\r"];
    if (rangeOfR.location != NSNotFound) {
        str = [str substringToIndex:rangeOfR.location];
    }
    
    NSRange rangeOfRN = [str rangeOfString:@"\r\n"];
    if (rangeOfRN.location != NSNotFound) {
        str = [str substringToIndex:rangeOfRN.location];
    }
    return str;
}

/*  功能方法：用来移除字符串后的空白行 */
- (NSString *)removePostfixedBlanksplace:(NSString *)str {
    
    NSInteger index = [str length];
    NSUInteger length = [str length];
    for (NSUInteger i=length-1; i>0; i--) {
        char c = [str characterAtIndex:i];
        if (c != ' ' && c != '\t') {
            index = i;
            break;
        }
    }
    if (index < length -1) {
        str = [str substringToIndex:index+1];
    }
    
    return str;
}


@end
