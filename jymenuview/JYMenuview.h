//
//  JYMenuview.h
//  JYMenuview
//
//  Created by MAC on 16/5/30.
//  Copyright © 2016年 JackYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYMenuview : UIView

+(instancetype)CreateJYMenuviewWithFrame:(CGRect)frame SelectedAction:(void(^)(NSInteger row))selected;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
