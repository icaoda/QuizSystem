//
//  QSMysql.m
//  mysqlTest
//
//  Created by SW05 on 12/3/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import "QSMysql.h"
#import <Mysql.h>

@interface QSMysql ()

@property (nonatomic) MYSQL *mysql;

@end

@implementation QSMysql

/*  初始化Mysql数据，根据调用的IP、用户名、密码和数据库名  */
- (instancetype)initWithIP:(NSString *)ipAddr userName:(NSString *)usr
                 passWords:(NSString *)pw dataBase:(NSString *)db {
    
    if (self = [super init]) {
        self.mysql = mysql_init(NULL);
        self.mysql = mysql_real_connect(self.mysql,
                                        [ipAddr cStringUsingEncoding:NSUTF8StringEncoding],
                                        [usr cStringUsingEncoding:NSUTF8StringEncoding],
                                        [pw cStringUsingEncoding:NSUTF8StringEncoding],
                                        [db cStringUsingEncoding:NSUTF8StringEncoding],
                                        0, NULL, 0);
        if (self.mysql == NULL) {NSLog(@"%@ - Connecting  with  %@ Error",self,ipAddr);return nil;}
        if (mysql_set_character_set(self.mysql, "utf8") != 0) NSLog(@"Set encoding fail!");
        NSLog(@"Connection and set ok!");
    }
    return self;
}

/*  关闭数据库，断开连接  */
- (void)killMysql {
    mysql_close(self.mysql);
}



#pragma mark - Query Database Information
/*  查询表单的数据条数: 为客户端询问数据的容量 */
- (NSUInteger)querySumOfRowsInSheet: (NSString *)sheet withAnyKey:(NSString *)key {
    
    NSString *query = [NSString stringWithFormat:@"select count(%@) from %@",key,sheet];NSLog(@"query : %@",query);
    mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding]);
    MYSQL_RES *result = mysql_store_result(self.mysql);
    MYSQL_ROW rows = mysql_fetch_row(result);NSLog(@"--------%lu",atol(rows[0]));
    return atol(rows[0]);
}

/*  查询功能方法：查询某条row，返回该row的数组    */
- (NSArray *)queryRowWithCondition:(NSString *)query {
    
    mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding]);
    MYSQL_RES *result = mysql_store_result(self.mysql);
    NSUInteger columCount = mysql_field_count(self.mysql);
    MYSQL_ROW rowData = mysql_fetch_row(result);
    if (rowData == nil) {NSLog(@"%@ no query results!",self); return nil;}
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i=0; i<columCount; i++) {
        NSString *str = [NSString stringWithCString:rowData[i] encoding:NSUTF8StringEncoding];
        [dataArray addObject:str];
    }
    
    return dataArray;
}

/*  查询表单中，第 index 条数据：为客户端查询第N条数据  */
- (NSArray *)queryWithIndex:(NSUInteger)index inSheet:(NSString *)sheet  {
    
    NSString *query = [NSString stringWithFormat:@"select * from %@ limit %lu,1",sheet,index-1];
    return [self queryRowWithCondition:query];
}

/*  查询表单中，某关键字对应的条目：为客户端查询用户是否存在 */
- (NSArray *)queryWithKey:(NSString *)key inSheet:(NSString *)sheet  {
    
    NSString *query = [NSString stringWithFormat:@"select * from %@ where %@",sheet,key];
    return [self queryRowWithCondition:query];
}

/*  查询表单中，某关键字对应的所有行的行号：为客户端查询成绩获取成绩行号  */
- (NSArray *)queryRowIndexesForKey:(NSString *)concreteKey inSheet:(NSString *)sheet {
    
    NSString *query = [NSString stringWithFormat:@"select id from %@ where %@",sheet,concreteKey];
    mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding]);NSLog(@"Query --- %@",query);
    MYSQL_RES *reslut = mysql_store_result(self.mysql);
    if (reslut == nil) {NSLog(@"%@ no query results!",self); return nil;}
    MYSQL_ROWS *rowsData = reslut->data_cursor;
    
    NSMutableArray *dataArray = [NSMutableArray array];
    MYSQL_ROWS *current = rowsData;
    while (current != nil) {
        MYSQL_ROW row = current->data;
        NSString *str = [NSString stringWithCString:row[0] encoding:NSUTF8StringEncoding];
        [dataArray addObject:str];
        current = current->next;
    }
    return dataArray;
}

