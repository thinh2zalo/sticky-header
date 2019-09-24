//
//  RootViewController.m
//  strickLyHeader
//
//  Created by Steve on 9/23/19.
//  Copyright © 2019 Steve. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()  < UITableViewDataSource , UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) HeaderView * headerView;
@end
@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, HEADER_HEIGHT);

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float scrollDiff = scrollView.contentOffset.y  +  HEADER_HEIGHT;
    [self.headerView setHeightForBotHeader:scrollDiff];
    [self.headerView setHeightForTopHeader:scrollDiff];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = UITableViewCell.new;
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %tu", indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(HEADER_HEIGHT, 0, 0, 0);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = HeaderView.new;
        _headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

@end
