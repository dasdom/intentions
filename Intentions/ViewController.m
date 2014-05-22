//
//  ViewController.m
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//
//  Modified by Dominik Hauser
//

#import "ViewController.h"
#import "ModelContainer.h"
#import "Person.h"
#import "View.h"

@interface ViewController ()

@property (strong, nonatomic) ModelContainer* modelContainer;

@end

@implementation ViewController

- (void)loadView {
    View *contentView = [[View alloc] init];

    self.modelContainer = contentView.modelContainer;
    
    Person *person = [Person new];
    person.name = @"Dominik";
    self.modelContainer.model = person;
    
    self.view = contentView;
}

@end