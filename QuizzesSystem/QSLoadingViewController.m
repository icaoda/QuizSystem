//
//  QSLoadingViewController.m
//  QuizzesSystem
//
//  Created by SW05 on 12/7/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSLoadingViewController.h"
#import "NSString+ExamPaper.h"
#import "QSTools.h"

typedef NS_ENUM(NSUInteger, kTagOfView) {
    kTag_depart_label = 400,
    kTag_browser_btn,
    Ktag_path_ctl,
    kTag_path_label,
    kTag_pudding_btn,
};

@interface QSLoadingViewController ()

@property (nonatomic, strong) QSAdministrator *user;

@property (nonatomic, copy) NSDictionary *paperDic;

@end

@implementation QSLoadingViewController

- (instancetype)initWithUser:(QSAdministrator *)user {
    if (self = [super initWithNibName:@"QSLoadingViewController" bundle:nil]) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [[self.view viewWithTag:kTag_depart_label] setStringValue:self.user.department];
}

- (IBAction)fileBrowserPerform:(NSButton *)sender {
    
    // 1.文件打开浏览器
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    [openPanel setAllowsMultipleSelection:NO];
    [openPanel runModal];
    if (openPanel.URL != nil) [[self.view viewWithTag:Ktag_path_ctl] setURL:openPanel.URL];
    
    
    // 配置UI元素
    NSString *url = [openPanel.URL absoluteString];NSLog(@"url = (%@)",url);
    NSRange range = [url rangeOfString:@"/Users"];
    url = [url substringFromIndex:range.location];NSLog(@"url = (%@)",url);
    [[self.view viewWithTag:kTag_path_label] setStringValue:url];
    
    // 2.导入文件，解析试题
    self.paperDic = [[NSString alloc] parseExamPaperFromFile:url];
    if (self.paperDic != nil) {
        [[self.view viewWithTag:kTag_pudding_btn] setEnabled:YES];
        [[self.view viewWithTag:kTag_pudding_btn] setTitle:@"Pudding To Server"];
    } else {
        [[self.view viewWithTag:kTag_pudding_btn] setEnabled:NO];
        [[self.view viewWithTag:kTag_pudding_btn] setTitle:@"Nothing to Pudding"];
    }
    
}

- (IBAction)puddingPaperToServer:(NSButton *)sender {
    
    // 1.上传判断题信息
    BOOL puddingOK = YES;
    NSString *sheet = [NSString stringWithFormat:@"%@_judge",self.user.department];
    NSArray *judgeArray = [self.paperDic objectForKey:kPaperKeyTrue];
    for (NSDictionary *quiz in judgeArray) {
        NSArray *contents = @[ quiz[kKeyTitle],quiz[kKeyAnswere]];
        puddingOK = [self.user.mysql insertRow:contents forTable:sheet];
        if (puddingOK == NO) [QSTools toolsGenerateAnAlertWithTitle:@"Judge qustion pudding failed!"];
    }
    
    // 2.上传选择题信息
    sheet = [NSString stringWithFormat:@"%@_single",self.user.department];
    NSArray *singleArray = [self.paperDic objectForKey:kPaperKeySing];
    for (NSDictionary *quiz in singleArray) {
        NSArray *contents = @[ quiz[kKeyTitle],
                               quiz[kKeyOptions][0],quiz[kKeyOptions][1],
                               quiz[kKeyOptions][2],quiz[kKeyOptions][3],
                               quiz[kKeyAnswere]   ];
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[0]);
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[1]);
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[2]);
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[3]);
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[4]);
        NSLog(@"&&&&&&--+|%@|+--&&&&&",contents[5]);
        puddingOK = [self.user.mysql insertRow:contents forTable:sheet];
        if (puddingOK == NO) [QSTools toolsGenerateAnAlertWithTitle:@"Single qustion pudding failed!"];
    }
    
    // 3.上传多选题新题
    sheet = [NSString stringWithFormat:@"%@_multiple",self.user.department];
    NSArray *multipleArray = [self.paperDic objectForKey:kPaperKeyMult];
    for (NSDictionary *quiz in multipleArray) {
        NSArray *contents = @[ quiz[kKeyTitle],
                               quiz[kKeyOptions][0],quiz[kKeyOptions][1],
                               quiz[kKeyOptions][2],quiz[kKeyOptions][3],
                               quiz[kKeyAnswere]   ];
        puddingOK = [self.user.mysql insertRow:contents forTable:sheet];
        if (puddingOK == NO) [QSTools toolsGenerateAnAlertWithTitle:@"Multiple qustion pudding failed!"];
    }
    
    // 4.上传解析题信息
    sheet = [NSString stringWithFormat:@"%@_analysis",self.user.department];
    NSArray *analysisArray = [self.paperDic objectForKey:kPaperKeyAnly];
    for (NSString *quiz in analysisArray) {
        NSArray *contents = @[  quiz    ];
        puddingOK = [self.user.mysql insertRow:contents forTable:sheet];
        if (puddingOK == NO) [QSTools toolsGenerateAnAlertWithTitle:@"Analysis question pudding failed!"];
    }
    
    // 4.上传成功，控件失效
    if (puddingOK == YES) {
        [[self.view viewWithTag:kTag_pudding_btn] setTitle:@"Pudding Success!"];
        [[self.view viewWithTag:kTag_pudding_btn] setEnabled:NO];
    }
}

- (IBAction)downloadTemplateToDesktop:(NSButton *)sender {
    
    NSString *temPath = [[NSBundle mainBundle] pathForResource:@"Template.txt" ofType:nil];
    NSString *desktop = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory , NSUserDomainMask, YES)[0];
    desktop = [desktop stringByAppendingPathComponent:@"Template.txt"];NSLog(@"tem = %@,desk= %@",temPath,desktop);
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    [fm copyItemAtPath:temPath toPath:desktop error:&error];
    if (error != nil) {
        [QSTools toolsGenerateAnAlertWithTitle:[NSString stringWithFormat:@"Copy Failed: %@",error]];
    }
}



@end
