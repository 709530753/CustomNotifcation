//
//  XCNotificationCenter.m
//  CustomNotifcation
//
//  Created by myxc on 2019/1/20.
//  Copyright © 2019 myxc. All rights reserved.
//

#import "XCNotificationCenter.h"
#import "XCObserverInfoModel.h"

@interface XCNotificationCenter()

@property (nonatomic, strong) NSMutableArray *observers;

@end

@implementation XCNotificationCenter

static XCNotificationCenter *instance = nil;

+ (XCNotificationCenter *)defaultCenter {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[XCNotificationCenter alloc] init];
            instance.observers = [NSMutableArray array];
        }
    });
    return instance;
}


- (void)xc_addObserver:(id)observer
              selector:(SEL)aSelector
                  name:(NSString *)aName
                object:(id)anObject {
    
    XCObserverInfoModel *model = [XCObserverInfoModel new];
    model.observer = observer;
    model.observerId = [NSString stringWithFormat:@"%@", observer];
    model.selector = aSelector;
    model.name = aName;
    model.object = anObject;
    
    NSMutableArray *observes = [[XCNotificationCenter defaultCenter] observers];
    [observes addObject: model];
}

- (void)xc_postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    
    XCNotification *notification = [XCNotification new];
    notification.name = aName;
    notification.object = anObject;
    notification.userInfo = aUserInfo;
    NSMutableArray *observes = [[XCNotificationCenter defaultCenter] observers];

    for (XCObserverInfoModel *model in observes) {
        if ([notification.name isEqualToString: model.name]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            dispatch_async(dispatch_get_main_queue(), ^{
                model.observer?[model.observer performSelector:model.selector withObject:notification]:nil;
//            });
#pragma clang diagnostic pop
            break;
        }
        
    }
}

- (void)xc_removeObserver:(id)observer {
    NSMutableArray *observes = [[XCNotificationCenter defaultCenter] observers];
    for (XCObserverInfoModel *model in observes) {
        if ([observer isEqual: model.observer]) {
            NSLog(@"%s", __func__);
            [observes removeObject:model];
        }
    }
}

@end
