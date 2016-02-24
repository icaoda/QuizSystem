//
//  QSConfigTableUnread.m
//  TestSystem
//
//  Created by SW05 on 1/13/16.
//  Copyright © 2016 TDE-SMTFA05. All rights reserved.
//

#define NSNotificationPaperSelected @"NSNotificationPaperSelected"
#define NSNotificationInfoKey @"NSNotificationInfoKey"
#define NSNotificationUnreadOK @"NSNotificationUnreadOK"

#import "QSConfigTableUnread.h"
#import "QSTools.h"

@implementation Item

+ (Item *)itemWithName:(NSString *)name children:(NSMutableArray *)children {
    
    Item *item = [[Item alloc] init];
    [item setChildren:children];
    [item setItemName:name];
    return item;
}

@end

@interface QSConfigTableUnread ()

@property (nonatomic, strong) Item *root;

@end


@implementation QSConfigTableUnread

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)prepareDataModelForView:(QSAdministrator *)user {
    [self setUser:user];
    [self parseDataFromServer];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadData)
                                                 name:NSNotificationUnreadOK object:nil];
}

- (void)parseDataFromServer {
    // 查询Testers表单，获取未读行的工号
    NSString *key = [NSString stringWithFormat:@"department='%@' and unread>0",self.user.department];
    NSArray *list = [self.user.mysql queryRowIndexesForKey:key inSheet:@"Testers"];
    Item *rootItem = [Item itemWithName:@"Unread" children:[NSMutableArray array]];
    for (NSString *index in list) {
        NSArray *row = [self.user.mysql queryWithIndex:[index integerValue] inSheet:@"Testers"];
        Item *item = [Item itemWithName:row[1] children:[NSMutableArray array]];
        [rootItem.children addObject:item];
    }
    NSLog(@"Mark here");
    // 查询Testers_Record表单，获取未读试题的表名
    for (Item *item in rootItem.children) {
        NSString *key = [NSString stringWithFormat:@"user='%@' and unread='Y'",item.itemName];
        NSArray *list = [self.user.mysql queryRowIndexesForKey:key inSheet:@"Testers_Record"];
        for (NSString *index in list) {
            NSArray *row = [self.user.mysql queryWithIndex:[index integerValue] inSheet:@"Testers_Record"];
            NSString *timeStamp = row[7];
            timeStamp = [timeStamp stringByReplacingOccurrencesOfString:@"/" withString:@""];
            timeStamp = [timeStamp stringByReplacingOccurrencesOfString:@" " withString:@""];
            timeStamp = [timeStamp stringByReplacingOccurrencesOfString:@":" withString:@""];
            timeStamp = [NSString stringWithFormat:@"%@_%@",row[1],timeStamp];
            Item *subItem = [Item itemWithName:timeStamp children:[NSMutableArray array]];
            [item.children addObject:subItem];
        }
    }
    // 将组合的Tree🌲结构赋值给root
    self.root = rootItem;
}

- (void)broadCastPaperSelectNotification:(NSString *)info {
    NSDictionary *infoDic = [NSDictionary dictionaryWithObjectsAndKeys:info,NSNotificationInfoKey, nil];
    NSNotification *notify = [NSNotification notificationWithName:NSNotificationPaperSelected
                                                           object:self userInfo:infoDic];
    [[NSNotificationCenter defaultCenter] postNotification:notify];NSLog(@"Selected item BroadCast to all!");
}

#pragma mark - Outline view Data Source method
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(Item *)item {
    return [item.children count]>0 ? YES : NO ;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(Item *)item {

    if (!item) {
        return self.root;
    } else {
        return item.children[index];
    }
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(Item *)item {
    if (!item) {
        return 1;
    } else {
        return [item.children count];
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(Item *)item {
    return item.itemName;
}

#pragma mark - Outline view Delegate method
- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(Item *)item {
    if ([item.children count] != 0) {
        return NO;
    } else {
        NSLog(@"select Item named: %@",item.itemName);
        [self broadCastPaperSelectNotification:item.itemName];
        return YES;
    }
}

@end
