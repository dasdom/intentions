//
//  View.m
//  Intentions
//
//  Created by dasdom on 22.05.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

#import "View.h"

#import "ReverseIntention.h"
#import "UppercaseIntention.h"
#import "DismissOnEnterIntention.h"
#import "ObserveIntention.h"

@interface View ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *reverseButton;
@property (nonatomic, strong) UIButton *uppercaseButton;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) ReverseIntention *reverseIntention;
@property (nonatomic, strong) UppercaseIntention *uppercaseIntention;
@property (nonatomic, strong) DismissOnEnterIntention *dismissOnEnterIntention;
@property (nonatomic, strong) ObserveIntention *observeIntentionForTextField;
@property (nonatomic, strong) ObserveIntention *observeIntentionForLabel;
@end

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // ModelContainer
        _modelContainer = [[ModelContainer alloc] init];
        
        // UI
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_textField];
        
        _reverseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _reverseButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_reverseButton setTitle:@"Reverse" forState:UIControlStateNormal];
        [self addSubview:_reverseButton];
        
        _uppercaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _uppercaseButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_uppercaseButton setTitle:@"Uppercase" forState:UIControlStateNormal];
        [self addSubview:_uppercaseButton];
        
        _label = [[UILabel alloc] init];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        _label.text = @"Label";
        [self addSubview:_label];
        
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_textField, _reverseButton, _uppercaseButton, _label);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_textField(==_label)]-20-|" options:kNilOptions metrics:nil views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_textField]-20-[_reverseButton(40)]-20-[_label(==30)]" options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDictionary]];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_textField]-20-[_uppercaseButton(==_reverseButton)]" options:NSLayoutFormatAlignAllRight metrics:nil views:viewsDictionary]];
        
        // Intentions
        _reverseIntention = [[ReverseIntention alloc] initWithModelContainer:_modelContainer modelKeyPath:@"name" textField:_textField];
        _uppercaseIntention = [[UppercaseIntention alloc] initWithModelContainer:_modelContainer modelKeyPath:@"name" textField:_textField];
        _dismissOnEnterIntention = [[DismissOnEnterIntention alloc] init];
        _observeIntentionForTextField = [[ObserveIntention alloc] initWithSource:_modelContainer sourceKeyPath:@"model.name" target:_textField targetKeyPath:@"text"];
        _observeIntentionForLabel = [[ObserveIntention alloc] initWithSource:_modelContainer sourceKeyPath:@"model.name" target:_label targetKeyPath:@"text"];
        
        [_reverseButton addTarget:_reverseIntention action:@selector(reverse) forControlEvents:UIControlEventTouchUpInside];
        [_uppercaseButton addTarget:_uppercaseIntention action:@selector(capitalize) forControlEvents:UIControlEventTouchUpInside];
        _textField.delegate = _dismissOnEnterIntention;
    }
    return self;
}

@end
