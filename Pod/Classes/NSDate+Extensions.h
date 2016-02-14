//
//  NSDate+Extensions.h
//  PlantLife
//
//  Created by Lee Irvine on 7/22/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)
+ (NSDate *) dateForDay: (uint) day month: (uint) month year: (uint) year;
- (NSString *) format: (NSString *) format;
- (NSInteger) minutesBeforeNow;
- (NSInteger) secondsBeforeNow;
- (NSInteger) daysBeforeNow;
- (NSInteger) daysBetween:(NSDate *) date;
- (NSInteger) dayOfMonth;
- (NSDate *) toLocalTime;

- (BOOL) isToday;
- (BOOL) isSameDay: (NSDate *) date;
- (BOOL) isBefore: (NSDate *) date;
- (BOOL) isAfter: (NSDate *) date;
@end
