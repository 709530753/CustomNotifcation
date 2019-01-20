//
//  XCObserverInfoModel.h
//  CustomNotifcation
//
//  Created by myxc on 2019/1/20.
//  Copyright © 2019 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCNotification;

NS_ASSUME_NONNULL_BEGIN

@interface XCObserverInfoModel : NSObject

@property (weak) id observer;
@property (strong) id observer_strong;
@property (strong) NSString *observerId;
@property (assign) SEL selector;
@property (weak) id object;
@property (copy) NSString *name;
@property (strong) NSOperationQueue *queue;
@property (copy) void(^block)(XCNotification *noti);

@end

NS_ASSUME_NONNULL_END
