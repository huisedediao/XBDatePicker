//
//  ViewController.m
//  XBDatePicker
//
//  Created by xxb on 2018/5/4.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    XBDatePicker *datePicker = [[XBDatePicker alloc] initWithDisplayView:self.view];
    datePicker.date = [NSDate date];
    datePicker.bl_done = ^(NSDate *selectedDate) {
        NSLog(@"date：%@",selectedDate);
    };
    [datePicker show];
}


@end
