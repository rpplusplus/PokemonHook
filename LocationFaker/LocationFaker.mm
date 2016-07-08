//
//  LocationFaker.mm
//  LocationFaker
//
//  Created by Xiaoxuan Tang on 16/7/8.
//  Copyright (c) 2016年 __MyCompanyName__. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>

@interface CLLocation(Swizzle)

@end

@implementation CLLocation(Swizzle)

static float x = -1;
static float y = -1;

+ (void) load {
    Method m1 = class_getInstanceMethod(self, @selector(coordinate));
    Method m2 = class_getInstanceMethod(self, @selector(coordinate_));
    
    method_exchangeImplementations(m1, m2);
}

- (CLLocationCoordinate2D) coordinate_ {
    
    CLLocationCoordinate2D pos = [self coordinate_];
    
    // 算与联合广场的坐标偏移量
    if (x == -1 && y == -1) {
        x = pos.latitude - 37.7883923;
        y = pos.longitude - (-122.4076413);
    }
    
    return CLLocationCoordinate2DMake(pos.latitude-x, pos.longitude-y);
}

@end

