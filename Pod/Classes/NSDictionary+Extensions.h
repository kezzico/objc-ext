//
//  NSDictionary-Extensions.h
//  Cheapo
//
//  Created by Lee Irvine on 3/1/13.
//  Copyright (c) 2013 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Types.h"
typedef void (^forEachKey)(id key, id value);
@interface NSDictionary (Extensions)
+ (NSDictionary *) dictionaryWithArray:(NSArray *) array key:(mapper) cb;
+ (NSDictionary *) jsonFromResource:(NSString *) resource ofType:(NSString *) type;
+ (NSDictionary *) dictionaryWithJson:(NSData *) data;
+ (NSMutableDictionary *) cacheWithName:(NSString *) name;
- (NSData *) json;

- (void) forEachKey:(forEachKey) action;

@end
