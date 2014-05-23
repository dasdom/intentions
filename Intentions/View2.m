//
//  View2.m
//  Intentions
//
//  Created by Dominik Hauser on 23.05.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

#import "View2.h"

@implementation View2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
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
    }
    return self;
}

@end
