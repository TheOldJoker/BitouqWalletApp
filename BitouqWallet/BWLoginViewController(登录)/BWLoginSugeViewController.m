//
//  BWLoginSelectViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/2.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWLoginSugeViewController.h"

@interface BWLoginSugeViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIPageControl *page;
@end

@implementation BWLoginSugeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initSubviews];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initSubviews{
    if (self.mainTitleLabel == nil) {
        return;
    }
    if (self.mainScrollView != nil) {
        return;
    }
    NSArray *contents = @[@"BRT首次發佈版本oasis，它帶來代幣流動、娛樂、新型社區",@"提出更加環保的Probability-DPoS共識機制，集合幣齡挖礦，共享收益",@"BRTStars將遊戲執行和仲裁權交給區塊，一項遊戲挖礦運動正在進行。"];
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, self.mainTitleLabel.bottom + 16, 279, 49))];
    self.mainScrollView.centerX = SCREEN_WIDTH / 2;
    self.mainScrollView.delegate = self;
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.width * contents.count, self.mainScrollView.height))];
    self.mainScrollView.pagingEnabled = YES;
    [self.view addSubview:self.mainScrollView];
    
    self.page = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, 0, 279, 20))];
    self.page.numberOfPages = contents.count;
    self.page.top = self.mainScrollView.bottom + 15;
    self.page.centerX = self.mainScrollView.centerX;
    [self.view addSubview:self.page];
    
    for (int i = 0; i < contents.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(i * self.mainScrollView.width, 0, self.mainScrollView.width, self.mainScrollView.height))];
        lab.numberOfLines = 0;
        lab.text = contents[i];
        [lab configWithTextColor:RGBA(255, 255, 255, 0.6) font:[UIFont systemFontOfSize:13.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        [self.mainScrollView addSubview:lab];
    }
}

-(IBAction)unwindSegue:(UIStoryboardSegue *)sender{
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.page.currentPage = scrollView.contentOffset.x / scrollView.width;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
