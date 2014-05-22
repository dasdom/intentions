//
//  ObserveIntention.m
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  ObserveIntention.m
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  Modified by Dominik Hauser
//

#import "ObserveIntention.h"
#import "ModelContainer.h"

@interface ObserveIntention ()

@property (strong, nonatomic) id sourceObject;
@property (strong, nonatomic) id targetObject;
@property (copy, nonatomic) NSString *sourceKeyPath;
@property (copy, nonatomic) NSString *targetKeyPath;

@end

@implementation ObserveIntention

- (void)dealloc {
    [self.sourceObject removeObserver:self forKeyPath:self.sourceKeyPath];
}

- (instancetype)initWithSource:(id)sourceObject sourceKeyPath:(NSString*)sourceKeyPath target:(id)targetObject targetKeyPath:(NSString*)targetKeyPath {
    self = [super init];
    if (self) {
        _sourceObject = sourceObject;
        _sourceKeyPath = sourceKeyPath;
        _targetObject = targetObject;
        _targetKeyPath = targetKeyPath;
        
        [self updateValue];
        [self.sourceObject addObserver:self forKeyPath:self.sourceKeyPath options:0 context:nil];
    }
    return self;
}

- (instancetype)init {
    NSAssert(false, @"Use initWithSource:sourceKeyPath:target:targetKeyPath:");
    return nil;
}

- (void)updateValue
{
    id value = [self.sourceObject valueForKeyPath:self.sourceKeyPath];
    if (self.targetKeyPath) {
        [self.targetObject setValue:value forKeyPath:self.targetKeyPath];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:self.sourceKeyPath]) {
        [self updateValue];
    }
}

@end
