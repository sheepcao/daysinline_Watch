//
//  CustomActionSheet.h
//  customActionSheetTest
//
//  Created by 林 劲捷 on 13-5-30.
//  Copyright (c) 2013年 林 劲捷. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomActionSheetDelegate <NSObject>
@optional
-(void)choseAtIndex:(int)index;

@end

@interface CustomActionSheet : UIView
{
    UIButton * cancelButton;
    UIView * coverView;
}
@property(nonatomic,strong)NSArray * buttons;
@property(nonatomic,strong)UIImageView * backgroundImageView;
@property(nonatomic,assign)id<CustomActionSheetDelegate> delegate;
- (id)initWithButtons:(NSArray *)buttons;
-(void)showInView:(UIView *)view;
-(void)dissmiss;
@end


@interface CustomActionSheetButton : UIView
@property(nonatomic,strong)UIButton * imgButton;
@property(nonatomic,strong)UILabel * titleLabel;
+(CustomActionSheetButton *)buttonWithImage:(UIImage *)image title:(NSString *)title;
@end