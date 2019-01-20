//
//  XCNotificationCenter.h
//  CustomNotifcation
//
//  Created by myxc on 2019/1/20.
//  Copyright © 2019 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCNotification.h"

NS_ASSUME_NONNULL_BEGIN

@interface XCNotificationCenter : NSObject

+ (XCNotificationCenter *)defaultCenter;

- (void)xc_postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)xc_addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)xc_removeObserver:(id)observer;

@end

NS_ASSUME_NONNULL_END
