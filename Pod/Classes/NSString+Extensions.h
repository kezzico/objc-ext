//
//  NSObject+NSString_Extensions.h
//  CheapoAir
//
//  Created by MAC9 on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSArray *) split:(NSString *) seperator;
- (NSString *) search:(NSString *) regex replace:(NSString *) s;
- (BOOL) containsString: (NSString *) str;
- (BOOL) isMatch:(NSString *) regex;
+ (BOOL) isEmpty: (NSString *) str;
+ (NSString *) uuid;
- (NSString *) htmlEncode;
- (NSString *) trim;
- (BOOL) hasText;
- (NSArray *) rangesForPattern:(NSString *) search;
- (NSArray *) splitRegex:(NSString *) pattern;
- (NSArray *) capture:(NSString *) pattern;

@end

@interface NSAttributedString (Extensions)
- (NSDictionary *) attributes;

@end
