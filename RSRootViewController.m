//
//  RSRootViewController.m
//  SimpleViewControllerContainer
//
//  Created by Jerry Lei on 14-1-15.
//  Copyright (c) 2014年 Raystorm. All rights reserved.
//

#import "RSRootViewController.h"

#import "RSSub1ViewController.h"
#import "RSSub2ViewController.h"
#import "RSSub3ViewController.h"
#import "RSSub4ViewController.h"


@interface RSRootViewController ()
@property (nonatomic, strong) RSSub1ViewController * sub1VC;
@property (nonatomic, strong) RSSub2ViewController * sub2VC;
@property (nonatomic, strong) RSSub3ViewController * sub3VC;
@property (nonatomic, strong) RSSub4ViewController * sub4VC;

@end

@implementation RSRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect fullScreen = CGRectMake(0, 0, 320, 576);
    self.sub1VC = [[RSSub1ViewController alloc] initWithNibName:@"RSSub1ViewController" bundle:nil];
    self.sub2VC = [[RSSub2ViewController alloc] initWithNibName:@"RSSub2ViewController" bundle:nil];
    self.sub3VC = [[RSSub3ViewController alloc] initWithNibName:@"RSSub3ViewController" bundle:nil];
    self.sub4VC = [[RSSub4ViewController alloc] initWithNibName:@"RSSub4ViewController" bundle:nil];
    [self.view addSubview:self.sub1VC.view];
    self.sub1VC.view.frame = fullScreen;
    [self.view addSubview:self.sub2VC.view];
    self.sub2VC.view.frame = fullScreen;
    [self.view addSubview:self.sub3VC.view];
    self.sub3VC.view.frame = fullScreen;
    [self.view addSubview:self.sub4VC.view];
    self.sub4VC.view.frame = fullScreen;

    [self addChildViewController:self.sub1VC];
    [self addChildViewController:self.sub2VC];
    [self addChildViewController:self.sub3VC];
    [self addChildViewController:self.sub4VC];
//    [sub1VC removeFromParentViewController];
//    [sub2VC removeFromParentViewController];
    
    NSLog(@"all children view controllers: %@", self.childViewControllers);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(touchUpInside:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpInside:(id)sender {
    NSLog(@"touchUpInside");
    static int index = 4;
    CGRect rightRect = CGRectMake(320, 0, 320, 576);
    CGRect currentRect = CGRectMake(0, 0, 320, 576);
    self.sub1VC.view.frame = rightRect;
    self.sub2VC.view.frame = rightRect;
    self.sub3VC.view.frame = rightRect;
    self.sub4VC.view.frame = rightRect;
    switch (index) {
        case 1:
        {
            index ++;
            [self transitionFromViewController:self.sub1VC toViewController:self.sub2VC duration:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.sub2VC.view.frame = currentRect;
            } completion:^(BOOL finished) {
                NSLog(@"is finished: %d", finished);

            }];
        }
            break;
        case 2:
        {
            index ++;
            [self transitionFromViewController:self.sub2VC toViewController:self.sub3VC duration:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.sub3VC.view.frame = currentRect;

            } completion:^(BOOL finished) {
                NSLog(@"is finished: %d", finished);
            }];

        }
            break;
        case 3:
        {
            index ++;
            [self transitionFromViewController:self.sub3VC toViewController:self.sub4VC duration:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.sub4VC.view.frame = currentRect;

            } completion:^(BOOL finished) {
                NSLog(@"is finished: %d", finished);
            }];

        }
            break;
        case 4:
        {
            index = 1;
            [self transitionFromViewController:self.sub4VC toViewController:self.sub1VC duration:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.sub1VC.view.frame = currentRect;

            } completion:^(BOOL finished) {
                NSLog(@"is finished: %d", finished);
            }];

        }
            break;
            
        default:
            break;
    }
    
}
@end
