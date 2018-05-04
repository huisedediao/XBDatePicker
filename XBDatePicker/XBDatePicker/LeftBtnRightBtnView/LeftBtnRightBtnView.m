//
//  LeftBtnRightBtnView.m
//  AnXin
//
//  Created by 谢贤彬 on 2018/2/24.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "LeftBtnRightBtnView.h"
#import "Masonry.h"
#import "LeftBtnRightBtnViewConfig.h"

@implementation LeftBtnRightBtnView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = XBColor_gray_240_240_240;;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    
    self.btn_title =({
        XBButton *btn = [XBButton new];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self);
            make.height.equalTo(self);
            make.width.mas_equalTo(kScreenWidth);
        }];
        btn.enum_contentSide = XBBtnSideLeft;
        btn.f_spaceToContentSide = kLeftSpaceToScreen;
        btn.color_titleNormal = XBColor_gray_136_136_136;
        btn.font_title = UIFont(GWidthFactorFun(10));
        btn.str_titleNormal = @"A";
        btn;
    });
    
    self.btn_subTitle = ({
        XBButton *btn = [XBButton new];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(self);
            make.width.mas_equalTo(kScreenWidth);
        }];
        btn.enum_contentSide = XBBtnSideRight;
        btn.f_spaceToContentSide = kLeftSpaceToScreen;
        btn.color_titleNormal = XBColor_gray_136_136_136;
        btn.font_title = UIFont(GWidthFactorFun(10));
        btn.str_titleNormal = @"A";
        btn.hidden = YES;
        btn;
    });
}


@end
