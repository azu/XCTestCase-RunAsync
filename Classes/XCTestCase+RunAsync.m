//
// Created by azu on 2013/12/24.
//


#import "XCTestCase+RunAsync.h"
#import "NSRunLoop+PerformBlock.h"


@implementation XCTestCase (RunAsync)

- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode {
    [self runAsyncWithBlock:runTestCode timeout:10];
}

- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode timeout:(NSTimeInterval) timeout {
    __block BOOL isTimeout = YES;
    [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
        runTestCode(^{
            isTimeout = NO;
            *finish = YES;
        });
    } timeoutInterval:timeout];
    if (isTimeout) {
        XCTFail(@"Timeout Error");
    }
}
@end