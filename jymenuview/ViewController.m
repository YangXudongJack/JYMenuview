//
//  ViewController.m
//  JYMenuview
//
//  Created by MAC on 16/5/30.
//  Copyright © 2016年 JackYang. All rights reserved.
//

#import "ViewController.h"
#import "JYMenuview.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)Action:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)Action:(UIButton *)sender {
    JYMenuview *menu = [JYMenuview CreateJYMenuviewWithFrame:CGRectMake(self.button.frame.origin.x, self.button.frame.origin.y + 30, self.button.frame.size.width, 180) SelectedAction:^(NSInteger row) {
        NSLog(@"%ld",row);
    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        menu.dataSource = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",nil];
//    });
    [self.view addSubview:menu];
}

@end
