# XCTestCase+RunAsync

[![Version](https://img.shields.io/cocoapods/v/XCTestCase+RunAsync.svg?style=flat)](http://cocoadocs.org/docsets/XCTestCase+RunAsync)
[![License](https://img.shields.io/cocoapods/l/XCTestCase+RunAsync.svg?style=flat)](http://cocoadocs.org/docsets/XCTestCase+RunAsync)
[![Platform](https://img.shields.io/cocoapods/p/XCTestCase+RunAsync.svg?style=flat)](http://cocoadocs.org/docsets/XCTestCase+RunAsync)

This library is wrapper for [ishkawa/NSRunLoop-PerformBlock](https://github.com/ishkawa/NSRunLoop-PerformBlock "ishkawa/NSRunLoop-PerformBlock").

You can write async testcase by [Mocha](http://visionmedia.github.io/mocha/ "Mocha")'s `done` style.

## Usage

``` objc
@interface ExampleTests : XCTestCase
@end

@implementation ExampleTests

- (void)testExample{
    [self runAsyncWithBlock:^(AsyncDone done) {
      // async function
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(popTime, queue, ^(void){
            done();// => done async test
        });
    }];
}
@end

```

### API

``` objc
typedef void(^AsyncDone)();

@interface XCTestCase (RunAsync)
- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode;

- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode timeout:(NSTimeInterval) timeout;
@end
```

## Installation

XCTestCase+RunAsync is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "XCTestCase-RunAsync"

## License

XCTestCase+RunAsync is available under the MIT license. See the LICENSE file for more info.
