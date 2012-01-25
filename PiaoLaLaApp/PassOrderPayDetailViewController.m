//
//  PassOrderPayDetailViewController.m
//  piaoLaLa
//
//  Created by 高飞 on 11-11-29.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PassOrderPayDetailViewController.h"
#import "AlipayConnect.h"
@implementation PassOrderPayDetailViewController
@synthesize back = _back;
@synthesize timeLabel = _timeLabel;
@synthesize cinemaLabel = _cinemaLabel;
@synthesize typeLabel = _typeLabel;
@synthesize numLabel =_numLabel;
@synthesize priceLabel =_priceLabel;
@synthesize phoneLabel = _phoneLabel;
@synthesize singleLabel = _singleLabel;


-(void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.navigationController.navigationBarHidden = YES;
}

-(void)loadView{
    [super loadView];
    //导航条
    UIImageView *_navigationHeader = [[[UIImageView alloc] initWithImage:TTIMAGE(@"bundle://titlebar02.png")] autorelease];
    [_navigationHeader setUserInteractionEnabled:YES];
    _navigationHeader.frame = CGRectMake(0, 0, 320, 44);
    
    
    UIImageView *_backGround = [[[UIImageView alloc] initWithImage:TTIMAGE(@"bundle://background02.png")] autorelease];
    _backGround.frame = CGRectMake(0, 44, 320, 420);
    [self.view addSubview:_backGround];
    [self.view sendSubviewToBack:_backGround];
    [self.view addSubview:_navigationHeader];
    
    self.back.backgroundColor = [UIColor clearColor];
    self.back.style = [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:8] next:
                       [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
                        [TTSolidBorderStyle styleWithColor:RGBCOLOR(158, 163, 172) width:1 next:nil]]];
    
    UILabel *_titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:22];
    _titleLabel.text = @"订单详情";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = UITextAlignmentCenter;
    _titleLabel.frame = CGRectMake(0, (22/2), 320, 22);
    _titleLabel.backgroundColor = [UIColor clearColor];
    [_navigationHeader addSubview:_titleLabel];
    [_titleLabel release];
    
    UIButton *_backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setBackgroundImage:TTIMAGE(@"bundle://button1_1.png")  forState:UIControlStateNormal];
    [_backButton setBackgroundImage:TTIMAGE(@"bundle://button1_2.png")  forState:UIControlStateHighlighted];
    [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    _backButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    _backButton.frame = CGRectMake(5, (44-29)/2, 50, 29);
    [_navigationHeader addSubview:_backButton];
    
    NSDictionary *_order = [kAppDelegate.temporaryValues objectForKey:@"orderInfo"];
    //NSLog(@"_order %@",_order);
    self.singleLabel.text = [_order objectForKey:@"ORDERNO"];
    self.timeLabel.text = [_order objectForKey:@"ORDERDATE"];
    self.cinemaLabel.text = [_order objectForKey:@"FIRMNAME"];
    self.priceLabel.text = [NSString stringWithFormat:@"%@ (%@张)",
                            [_order objectForKey:@"ORDERMONEY"],
                            [_order objectForKey:@"ORDERNUM"]];
    self.typeLabel.text = [_order objectForKey:@"TICKETNAME"];
   // self.phoneLabel.text = 
}



-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
