//
//  XBDatePicker.m
//  AnXin
//
//  Created by xxb on 2018/3/2.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBDatePicker.h"
#import "LeftBtnRightBtnView.h"
#import "Masonry.h"
#import "XBDatePickerConfig.h"

#define topViewHeight (GHeightFactorFun(30))
#define datePickerHeight (GHeightFactorFun(150))
#define selfHegith (datePickerHeight + topViewHeight + SafeAreaBottomHeight)

@interface XBDatePicker ()
{
    NSDate *_date;
    NSString *_dateFormatStr;
}
@property (nonatomic,strong) XBButton *btn_left;
@property (nonatomic,strong) XBButton *btn_right;
@end

@implementation XBDatePicker

- (void)actionBeforeShow
{
    WEAK_SELF
    self.backgroundColor = XBColor_white;
    self.backgroundViewColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.hideWhileTouchOtherArea = NO;
    self.showLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(alertView.superview);
            make.height.mas_equalTo(selfHegith);
        }];
    };
    self.hiddenLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(alertView.superview);
            make.top.equalTo(alertView.superview.mas_bottom);
            make.height.mas_equalTo(selfHegith);
        }];
    };
    
    UIView *topView = [UIView new];
    [self addSubview:topView];
    topView.backgroundColor = XBColor_gray_240_240_240;;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(GHeightFactorFun(30));
    }];
    self.btn_left =({
        XBButton *btn = [XBButton new];
        [topView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(topView);
            make.left.equalTo(topView);
            make.height.equalTo(topView);
            make.width.mas_equalTo(100);
        }];
        btn.enum_contentSide = XBBtnSideLeft;
        btn.f_spaceToContentSide = kLeftSpaceToScreen;
        btn.color_titleNormal = XBColor_gray_136_136_136;
        btn.font_title = UIFont(GWidthFactorFun(10));
        btn.str_titleNormal = NSLocalizedString(@"取消", nil);
        btn.bl_click = ^(XBButton *weakBtn) {
            [weakSelf hidden];
        };
        btn;
    });

    self.btn_right = ({
        XBButton *btn = [XBButton new];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(topView);
            make.right.equalTo(topView);
            make.height.equalTo(topView);
            make.width.mas_equalTo(100);
        }];
        btn.enum_contentSide = XBBtnSideRight;
        btn.f_spaceToContentSide = kLeftSpaceToScreen;
        btn.color_titleNormal = XBColor_gray_136_136_136;
        btn.font_title = UIFont(GWidthFactorFun(10));
        btn.str_titleNormal = NSLocalizedString(@"确定", nil);
        btn.bl_click = ^(XBButton *weakBtn) {
            [weakSelf hidden];
            NSDate *date = weakSelf.datePicker.date;
            if (weakSelf.bl_done)
            {
                weakSelf.bl_done(date);
            }
        };
        btn;
    });
    
    self.datePicker = ({
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        [self addSubview:datePicker];
        [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(topView.mas_bottom);
            make.height.mas_equalTo(datePickerHeight);
        }];
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        //显示方式是只显示年月日
        datePicker.datePickerMode = UIDatePickerModeDate;
        
        [datePicker setDate:self.date];
        datePicker;
    });

}

- (void)setDate:(NSDate *)date
{
    _date = date;
    [self.datePicker setDate:date];
}

- (NSDate *)date
{
    if (_date == nil)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:birthdayDateFormat];
        _date = [dateFormatter dateFromString:@"1990年01月01日"];
    }
    return _date;
}


@end
