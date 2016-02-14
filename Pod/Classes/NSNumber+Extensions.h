//
//  NSNumber+Extensions.h
//  PlantLife
//
//  Created by Lee Irvine on 12/23/13.
//  Copyright (c) 2013 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extensions)
- (BOOL) isEqualFloat:(id)object;
- (NSString *) descriptionWithSign;
- (NSString *) withCommas;
@end

float minf(float min, float value);
float maxf(float max, float value);
float betweenf(float, float, float);
float trunc2f(float, float);
float round2f(float value, float threshold);