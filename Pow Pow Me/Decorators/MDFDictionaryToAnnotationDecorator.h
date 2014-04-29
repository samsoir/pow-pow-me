//
//  MDFDictionaryToAnnotationDecorator.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol MDFDictionaryToAnnotationDecoratorProtocol <NSObject>

+ (id<MKAnnotation>)decorateDictionary:(NSDictionary *)dictionary;

@end

@interface MDFDictionaryToAnnotationDecorator : NSObject <MDFDictionaryToAnnotationDecoratorProtocol>

+ (id<MKAnnotation>)decorateDictionary:(NSDictionary *)dictionary;

@end