#pragma mark - Edite Database Information
/*  数据库增加一个表格：客户端为数据库添加表    */
- (BOOL)createTablesForDepartment:(NSString *)depart {
    
    BOOL createOK = YES;
    NSString *query = [NSString stringWithFormat:@"CREATE TABLE %@_judge(id int unsigned not null auto_increment,title varchar(300) not null,answer varchar(5),primary key(id))",depart];
    if (0 != mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) { NSLog(@"Create table %@_jugdge failed![%@]",depart,query);createOK = NO;}
    query = [NSString stringWithFormat:@"CREATE TABLE %@_single(id int unsigned not null auto_increment,title varchar(300) not null,optionA varchar(150) not null,optionB varchar(150) not null,optionC varchar(150) not null,optionD varchar(150) not null,answer varchar(20) not null,primary key(id))",depart];
    if (0 != mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) { NSLog(@"Create table %@_single failed![%@]",depart,query);createOK = NO;}
    query = [NSString stringWithFormat:@"CREATE TABLE %@_multiple(id int unsigned not null auto_increment,title varchar(300) not null,optionA varchar(150) not null,optionB varchar(150) not null,optionC varchar(150) not null,optionD varchar(150) not null,answer varchar(20) not null,primary key(id))",depart];
    if (0 != mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) { NSLog(@"Create table %@_multiple failed![%@]",depart,query);createOK = NO;}
    query = [NSString stringWithFormat:@"CREATE TABLE %@_analysis(id int unsigned not null auto_increment,title varchar(500) not null,primary key(id))",depart];
    if (0!= mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) { NSLog(@"Create table %@_analysis failed![%@]",depart,query);createOK = NO;}
    return createOK ? YES : NO ;
}

/*  数据库增加一个表格：添加主观题记录表格UserID_TimeStamp */
- (BOOL)createAnalysisRecordTable:(NSString *)sheetName {
    
    NSString *query = [NSString stringWithFormat:@"CREATE TABLE %@(id int unsigned not null auto_increment,score varchar(20) not null,title varchar(500) not null,answer varchar(500) not null,primary key(id))",sheetName];
    if (mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding]) == 0) {NSLog(@"create table %@, result %hhd",sheetName,YES);
        return YES;
    } else {
        return NO;
    }
}

/*  数据库增加整行数据：为Analysis添加一条记录 */
- (BOOL)insertRow:(NSArray *)rowContents intoAnalysisRecord:(NSString *)tableName {
    
    // 1. 拼接需要添加条目的字符串
    NSString *values = @"";
    for (int i=0; i<[rowContents count]; i++) {
        NSString *str = [NSString stringWithFormat:@"'%@'",rowContents[i]];
        values = [values stringByAppendingFormat:@"%@",str];
        if (i != [rowContents count]-1) {
            values = [values stringByAppendingString:@","];
        }
    }
    
    // 2. 获取当前表的最大id
    NSUInteger countOfRow = [self querySumOfRowsInSheet:tableName withAnyKey:@"id"];
    if (countOfRow == 0) {
        countOfRow = 1;
    } else {
        NSString *maxID = [[self queryWithIndex:countOfRow inSheet:tableName] firstObject];
        countOfRow = [maxID integerValue] + 1;
    }

    // 3. 添加数据行
    NSString *query = [NSString stringWithFormat:@"INSERT INTO %@(id,score,title,answer) VALUES(%lu,%@)",tableName,countOfRow,values];
    if (mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])==0) {
        return YES;
    } else {
        return NO;
    }
}

