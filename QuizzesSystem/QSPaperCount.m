//
//  QSPaperScore.m
//  QuizzesSystem
//
//  Created by SW05 on 12/8/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSPaperCount.h"

@implementation QSPaperCount

- (instancetype)initAsNull {
    if (self = [super init]) {
        [self emptyCounter];
    }
    return self;
}

- (void)emptyCounter {
    self.judgeCount = 0;
    self.singleCount = 0;
    self.multipleCount = 0;
    self.analysisCount = 0;
    self.time = 0;
}

@end

@implementation QSConfiguration

- (NSUInteger)totalScore {
    return (self.judgeCount     *  self.judgeScore  +
            self.singleCount    *  self.singleScore +
            self.multipleCount  *    self.multipleScore);
}

- (void)setPaperWithSettings:(NSArray *)setting {NSLog(@"[%@]-pass here",self);

    self.judgeCount     = [setting[1] integerValue];
    self.judgeScore     = [setting[2] integerValue];
    self.singleCount    = [setting[3] integerValue];
    self.singleScore    = [setting[4] integerValue];
    self.multipleCount  = [setting[5] integerValue];
    self.multipleScore  = [setting[6] integerValue];
    self.analysisCount  = [setting[7] integerValue];
    self.analysisScore  = [setting[8] integerValue];
    self.time = [setting[9] integerValue];
    NSLog(@"%@ - Configuration ok!",self);
    
}

@end