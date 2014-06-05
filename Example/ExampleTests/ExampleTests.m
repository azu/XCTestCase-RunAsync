//
//  ExampleTests.m
//  ExampleTests
//
//  Created by azu on 2014/06/05.
//  Copyright (c) 2014年 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCTestCase-RunAsync.h"

@interface ExampleTests : XCTestCase

@end

@implementation ExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [self runAsyncWithBlock:^(AsyncDone done) {
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(popTime, queue, ^(void) {
            done();
        });
    }];
}

@end
