//
//  ViewController.m
//  Message Send
//
//  Created by yesdgq on 2018/12/23.
//  Copyright © 2018 yesdgq. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Persion *persion = [[Persion alloc] init];
    [persion sendMessage:@"hell runtime"];
}


@end
