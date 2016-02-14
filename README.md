# objective-extensions

[![CI Status](http://img.shields.io/travis/Lee Irvine/objective-extensions.svg?style=flat)](https://travis-ci.org/Lee Irvine/objective-extensions)
[![Version](https://img.shields.io/cocoapods/v/objective-extensions.svg?style=flat)](http://cocoapods.org/pods/objective-extensions)
[![License](https://img.shields.io/cocoapods/l/objective-extensions.svg?style=flat)](http://cocoapods.org/pods/objective-extensions)
[![Platform](https://img.shields.io/cocoapods/p/objective-extensions.svg?style=flat)](http://cocoapods.org/pods/objective-extensions)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objective-c
#import "objective-extensions.h"

  NSDictionary *dict = @{@"hello": @"world"};
  [dict forEachKey:^(id key, id value) {

  }];

  NSObject *obj = [[NSObject alloc] init];

  [obj forEachProperty:^(NSString *key, NSObject *value) {

  }];


  UIColor *purple = [UIColor colorWithHex:@"FF00FF"];
```

## Requirements



## Installation

objective-extensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "objective-extensions"
```

## Author

Lee Irvine, loofy2@gmail.com

## License

objective-extensions is available under the MIT license. See the LICENSE file for more info.
