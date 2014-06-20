//
//  MDFClientOperation.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 20/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFClientOperation__
#define __MDFClientOperation__

#import <Foundation/Foundation.h>
#import "MDFPPMMockClient.h"

@interface MDFClientOperation : NSOperation

@property (nonatomic, strong) id<MDFPPMClientProtocol> client;

- (id)initWithClient:(id<MDFPPMClientProtocol>)client;

@end

#endif