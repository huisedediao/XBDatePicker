//
//  XBDatePicker.h
//  AnXin
//
//  Created by xxb on 2018/3/2.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBAlertViewBase.h"

@class XBDatePicker;

typedef void (^XBDatePickerDoneBlock)(NSString *timeStr);

@interface XBDatePicker : XBAlertViewBase
@property (nonatomic,copy) XBDatePickerDoneBlock bl_done;
@end
