//
//  NSURL+Extensions.m
//  plantlife
//
//  Created by Lee Irvine on 10/22/14.
//  Copyright (c) 2014 kezzi.co. All rights reserved.
//

#import "NSURL+Extensions.h"

@implementation NSURL (Extensions)
+ (NSURL *) urlForLibraryFile:(NSString *) file {
  NSURL *libraryDir = [[[NSFileManager defaultManager] URLsForDirectory: NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
  return [libraryDir URLByAppendingPathComponent:file];
}

+ (NSURL *) urlForDocumentsFile:(NSString *) file {
  NSURL *documentsUrl = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
	return [documentsUrl URLByAppendingPathComponent: file];
}
@end
