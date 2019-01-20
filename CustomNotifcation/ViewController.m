//
//  ViewController.m
//  CustomNotifcation
//
//  Created by myxc on 2019/1/20.
//  Copyright © 2019 myxc. All rights reserved.
//

/**
 
 自定义Notification
 
 */
#import "ViewController.h"
#import "XCNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"notification" object: nil];
    [[XCNotificationCenter defaultCenter] xc_addObserver:self selector:@selector(notification:) name:@"xc_notification" object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification" object:nil userInfo:@{@"username": @"zhangsan"}];
    
    [[XCNotificationCenter defaultCenter] xc_postNotificationName:@"xc_notification" object:nil userInfo:@{@"username": @"zhangsan"}];
    
}

- (void)notification:(XCNotification *)noti {
    
    NSLog(@"noti : %@",noti.userInfo);
    
    NSLog(@"%@", [NSThread currentThread]);
//    2019-01-20 15:38:27.928576+0800 CustomNotifcation[29571:519364] <NSThread: 0x6000008d0900>{number = 3, name = (null)}

    
    
}
- (IBAction)removeObserver:(id)sender {
    [[XCNotificationCenter defaultCenter] xc_removeObserver:self];
}

@end
