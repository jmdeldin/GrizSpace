//
//  MapAnnotation.m
//  GrizSpace
//
//  Created by Kevin Scott on 3/3/12. 
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"

#import "MapAnnotation.h"


@implementation MapAnnotation
@synthesize coordinate,title,subtitle, keyVal, annotationType, radius;



//overloaded constructor.
- (id) initWithAnnotationDataKeyID: (int) newKeyID annotationType: (NSString*) newAnnotationType coordinate: (CLLocationCoordinate2D) newCoordinate title: (NSString*) newTitle subtitle: (NSString*) newSubtitle radius: (int) newRadius;
{
    if (self = [super init])
    {
        [self setKeyVal:newKeyID];
        [self setAnnotationType:newAnnotationType];
        [self setCoordinate:newCoordinate];
        [self setTitle:newTitle];
        [self setSubtitle:newSubtitle];  
        [self setRadius:newRadius];
    }
    return self;
}

//default constructor
-(id) init {
    //call overloaded contructor to ensure initialization of data
    return [self initWithAnnotationDataKeyID:0 annotationType:@"" coordinate:CLLocationCoordinate2DMake(46.860917, -113.985968) title:@"" subtitle:@"" radius:100];
}


@end
