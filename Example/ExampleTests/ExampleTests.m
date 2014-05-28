//
//  ExampleTests.m
//  ExampleTests
//
//  Created by azu on 2014/05/28.
//  Copyright (c) 2014年 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCTestCase+RunAsync.h"

@interface ExampleTests : XCTestCase

@end

@implementation ExampleTests

- (void)testExample{
    [self runAsyncWithBlock:^(AsyncDone done) {
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(popTime, queue, ^(void){
            done();
        });
    }];
}

@end
