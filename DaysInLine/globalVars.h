//
//  globalVars.h
//  DaysInLine
//
//  Created by 张力 on 13-11-5.
//  Copyright (c) 2013年 张力. All rights reserved.
//

#ifndef DaysInLine_globalVars_h
#define DaysInLine_globalVars_h
#import "BaiduMobAdView.h"

int workArea[96] ;
int lifeArea[96] ;
NSString *modifyDate;
NSString *userTips;
NSString *password;

//BOOL hasTheDay;

int modifying;
int modifyEventId;

BOOL soundSwitch;
BOOL remindSwitch;
//int startDay; //1 = sunday, 2 = monday

#define NR_IMAGEVIEW 5
#define IMAGEVIEW_TAG_BASE 200
#define mainHeight 150

#define kAdViewPortraitRect CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-kBaiduAdViewSizeDefaultHeight, kBaiduAdViewSizeDefaultWidth, kBaiduAdViewSizeDefaultHeight)


#define ADMOB_ID @"ca-app-pub-3074684817942615/1126186689"
//#define IMAGEBUTTON_TAG_BASE 300

#endif
