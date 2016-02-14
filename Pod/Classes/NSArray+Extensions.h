//
//  NSArray-Extensions.h
//  PenguinCross
//
//  Created by Lee Irvine on 7/22/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Types.h"

typedef id (^forEachIndex)(NSInteger index);
typedef void (^forEach)(NSInteger index, id obj);
typedef BOOL (^filterCheck)(id obj);
typedef BOOL (^objectCheck)(id obj);

@interface NSArray (Extensions)
- (NSString *) join:(NSString *) seperator;
- (NSString *) join:(NSString *) seperator field:(NSString *) fieldName;
- (NSString *) join;

- (NSArray *) mapObjects:(mapper) rule;
+ (NSArray *) loop:(NSInteger) size andMakeArray:(forEachIndex) foreach;

- (NSArray *) take:(NSInteger) count;
- (NSArray *) sortedArray:(NSString *) fields;
- (void) forEach:(forEach) action;
- (NSArray *) filter: (filterCheck) objectCheck;
- (id) firstObjectMatching:(objectCheck) czech;
- (NSSet *) set;
@end

@interface NSMutableArray (Extensions)
- (void) sortArray:(NSString *) fields;
- (NSMutableSet *) set;
@end