//
//  MLoctionVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/18.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^GetAddress) (NSString* address);

@interface MLoctionVO : NSObject

+(instancetype)stand;

-(void)getAddressWithCoordinate:(CLLocationCoordinate2D)coordinate address:(GetAddress)addres;
-(void)getAddressWithLocation:(CLLocation*)location address:(GetAddress)address;
-(NSString*)getAddressWithPlacemark:(CLPlacemark*)placemark;

@end
