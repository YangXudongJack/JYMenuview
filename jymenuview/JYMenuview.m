//
//  JYMenuview.m
//  JYMenuview
//
//  Created by yxd on 16/5/30.
//  Copyright © 2016年 JackYang. All rights reserved.
//

#import "JYMenuview.h"

@interface JYMenuview () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, copy) void(^SelectedItemBlock)(NSInteger);

@end

@implementation JYMenuview

+(instancetype)CreateJYMenuviewWithFrame:(CGRect)frame SelectedAction:(void(^)(NSInteger row))selected{
    JYMenuview *menu = [[JYMenuview alloc] initWithFrame:frame];
    menu.SelectedItemBlock = selected;
    return menu;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y + 2, frame.size.width, frame.size.height)]) {
        self.layoutMargins = UIEdgeInsetsMake(2, 1, 2, 1);
        
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1].CGColor;
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 2, 0) style:UITableViewStylePlain];
        self.tableview.delegate = self;
        self.tableview.dataSource = self;
        [self hideOtherCell:self.tableview];
        [self addSubview:self.tableview];
        
//        [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        [UIView animateWithDuration:0.2 animations:^{
            self.tableview.frame = CGRectMake(0, 0, frame.size.width - 2, frame.size.height - 4);
        }];
    }
    return self;
}

-(void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    
    CGRect frame = self.frame;
    if (dataSource.count * 25 < 180) {
        frame.size.height = dataSource.count * 25 + 4;
        self.frame = frame;
    }
    
    [self.tableview reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)hideOtherCell:(UITableView *)tableview{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableview setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.SelectedItemBlock(indexPath.row);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tableview.frame = CGRectMake(0, 0, self.tableview.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
