//
//  QSPaperScore.h
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSPaperCount : NSObject

@property (nonatomic, assign) NSUInteger judgeCount;

@property (nonatomic, assign) NSUInteger singleCount;

@property (nonatomic, assign) NSUInteger multipleCount;

@property (nonatomic, assign) NSUInteger analysisCount;

@property (nonatomic, assign) NSUInteger time;

- (instancetype)initAsNull;

- (void)emptyCounter;

@end


@interface QSConfiguration : QSPaperCount

@property (nonatomic, assign) NSUInteger judgeScore;

@property (nonatomic, assign) NSUInteger singleScore;

@property (nonatomic, assign) NSUInteger multipleScore;

@property (nonatomic, assign) NSUInteger analysisScore;

- (NSUInteger)totalScore;

- (void)setPaperWithSettings:(NSArray *)setting;

@end
