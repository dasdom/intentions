//
//  View.h
//  Intentions
//
//  Created by dasdom on 22.05.14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelContainer.h"

@interface View : UIView
@property (nonatomic, strong) ModelContainer *modelContainer;
@end
