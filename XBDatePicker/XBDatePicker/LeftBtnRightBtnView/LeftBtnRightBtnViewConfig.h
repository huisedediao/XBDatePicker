//
//  LeftBtnRightBtnViewConfig.h
//  XBDatePicker
//
//  Created by xxb on 2018/5/4.
//  Copyright © 2018年 xxb. All rights reserved.
//

#ifndef LeftBtnRightBtnViewConfig_h
#define LeftBtnRightBtnViewConfig_h

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


//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XBColor_gray_240_240_240                ColorRGBA(240, 240, 240, 1)
#define XBColor_gray_136_136_136                ColorRGBA(136, 136, 136, 1)

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//内容距离左边的宽度
#define kLeftSpaceToScreen (GWidthFactorFun(13.5))


#define UIFont(s)            [UIFont systemFontOfSize:s]


#endif /* LeftBtnRightBtnViewConfig_h */
