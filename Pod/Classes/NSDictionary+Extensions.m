//
//  NSDictionary-Extensions.m
//  Cheapo
//
//  Created by Lee Irvine on 3/1/13.
//  Copyright (c) 2013 kezzi.co. All rights reserved.
//

#import "NSDictionary+Extensions.h"
#import "NSArray+Extensions.h"

@implementation NSDictionary (Extensions)

+ (NSDictionary *) dictionaryWithArray:(NSArray *) array key:(mapper) m {
	if(array == nil) {
  	return nil;
  }
  
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[array forEach:^(NSInteger index, id obj) {
  	//FIXME: this should handle nils better
    id key = m(obj);
    if(obj != nil && key != nil) {
      [dict setObject:obj forKey:key];
    }
    
  }];
  
  return dict;
}

+ (NSDictionary *) jsonFromResource:(NSString *) resource ofType:(NSString *) type {
  NSString *path = [[NSBundle mainBundle] pathForResource: resource ofType: type];
  NSData *data = [NSData dataWithContentsOfFile:path];
  NSError *error = nil;
  
  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
  if(error) {
    NSLog(@"%@", error);
    return nil;
  }
  
  return json;
}

+ (NSMutableDictionary *) cacheWithName:(NSString *) name {
  static NSMutableDictionary *caches = nil;
  if(caches == nil) {
    caches = [NSMutableDictionary dictionary];
  }
  
  NSMutableDictionary *cache = [caches valueForKey:name];
  if(cache == nil) {
    cache = [NSMutableDictionary dictionary];
    [caches setValue:cache forKey:name];
  }

  return cache;
}

+ (NSDictionary *) dictionaryWithJson:(NSData *) data {
  return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

- (NSData *) json {
  return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (void) forEachKey:(forEachKey) action {
	NSArray *keys = self.allKeys;
  
  for(id key in keys) {
  	action(key, [self objectForKey:key]);
  }
}

@end
