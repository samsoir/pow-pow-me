//
//  MDFClientOperation.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 20/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFClientOperation.h"

@implementation MDFClientOperation

- (id)initWithClient:(id<MDFPPMClientProtocol>)client
{
    self = [super init];
    
    if (self)
    {
        self.client = client;
    }
    
    return self;
}

@end
