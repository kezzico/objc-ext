//
//  NSObject+NSString_Extensions.m
//  CheapoAir
//
//  Created by MAC9 on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Extensions.h"
#import "NSArray+Extensions.h"

@implementation NSString (Extensions)

- (BOOL) containsString: (NSString *) str {
  NSRange range = [self rangeOfString: str];
  return range.location != NSNotFound;
}

+ (BOOL) isEmpty: (NSString *) str {
  return [[str trim] length] == 0;
}

- (BOOL) hasText {
	return self.trim.length > 0;
}

- (NSString *) search:(NSString *)regex replace:(NSString *)s {
  NSRegularExpression *r = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
  NSString *output = [r stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:s];
  return output;
}

- (BOOL) isMatch:(NSString *) regex {
  NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", regex];
  return [test evaluateWithObject: self];  
}

- (NSArray *) rangesForPattern:(NSString *) search {
  if(search.length == 0) return nil;
  
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:search options:NSRegularExpressionCaseInsensitive error:nil];
  NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
  
  return [matches mapObjects:^id(NSTextCheckingResult *match) {
  	NSRange range = match.range;
    NSValue *output = [NSValue valueWithRange:range];
    return output;
  }];
}

- (NSString *) trim {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *) uuid {
  CFUUIDRef uuid = CFUUIDCreate(NULL);
  CFStringRef string = CFUUIDCreateString(NULL, uuid);
  CFRelease(uuid);
  
  return (__bridge NSString *)string;
}

- (NSString *) htmlEncode {
  NSString *output = [self search:@"\\&" replace:@"&amp"];
  output = [output search:@"<" replace:@"&lt;"];
  output = [output search:@">" replace:@"&gt;"];
  output = [output search:@"'" replace:@"&apos;"];
  output = [output search:@"\"" replace:@"&quot;"];
  return output;
}

- (NSArray *) split:(NSString *) seperator {
	return [self componentsSeparatedByString:seperator];
}

- (NSArray *) splitRegex:(NSString *) pattern {
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
  NSMutableArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)].mutableCopy;
  [matches addObject:NSNull.null];
  
  __block NSInteger biteStart = 0;
  NSArray *output = [matches mapObjects:^id(NSTextCheckingResult *match) {
  	if((NSNull*)match == NSNull.null) {
    	NSInteger length = self.length - biteStart;
      if(length == 0) return nil;
      
      NSString *lastBite = [self substringWithRange:NSMakeRange(biteStart, length)];
      return lastBite;
    }
    
  	NSInteger biteEnd = match.range.location;
    NSInteger biteSize = biteEnd - biteStart;
    NSInteger seperatorEnd = biteEnd + match.range.length;
    
    if(biteSize <= 0) {
    	biteStart = seperatorEnd;
      return nil;
    }
    
    NSString *nibble = [self substringWithRange:NSMakeRange(biteStart, biteSize)];
		biteStart = seperatorEnd;
    
    return nibble;
  }];
  
  return output;
}

- (NSArray *) capture:(NSString *) pattern {
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
  NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
	NSMutableArray *output = [NSMutableArray array];
  
  for(NSTextCheckingResult *match in matches) {
  	for(NSInteger i=1;i<match.numberOfRanges;i++) {
      NSRange matchRange = [match rangeAtIndex:i];
      if(matchRange.length == 0) continue;
      
      NSString *matchString = [self substringWithRange:matchRange];

    	[output addObject:matchString];
    }
  }

	return output;
}

@end

@implementation NSAttributedString (Extensions)
- (NSDictionary *) attributes {
  NSDictionary *attributes = [(NSAttributedString *)self attributesAtIndex:0 effectiveRange:NULL];
	return attributes;
}

@end