/*  数据库增加整行数据：客户端为数据库添加一条记录 */
- (BOOL)insertRow:(NSArray *)rowContents forTable:(NSString *)tableName {
    
    // 1.拼接需要添加条目的字符串
    NSString *values = @"";
    for (int i=0; i<[rowContents count]; i++) {
        NSString *str = [NSString stringWithFormat:@"'%@'",rowContents[i]];
        values = [values stringByAppendingFormat:@"%@",str];
        if (i != [rowContents count]-1) {
            values = [values stringByAppendingString:@","];
        }
    }
    NSString *query = [[NSString alloc] init];
    NSString *tableType = [[tableName componentsSeparatedByString:@"_"] lastObject];
    
    // 2.配置表单，为配置表单添加row
    if ([tableType isEqualToString:@"Configuration"] == YES) {
    // 表为配置表单
        query = [query stringByAppendingFormat:@"INSERT INTO %@(department,judge,judge_score,single,single_score,multiple,multiple_score,time) VALUES(%@)",tableName,values];
    } else {
        // 2.1 获取当前表的最大id
        NSUInteger countOfRow = [self querySumOfRowsInSheet:tableName withAnyKey:@"id"];
        if (countOfRow == 0) {
            countOfRow = 1;
        } else {
            NSString *maxID = [[self queryWithIndex:countOfRow inSheet:tableName] firstObject];
            countOfRow = [maxID integerValue] + 1;
        }
    // 表位记录表单
        if ([tableType isEqualToString:@"Record"] == YES) {
            query = [query stringByAppendingFormat:@"INSERT INTO %@(id,user,name,time,cost,sum,score_obj,timeStamp,unread,score) VALUES(%lu,%@)",
                     tableName,countOfRow,values];
        } else {
    // 表单为试题表单
            // 2.2 拼接id（key）字段
            if ([tableType isEqualToString:@"judge"] ==YES) {
                query = [query stringByAppendingFormat:@"INSERT INTO %@(id,title,answer) VALUES(%lu,%@)",tableName,countOfRow,values];
            } else {
                if ([tableType isEqualToString:@"single"] == YES || [tableType isEqualToString:@"multiple"] == YES) {
                    query = [query stringByAppendingFormat:@"INSERT INTO %@(id,title,optionA,optionB,optionC,optionD,answer) VALUES(%lu,%@)",tableName,countOfRow,values];
                } else {
                    if ([tableType isEqualToString:@"analysis"] == YES) {
                        query = [query stringByAppendingFormat:@"INSERT INTO %@(id,title) VALUES(%lu,%@)",tableName,countOfRow,values];
                    } else {
                        return NO;
                    }
                }
            }
        }
    }
    
    // 3.如果表单是考试记录，为记录表单添加row
    NSLog(@"%@ - Insert query sentence: %@",self,query);
    
    // 4.执行插入语句，如果成功返回yes,失败no
    if (0 == mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) {
        return YES;
    } else {
        return NO;
    }
}

/*  数据库更改某条记录：客户端修改数据库具体内容    */
- (BOOL)updateContents:(NSString *)contents withKey:(NSString *)key inSheet:(NSString *)tableName {
    
    NSString *query = [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@",tableName,contents,key];NSLog(@"current select diaglog:(%@)",query);
    if (0 == mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) {
        return YES;
    } else {
        return NO;
    }
}

/*  数据库删除整条记录：客户端删除具体数据行    */
- (BOOL)deleteRowWithKey:(NSString *)key inSheet:(NSString *)tableName {
    
    NSString *query = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@",tableName,key];
    if (0 == mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) {
        return YES;
    } else {
        return NO;
    }
    
}

/* 删除表格：删除给定名字的表格 */
- (BOOL)dropTable:(NSString *)tbName {
    
    NSString *query = [NSString stringWithFormat:@"drop table %@",tbName];
    if (0 == mysql_query(self.mysql, [query cStringUsingEncoding:NSUTF8StringEncoding])) {
        return YES;
    } else {
        return NO;
    }
}

@end
