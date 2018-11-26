//
//  UITableView+YHBaseCategory.m
//  TempDemo
//
//  Created by 赵一欢 on 2018/6/21.
//  Copyright © 2018年 zhaoyihuan. All rights reserved.
//

#import "UITableView+YHBaseCategory.h"

@implementation UITableView (YHBaseCategory)
- (void)normalConfig {
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableFooterView = [[UIView alloc] init];
}
@end
