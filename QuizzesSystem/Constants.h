//
//  Constants.h
//  QuizSystem
//
//  Created by SW05 on 11/18/15.
//  Copyright © 2015 TDE-SMTFA05. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#include <stdio.h>

// ****** Define NSNotifications name ********
#define NSNotificationLeftPanel @"NSNotificationLeftPanel"
#define NSNotificationRightPanel @"NSNotificationRightPanel"
#define NSNotificationLoginPanel @"NSNotificationLoginPanel"

// ****** Define Notifications & Notification info ******

//  Notification Info dic key
#define NSNotificationInfoKey @"NSNotificationInfoKey"

// Notification Info dic value: left panel
#define NSNotificationInfoStartTest @"NSNOtificationInfoStartTest"
#define NSNotificationInfoStartAdmn @"NSNotificationInfoStartAdmn"

//  Notification Info dic value: right panel
#define NSNotificationInfoTestTest @"NSNotificationInfoTestTest"
#define NSNotificationInfoTestPaper @"NSNotificationInfoTestPaper"
#define NSNotificationInfoTestRecord @"NSNotificationInfoTestRecord"

#define NSNotificationInfoAdmnReview @"NSNotificationInfoAdmnReview"
#define NSNotificationInfoAdmnLoading @"NSNotificationInfoAdmnLoading"
#define NSNotificationInfoAdmnSetting @"NSNotificationInfoAdmnSetting"

// Notification Info dic key: login panel
#define NSNotificationInfoKeyPassword @"NSNotificationInfoLoginPassword"
#define NSNotificationInfoKeyUserName @"NSNotificationInfoLoginUserName"

#endif /* Constants_h */
