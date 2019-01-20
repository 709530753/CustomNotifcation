//
//  XCNotification.h
//  CustomNotifcation
//
//  Created by myxc on 2019/1/20.
//  Copyright © 2019 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCNotification : NSObject

@property (nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) id object;
@property (nullable, nonatomic, copy) NSDictionary *userInfo;

@end

NS_ASSUME_NONNULL_END
