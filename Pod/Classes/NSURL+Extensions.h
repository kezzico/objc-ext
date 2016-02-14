//
//  NSURL+Extensions.h
//  plantlife
//
//  Created by Lee Irvine on 10/22/14.
//  Copyright (c) 2014 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Extensions)
+ (NSURL *) urlForDocumentsFile:(NSString *) file;
+ (NSURL *) urlForLibraryFile:(NSString *) file;

@end
