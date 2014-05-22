//
//  UppercaseIntention.h
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  Modified by Dominik Hauser
//

#import <Foundation/Foundation.h>

@class ModelContainer;

@interface UppercaseIntention : NSObject
- (instancetype)initWithModelContainer:(ModelContainer*)modelContainer modelKeyPath:(NSString*)modelKeyPath textField:(UITextField*)textField;
- (void)capitalize;
@end
