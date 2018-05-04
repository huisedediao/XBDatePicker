//
//  XBDatePickerConfig.h
//  XBDatePicker
//
//  Created by xxb on 2018/5/4.
//  Copyright © 2018年 xxb. All rights reserved.
//

#ifndef XBDatePickerConfig_h
#define XBDatePickerConfig_h

#define isIpadScreen (((kScreenHeight == 480) || (kScreenWidth == 480)) ? YES : NO)
#define isIphone5Screen (((kScreenHeight == 568.0) || (kScreenWidth == 568.0)) ? YES : NO)
#define isIphone6Screen (((kScreenHeight == 667.0) || (kScreenWidth == 667.0)) ? YES : NO)
#define isIphone6PScreen (((kScreenHeight == 736.0) || (kScreenWidth == 736.0)) ? YES : NO)
#define isIphoneXScreen (((kScreenHeight == 812.0) || (kScreenWidth == 812.0)) ? YES : NO)

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kConsultHeight 568.0
#define kConsultWidth 320.0

#define GWidthFactor (kScreenWidth/kConsultWidth)
#define GHeightFactor \
({\
CGFloat result = kConsultHeight;\
if (isIphoneXScreen)\
{\
result = 667/kConsultHeight;\
}\
else if (isIpadScreen)\
{\
result = 568/kConsultHeight;\
}\
else\
{\
result = kScreenHeight/kConsultHeight;\
}\
result;\
})

#define GWidthFactorFun(x) (x * GWidthFactor)
#define GHeightFactorFun(x) (x * GHeightFactor)

//block weak属性化self宏
#define WEAK_SELF __typeof(self) __weak weakSelf = self;

//顶部安全区域高
#define SafeAreaTopHeight (kScreenHeight == 812.0 ? 24 : 0)
//底部安全区域高
#define SafeAreaBottomHeight (kScreenHeight == 812.0 ? 34 : 0)


//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XBColor_white                           [UIColor whiteColor]
#define XBColor_gray_240_240_240                ColorRGBA(240, 240, 240, 1)
#define XBColor_gray_136_136_136                ColorRGBA(136, 136, 136, 1)

//内容距离左边的宽度
#define kLeftSpaceToScreen (GWidthFactorFun(13.5))

#define UIFont(s)            [UIFont systemFontOfSize:s]

#define birthdayDateFormat @"yyyy年MM月dd日"

#endif /* XBDatePickerConfig_h */
