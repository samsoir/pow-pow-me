//
//  MDFFetchGlobalSearchResultsContext.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFFetchGlobalSearchResultsContext__
#define __MDFFetchGlobalSearchResultsContext__

FOUNDATION_EXPORT NSString * const kMDFFetchGlobalSearchResultsContextCompleted;
FOUNDATION_EXPORT NSString * const kMDFFetchGlobalSearchResultsContextStarted;

#import <Foundation/Foundation.h>
#import "MDFDictionaryToAnnotationDecorator.h"
#import "MDFPPMMockClient.h"

@interface MDFFetchGlobalSearchResultsContext : NSOperation

@property (nonatomic, assign) Class<MDFDictionaryToAnnotationDecoratorProtocol> decorator;
@property (nonatomic, strong) id<MDFPPMClientProtocol> client;

- (id)initWithClient:(id<MDFPPMClientProtocol>)client decorator:(Class<MDFDictionaryToAnnotationDecoratorProtocol>)decorator;

@end

#endif