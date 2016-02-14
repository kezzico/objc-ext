//
//  NSNumber+Extensions.m
//  PlantLife
//
//  Created by Lee Irvine on 12/23/13.
//  Copyright (c) 2013 kezzi.co. All rights reserved.
//

#import "NSNumber+Extensions.h"

@implementation NSNumber (Extensions)

- (NSString *) withCommas {
  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
//  [numberFormatter setGroupingSeparator:@","];
//  NSString* commaString = [numberFormatter stringForObjectValue:self];
  return [numberFormatter stringFromNumber:self];

}

- (BOOL) isEqualFloat:(id)object {
	if ([[object class] isSubclassOfClass:[NSNumber class]] == NO) {
  	return [super isEqual:object];
  }
  
  double ep = 0.001;
  double value1 = [self doubleValue];
  double value2 = [object doubleValue];
  
  return fabs(value1 - value2) < ep;
}

- (NSString *) descriptionWithSign {
  NSNumberFormatter *formatter = [NSNumberFormatter.alloc init];
	NSString *plusSign = self.floatValue > 0 ? @"+" : @"";
  NSString *number = [formatter stringFromNumber:@(self.floatValue)];

	return [NSString stringWithFormat:@"%@%@", plusSign, number];
}

@end

float minf(float min, float value) {
  return value < min ? min : value;
}

float maxf(float max, float value) {
  return value > max ? max : value;
}

float betweenf(float min, float max, float value) {
	if(value > max) return max;
  if(value < min) return min;
  return value;
}

float trunc2f(float value, float digits) {
	float multiply = 1.f / digits;
  float output = roundf(value * multiply) / multiply;
  return output;
}

// 34.75 + .25f = 35.f, 35
// 34.6 + .25f = 34.95, 34
float round2f(float value, float threshold) {
	NSInteger valueInt = value;
  NSInteger valuePlusThresh = fabs(value + (1.0f - threshold));

  if(valueInt == valuePlusThresh) return valueInt;
  if(value > 0.f) return ceilf(value);
  
  return floorf(value);
}
