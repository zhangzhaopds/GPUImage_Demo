//
//  ViewController.m
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "ViewController.h"

#import "PictureDisplayVC.h"
#import "VideoDisplayVC.h"
#import "StillImageDisplayVC.h"
#import "SourceViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *mDataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.mDataArray = @[@"GPUImagePicture",
                        @"GPUImageVideoCamera",
                        @"GPUImageStillCamera"];
    [self initView];
    
    
}

- (void)initView {
    
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.mTableView];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = self.mDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        SourceViewController *source = [[SourceViewController alloc] init];
        [self.navigationController pushViewController:source animated:YES];
    } else if (indexPath.row == 1) {
        VideoDisplayVC *video = [[VideoDisplayVC alloc] init];
        
        [self.navigationController pushViewController:video animated:YES];
    } else if (indexPath.row == 2) {
        StillImageDisplayVC *still = [[StillImageDisplayVC alloc] init];
        [self.navigationController pushViewController:still animated:YES];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
