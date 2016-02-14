//
//  NSObject+Extensions.h
//  plantlife
//
//  Created by Lee Irvine on 10/14/14.
//  Copyright (c) 2014 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^forEachProperty)(NSString *key, NSObject *value);
@interface NSObject (Extensions)
- (void) forEachProperty:(forEachProperty) cb;
@end
