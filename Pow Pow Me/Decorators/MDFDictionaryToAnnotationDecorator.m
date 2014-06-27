//
//  MDFDictionaryToAnnotationDecorator.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFDictionaryToAnnotationDecorator.h"

@implementation MDFDictionaryToAnnotationDecorator

+ (id<MKAnnotation>)decorateDictionary:(NSDictionary *)dictionary
{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    [annotation setTitle:[dictionary objectForKey:@"title"]];
    [annotation setSubtitle:[dictionary objectForKey:@"subtitle"]];
    
    [annotation setCoordinate:CLLocationCoordinate2DMake([[dictionary valueForKeyPath:@"coordinates.latitude"] floatValue], [[dictionary valueForKeyPath:@"coordinates.longitude"] floatValue])];
    
    return annotation;
}

@end
