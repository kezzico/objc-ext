//
//  NSObject+Extensions.m
//  plantlife
//
//  Created by Lee Irvine on 10/14/14.
//  Copyright (c) 2014 kezzi.co. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+Extensions.h"

@implementation NSObject (Extensions)
- (void) forEachProperty:(forEachProperty) cb {
  unsigned int count=0;
  objc_property_t *props = class_copyPropertyList([self class],&count);

  for (int i=0;i<count;i++) {
    const char *str = property_getName(props[i]);
    NSString *name = [NSString stringWithUTF8String:str];
    NSObject *value = [self valueForKey:name];
    cb(name, value);
  }
}
@end
