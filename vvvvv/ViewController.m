//
//  ViewController.m
//  vvvvv
//
//  Created by 栾有数 on 15/11/13.
//  Copyright © 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
{
    UILabel * label;
    int i;
    CGRect rect;
    UIWindow * window ;
}
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    rect = [UIScreen mainScreen].bounds;
    i = 0;
    // Do any additional setup after loading the view, typically from a nib.
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 20)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
    NSTimer* timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(setLabel) userInfo:nil repeats:YES];
    [timer fire];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
   
    
}
- (void) setLabel{
    i++;
    label.text = [NSString stringWithFormat:@"%d",i];
}
- (IBAction)clicked:(id)sender {
//    [self show];
    window =  [[UIApplication sharedApplication].windows lastObject];
    window.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
    tap.numberOfTapsRequired = 1;
    [window addGestureRecognizer:tap];
    
//    [label removeFromSuperview];
    [window addSubview:label];
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         label.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
//                         label.transform = cga
                         label.backgroundColor = [[UIColor alloc] initWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0];
                         label.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
                     }completion:^(BOOL finished) {
                         [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

                     }];
    
}
-(void)remove{
   
    
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         label.transform = CGAffineTransformIdentity;
                         label.frame = CGRectMake(0, 0, rect.size.width, 20);
                         [self.view addSubview:label];
                     }completion:^(BOOL finished) {
                         [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

                     }];
}
-(void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer{
    
}
-(void)show
{
    
    UIWindow *keyv=[[UIApplication sharedApplication] keyWindow];
    UIView *viewss=[[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 480)];
    [viewss setBackgroundColor:[UIColor redColor]];
    viewss.alpha=0.4;
    [keyv addSubview:viewss];

    return;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
