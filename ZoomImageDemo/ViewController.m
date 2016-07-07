//
//  ViewController.m
//  ZoomImageDemo
//
//  Created by yindongbo on 16/7/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "ViewController.h"
#import "ZoomImageView.h"
@interface ViewController () 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * imageViewA = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a"]];
    imageViewA.frame = CGRectMake(100, 100, 200, 150);
    imageViewA.userInteractionEnabled = YES;
    imageViewA.tag = 100;
    [self.view addSubview:imageViewA];
    
    UIImageView * imageViewB = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
    imageViewB.frame = CGRectMake(100, 300, 200, 150);
    imageViewB.userInteractionEnabled = YES;
    imageViewB.tag = 200;
    [self.view addSubview:imageViewB];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.cancelsTouchesInView = NO;
    [imageViewA addGestureRecognizer:tap];
    [imageViewB addGestureRecognizer:tap];
}

-(void)tap:(id )sender{
    UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
    UIImageView * imageView = nil;
    for (UIImageView * subImage in self.view.subviews)
    {
        if (subImage.tag == tap.view.tag)
        {
            imageView = subImage;
        }
    }
    
    if (imageView.image)
    {
        [ZoomImageView showImage:imageView];
    }
}



@end
