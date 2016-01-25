//
//  QSQuizAnalysis.h
//  TestSystem
//
//  Created by SW05 on 1/14/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// 数据模型，分析题数据类
@interface QSAnalysis : NSObject

@property (nonatomic, strong) NSString *score;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *answere;

@property (nonatomic, assign) CGFloat scoreGot;

- (instancetype)initWithScore:(NSString *)score title:(NSString *)title answer:(NSString *)answer;

@end

// 表单视图，分析题的视图容器
@interface QSQuizAnalysis : NSView

- (void)setContents:(QSAnalysis *)analysis;

@end
