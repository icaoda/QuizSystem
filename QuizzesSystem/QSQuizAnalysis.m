//
//  QSQuizAnalysis.m
//  TestSystem
//
//  Created by SW05 on 1/14/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import "QSQuizAnalysis.h"

// 数据模型，分析题数据类
@implementation QSAnalysis

- (instancetype)initWithScore:(NSString *)score
                        title:(NSString *)title answer:(NSString *)answer {
    if (self = [super init]) {
        self.score = score;
        self.title = title;
        self.answere = answer;
        self.scoreGot = -1.0;
    }
    return self;
}

@end


/*
 ---------------------------分割线-----------------------------
 */

// 表单视图，分析题的视图容器
@interface QSQuizAnalysis ()

@property (weak) IBOutlet NSTextField *totalScore;

@property (unsafe_unretained) IBOutlet NSTextView *gotScore;

@property (unsafe_unretained) IBOutlet NSTextView *title;

@property (unsafe_unretained) IBOutlet NSTextView *answer;

@property (nonatomic, strong) QSAnalysis *analysis;

@end

@implementation QSQuizAnalysis

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setContents:(QSAnalysis *)analysis {
    [self setAnalysis:analysis];
    [self.gotScore setString:@"0"];
    
    [self.title setString:[NSString stringWithFormat:@"Title: %@",self.analysis.title]];
    [self.answer setString:[NSString stringWithFormat:@"Answer: %@",self.analysis.answere]];
    
    
    NSString *scoreString = [NSString stringWithFormat:
                             @"Total Score: %@'",self.analysis.score];
    [self.totalScore setStringValue:scoreString];
}

- (NSString *)filterStringNotNumeric:(NSString *)str {
    // 过滤数据，如果不为数字，剔除
    for (int j=0; j<[str length]; j++) {
        char c = [str characterAtIndex:j];
        if (c>'9' || c<'0') {
            return nil;
        }
    }
    return str;
}

- (IBAction)scoreSetted:(NSButton *)sender {
    NSString *score = self.gotScore.string;
    // 如果有非数字符号，过滤
    if ([self filterStringNotNumeric:score] == nil) {
        self.gotScore.string = @"valid";
        self.gotScore.textColor = [NSColor blackColor];
        self.answer.textColor = [NSColor blackColor];
        self.title.textColor = [NSColor blackColor];
        return;
    }
    // 如果分值越界，过滤
    if ([score integerValue]<0 || [score integerValue]>[self.analysis.score integerValue]) {
        self.gotScore.string = @"valid";
        self.gotScore.textColor = [NSColor blackColor];
        self.answer.textColor = [NSColor blackColor];
        self.title.textColor = [NSColor blackColor];
        return;
    }
    // 合法，进行赋值
    self.analysis.scoreGot = [score integerValue];NSLog(@"%@",self.gotScore.backgroundColor);
    self.gotScore.textColor = [NSColor redColor];
    self.answer.textColor = [NSColor grayColor];
    self.title.textColor = [NSColor grayColor];
}


@end
