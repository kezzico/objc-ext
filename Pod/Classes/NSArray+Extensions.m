//
//  NSArray-Extensions.m
//  PenguinCross
//
//  Created by Lee Irvine on 7/22/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import "NSArray+Extensions.h"
#import "NSString+Extensions.h"

@implementation NSArray (Extensions)
- (void) forEach:(forEach) action {
	NSInteger index = 0;
  for(id obj in self) {
  	action(index++, obj);
	}
}

- (NSArray *) mapObjects:(mapper) mapper {
  NSMutableArray *output = [[NSMutableArray alloc] initWithCapacity:[self count]];
  for(id obj in self) {
    id objToAdd = mapper(obj);
    if(objToAdd == nil) continue;
    
    [output addObject: objToAdd];
  }
  
  return [NSArray arrayWithArray:output];
}

+ (NSArray *) loop:(NSInteger) size andMakeArray:(forEachIndex) foreach {
  NSMutableArray *output = [[NSMutableArray alloc] initWithCapacity:size];
  for(NSInteger i=0;i<size;i++) {
  	id value = foreach(i);    
    [output addObject: value];
  }
  
  return [NSArray arrayWithArray:output];
  
}

- (NSArray *) sortedArray:(NSString *) fields {
	NSArray *sorts = [NSArray queryToSorts:fields];
  
  return [self sortedArrayUsingDescriptors:sorts];
}

- (NSString *) join:(NSString *) seperator {
	BOOL isValidSeperator = seperator.length != 0;
  NSMutableString *output = [[NSMutableString alloc] init];
  
	for(NSInteger i=0;i<self.count;i++) {
  	NSObject *obj = [self objectAtIndex:i];
    [output appendString: [obj description]];
    
    if(i != self.count - 1 && isValidSeperator) {
      [output appendString: seperator];
    }
  }
  
  return [NSString stringWithString: output];
}

- (NSString *) join {
	return [self join:@""];
}

- (NSString *) join:(NSString *) seperator field:(NSString *) fieldName {
	BOOL isValidSeperator = seperator.length != 0;
  NSMutableString *output = [[NSMutableString alloc] init];
  
	for(NSInteger i=0;i<self.count;i++) {
  	NSObject *obj = [self objectAtIndex:i];
    [output appendString: [[obj valueForKey:fieldName] description]];
    
    if(i != self.count - 1 && isValidSeperator) {
      [output appendString: seperator];
    }
  }
  
  return [NSString stringWithString: output];
}

- (NSArray *) take:(NSInteger) count {
	NSMutableArray *output = [NSMutableArray array];
  
	for(NSInteger i=0;i<count&&i<self.count;i++) {
  	[output addObject: [self objectAtIndex: i]];
  }
  
  return output;
}

- (id) firstObjectMatching:(objectCheck) czech {
  for(id obj in self) {
  	if(czech(obj)) return obj;
	}
	
  return nil;
}

- (NSArray *) filter: (filterCheck) objectCheck {
  NSMutableArray *objects = [NSMutableArray array];
  for(id obj in self) {
    if(objectCheck(obj)) [objects addObject:obj];
  }
  
  return objects;
}

- (NSSet *) set {
	return [NSSet setWithArray:self];
}

+ (NSArray *) queryToSorts:(NSString *) query {
	NSArray *sorts = [[query split:@","] mapObjects:^id(NSString *field) {
  	NSString *fieldName = [field substringFromIndex:1];
    BOOL isAscending = [[field substringToIndex:1] isEqual:@"+"];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:fieldName ascending:isAscending];
    return sort;
  }];
  
	return sorts;
}

@end

@implementation NSMutableArray (Extensions)

- (void) sortArray:(NSString *) fields {
	NSArray *sorts = [NSArray queryToSorts:fields];
  
  [self sortUsingDescriptors:sorts];
}

- (NSMutableSet *) set {
	return [NSMutableSet setWithArray:self];
}

@end