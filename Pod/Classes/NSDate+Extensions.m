//
//  NSDate+Extensions.m
//  PlantLife
//
//  Created by Lee Irvine on 7/22/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import "NSDate+Extensions.h"

static NSMutableDictionary *__formatters;
@implementation NSDate (Extensions)

+ (void) initialize {
  __formatters = [[NSMutableDictionary alloc] init];
}

-(NSDate *) toLocalTime {
  NSTimeZone *tz = [NSTimeZone defaultTimeZone];
  NSInteger seconds = [tz secondsFromGMTForDate: self];
  return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

+ (NSDate *) dateForDay: (uint) day month: (uint) month year: (uint) year {
  NSDateComponents *c = [[NSDateComponents alloc] init];
  c.calendar = [NSCalendar currentCalendar];
  c.day = day;
  c.month = month;
  c.year = year;
  return [[NSCalendar currentCalendar] dateFromComponents:c];
}

- (NSString *) format:(NSString *)format {
  NSDateFormatter *formatter = [__formatters valueForKey:format];
  if(formatter == nil) {
    formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]){
      [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es_MX"]];
    }
    else{
      if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"en"]){
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
      }
      else{
        [formatter setLocale:[NSLocale currentLocale]];
      }
    }
    [__formatters setValue:formatter forKey:format];
  }
  
  return [formatter stringFromDate: self];
}

- (BOOL) isToday {
	return [self isSameDay:[NSDate date]];
}

- (BOOL) isSameDay: (NSDate *) date {
  NSInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
  NSDateComponents *c1 = [[NSCalendar currentCalendar] components:units fromDate:self];
  NSDateComponents *c2 = [[NSCalendar currentCalendar] components:units fromDate:date];
  return c1.day == c2.day && c1.month == c2.month && c1.year == c2.year;
}

- (NSInteger) daysBetween:(NSDate *) date {
    NSDateComponents *difference = [NSCalendar.currentCalendar components:NSCalendarUnitDay fromDate:self toDate:date options:0];
    return [difference day];
}

- (NSInteger) dayOfMonth {
	return [NSCalendar.currentCalendar component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger) daysBeforeNow {
	NSDateComponents *conversionInfo = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:[NSDate date]  options:0];
	return [conversionInfo day];
}

- (NSInteger) minutesBeforeNow {
	NSDateComponents *conversionInfo = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self toDate:[NSDate date]  options:0];
	return [conversionInfo minute];
}

- (NSInteger) secondsBeforeNow {
	NSDateComponents *conversionInfo = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self toDate:[NSDate date]  options:0];
	return [conversionInfo second];
}

- (BOOL) isBefore: (NSDate *) date {
	return [self compare:date] == NSOrderedAscending;
}

- (BOOL) isAfter: (NSDate *) date {
	return [self compare:date] != NSOrderedAscending;
}

@end
