//
//  QSMysql.h
//  mysqlTest
//
//  Created by SW05 on 12/3/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSMysql : NSObject

#pragma mark - Mysql life cycle methods

/*  MySQL的初始化和连接,初始化对象并且与远端服务器建立连接和登陆。参数：
        ipAddr: 远端服务器的IP地址
        usr/passwords：登陆用的用户名和密码
        db:供调用和操作的数据库   */
- (instancetype)initWithIP:(NSString *)ipAddr userName: (NSString *)usr
                 passWords:(NSString *)pw dataBase: (NSString *)db;

/*  MySQL结束连接，断开    */
- (void)killMysql;

#pragma mark - Query Database Information
/*  关键字查询，根据关键字查询对应的row。参数, 
        key:查询需要的关键字，如id=5，name='Steven';
        sheet：所在的表名  */
- (NSArray *)queryWithKey:(NSString *)key inSheet:(NSString *)sheet;

/*  关键字查询，根据索引（第N行）查询对应的row。参数,
        index:所在的行索引;
        sheet：所在的表名  */
- (NSArray *)queryWithIndex:(NSUInteger)index inSheet:(NSString *)sheet;

/*  数量查询，根据任意关键字查找表格的总行数。参数，
        sheet：所在表单名
        key：任意关键字   */
- (NSUInteger)querySumOfRowsInSheet:(NSString *)sheet withAnyKey:(NSString *)key;

/*  查询表单中，某关键字对应的所有行的行号：为客户端查询成绩获取成绩行号  */
- (NSArray *)queryRowIndexesForKey:(NSString *)concreteKey inSheet:(NSString *)sheet;

#pragma mark - Edit Database Information
/*  创建表单：为部门(单位)新建三张表格，分别为：
    depart_judge,depart_single,depart_multiple  */
- (BOOL)createTablesForDepartment:(NSString *)depart;

/*  数据库增加一个表格：添加主观题记录表格UserID_TimeStamp */
- (BOOL)createAnalysisRecordTable:(NSString *)sheetName;

/*  添加数据行：为表格添加一行数据，参数：
    rowContents: 是一个包含所有字段的数组（除了id键值），如：@[@"title",@"answer"]
    tableName:表单名   */
- (BOOL)insertRow:(NSArray *)rowContents forTable:(NSString *)tableName;

/*  数据库增加整行数据：为Analysis添加一条记录 */
- (BOOL)insertRow:(NSArray *)rowContents intoAnalysisRecord:(NSString *)tableName;

/*  修改数据格：修改表格中具体的格值，参数：
    contents:要修改的值 如 @"titlte='孙悟空是猴子？'";
    key:被修改行的任意键值（建议用key），如 @"id=6";
    tableName:表单名   */
- (BOOL)updateContents:(NSString *)contents withKey:(NSString *)key inSheet:(NSString *)tableName;

/*  删除数据行：删除表单中某键对应的行
    key：该行的键值
    tableName：表单名   */
- (BOOL)deleteRowWithKey:(NSString *)key inSheet:(NSString *)tableName;

/* 删除表格：删除给定名字的表格 */
- (BOOL)dropTable:(NSString *)tbName;

@end
