//
//  ObserveIntention.h
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  Modified by Dominik Hauser
//

#import <Foundation/Foundation.h>

@interface ObserveIntention : NSObject

- (instancetype)initWithSource:(id)sourceObject sourceKeyPath:(NSString*)sourceKeyPath target:(id)targetObject targetKeyPath:(NSString*)targetKeyPath;

@end
