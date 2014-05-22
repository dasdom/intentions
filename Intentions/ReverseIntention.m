//
//  ReverseIntention.m
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  Modified by Dominik Hauser
//

#import "ReverseIntention.h"
#import "NSString+Reverse.h"
#import "ModelContainer.h"

@interface ReverseIntention ()

@property (weak, nonatomic) UITextField *textField;
@property (weak, nonatomic) ModelContainer* modelContainer;
@property (copy, nonatomic) NSString * modelKeyPath;

@end

@implementation ReverseIntention

- (instancetype)initWithModelContainer:(ModelContainer*)modelContainer modelKeyPath:(NSString*)modelKeyPath textField:(UITextField*)textField {
    self = [super init];
    if (self) {
        _modelContainer = modelContainer;
        _modelKeyPath = modelKeyPath;
        _textField = textField;
    }
    return self;
}

- (instancetype)init {
    NSAssert(false, @"Use initWithModelContainer:modelKeyPath:textField:");
    return nil;
}

- (void)reverse {
    [self.modelContainer.model setValue:self.textField.text.reversedString forKeyPath:self.modelKeyPath];
}

@end
