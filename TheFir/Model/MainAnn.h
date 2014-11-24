//
//  MainAnn.h
//  iNews
//
//  Created by 邹建敏 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//


//   大头针

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MainAnn : NSObject <MKAnnotation>

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;

@end
