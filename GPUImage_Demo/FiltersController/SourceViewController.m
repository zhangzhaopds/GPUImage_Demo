//
//  SourceViewController.m
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "SourceViewController.h"
#import "PictureDisplayVC.h"
#import "StillImageDisplayVC.h"
#import "VideoDisplayVC.h"

@interface SourceViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *mDataArray;

@end

@implementation SourceViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    // Do any additional setup after loading the view.
//    
//    self.mSoureArr = @[@"GPUImagePicture",
//                       @"GPUImageVideoCamera",
//                       @"GPUImageStillCamera"];
//    [self initView];
//    
//    NSLog(@"%@", self.filterString);
//}
//
//- (void)initView {
//    
//    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
//    [self.view addSubview:self.mTableView];
//    self.mTableView.delegate = self;
//    self.mTableView.dataSource = self;
//    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.mSoureArr.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] init];
//    }
//    cell.textLabel.text = self.mSoureArr[indexPath.row];
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (indexPath.row == 0) {
//        PictureDisplayVC *pic = [[PictureDisplayVC alloc] init];
//        pic.filterStr = self.filterString;
//        [self.navigationController pushViewController:pic animated:YES];
//    } else if (indexPath.row == 1) {
//        VideoDisplayVC *video = [[VideoDisplayVC alloc] init];
//        video.filterStr = self.filterString;
//        [self.navigationController pushViewController:video animated:YES];
//    } else if (indexPath.row == 2) {
//        StillImageDisplayVC *still = [[StillImageDisplayVC alloc] init];
//        still.filterStr = self.filterString;
//        [self.navigationController pushViewController:still animated:YES];
//    }
//        
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"滤镜(部分)";
    
    // color  image  blends  effects
    _mDataArray = @[@[@"GPUImageSaturationFilter"
                      ],
                    @[@"GPUImageTiltShiftFilter",
                      @"GPUImageSobelEdgeDetectionFilter",
                      @"GPUImageSharpenFilter",
                      @"GPUImageUnsharpMaskFilter",
                      @"GPUImageBoxBlurFilter",
                      @"GPUImageGaussianSelectiveBlurFilter",
                      @"GPUImageGaussianBlurPositionFilter",
                      @"GPUImageSingleComponentGaussianBlurFilter",
                      @"GPUImageMedianFilter",
                      @"GPUImageBilateralFilter",
                      @"GPUImage3x3ConvolutionFilter",
                      @"GPUImageLaplacianFilter",
                      @"GPUImageSobelEdgeDetectionFilter",
                      @"GPUImageThresholdEdgeDetectionFilter",
                      @"GPUImageWeakPixelInclusionFilter",
                      @"GPUImageCannyEdgeDetectionFilter",
                      @"GPUImagePrewittEdgeDetectionFilter",
                      @"GPUImageXYDerivativeFilter",
                      @"GPUImageNonMaximumSuppressionFilter",
                      @"GPUImageColorPackingFilter",
                      @"GPUImageColorLocalBinaryPatternFilter",
                      @"GPUImageLanczosResamplingFilter",
                      @"GPUImageLowPassFilter",
                      @"GPUImageHighPassFilter",
                      @"GPUImageHoughTransformLineDetector",
                      @"GPUImageMotionBlurFilter",
                      @"GPUImageZoomBlurFilter",
                      @"GPUImageiOSBlurFilter",
                      @"GPUImageColourFASTFeatureDetector",
                      @"GPUImageColourFASTSamplingOperation"
                      ],
                    @[
                      ],
                    @[
                      ]];
    
    [self initView];
}

- (void)initView {
    _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_mTableView];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
    [_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mDataArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _mDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = _mDataArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PictureDisplayVC *pic = [[PictureDisplayVC alloc] init];
    pic.filterStr = self.mDataArray[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:pic animated:YES];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Colors-需要针对不同滤镜，设置色度值，默认不对图片处理";
    } else if (section == 1) {
        return @"Image";
    } else if (section == 2) {
        return @"Blends";
    } else {
        return @"Effects";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
