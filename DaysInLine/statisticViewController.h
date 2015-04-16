//
//  statisticViewController.h
//  DaysInLine
//
//  Created by 张力 on 14-1-27.
//  Copyright (c) 2014年 张力. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

#import "sqlite3.h"
#import "resultView.h"
//#import <Frontia/Frontia.h>
#import <iAd/iAd.h>
//#import "GADBannerView.h"
#import "globalVars.h"

//#define ADMOB_ID @"a1531ddc35a4db2"


@interface statisticViewController : UIViewController<BaiduMobAdViewDelegate>
//<ADBannerViewDelegate,GADBannerViewDelegate>
{
    sqlite3 *dataBase;
    NSString *databasePath;
    BaiduMobAdView* sharedAdView;
    
}




@property (weak, nonatomic) NSString *startDate;
@property (weak, nonatomic) NSString *endDate;


//@property (strong, nonatomic) ADBannerView *adView;
//@property (strong, nonatomic) ADBannerView *iAdBannerView;
//@property (strong, nonatomic) GADBannerView *gAdBannerView;
@property (nonatomic, assign) BOOL bannerIsVisible;
@end
