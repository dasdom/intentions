//
//  ViewController2.m
//  Intentions
//
//  Created by Dominik Hauser on 23.05.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

#import "ViewController2.h"
#import "ModelContainer.h"
#import "Person.h"
#import "View2.h"

#import "ReverseIntention.h"
#import "UppercaseIntention.h"
#import "DismissOnEnterIntention.h"
#import "ObserveIntention.h"

@interface ViewController2 ()
@property (strong, nonatomic) ModelContainer* modelContainer;

@property (nonatomic, strong) ReverseIntention *reverseIntention;
@property (nonatomic, strong) UppercaseIntention *uppercaseIntention;
@property (nonatomic, strong) DismissOnEnterIntention *dismissOnEnterIntention;
@property (nonatomic, strong) ObserveIntention *observeIntentionForTextField;
@property (nonatomic, strong) ObserveIntention *observeIntentionForLabel;
@end

@implementation ViewController2

- (instancetype)init {
    self = [super init];
    if (self) {
        _modelContainer = [[ModelContainer alloc] init];
    }
    return self;
}

- (void)loadView {
    View2 *contentView = [[View2 alloc] init];
    
    Person *person = [Person new];
    person.name = @"Dominik";
    self.modelContainer.model = person;
    
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.reverseIntention = [[ReverseIntention alloc] initWithModelContainer:self.modelContainer modelKeyPath:@"name" textField:((View2*)self.view).textField];
    _uppercaseIntention = [[UppercaseIntention alloc] initWithModelContainer:_modelContainer modelKeyPath:@"name" textField:((View2*)self.view).textField];
    _dismissOnEnterIntention = [[DismissOnEnterIntention alloc] init];
    _observeIntentionForTextField = [[ObserveIntention alloc] initWithSource:_modelContainer sourceKeyPath:@"model.name" target:((View2*)self.view).textField targetKeyPath:@"text"];
    _observeIntentionForLabel = [[ObserveIntention alloc] initWithSource:_modelContainer sourceKeyPath:@"model.name" target:((View2*)self.view).label targetKeyPath:@"text"];
    
    [((View2*)self.view).reverseButton addTarget:_reverseIntention action:@selector(reverse) forControlEvents:UIControlEventTouchUpInside];
    [((View2*)self.view).uppercaseButton addTarget:_uppercaseIntention action:@selector(capitalize) forControlEvents:UIControlEventTouchUpInside];
    ((View2*)self.view).textField.delegate = _dismissOnEnterIntention;
}


@end
