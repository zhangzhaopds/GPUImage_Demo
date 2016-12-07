//
//  SepiaFilterViewController.m
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "SepiaFilterViewController.h"
#import "GPUImage.h"

@interface SepiaFilterViewController ()

@property (nonatomic, strong) GPUImagePicture *sourcePicture;
@property (nonatomic, strong) GPUImageOutput<GPUImageInput> *sepiaFilter;
@property (nonatomic, strong) GPUImageView *outImageView;

@property (nonatomic, strong) UISlider *imageSlider;

@end

@implementation SepiaFilterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
    [self setupDisplayFiltering];
}

- (void)initView {
    // 输出视图
    self.outImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:self.outImageView];
    
    //
//    self.imageSlider = [UISlider alloc] initWithFrame:<#(CGRect)#>
}


- (void)setupDisplayFiltering {
    UIImage *inputImage = [UIImage imageNamed:@"6666.JPG"]; // The WID.jpg example is greater than 2048 pixels tall, so it fails on older devices
    
    self.sourcePicture = [[GPUImagePicture alloc] initWithImage:inputImage smoothlyScaleOutput:YES];
//    self.sepiaFilter = [[GPUImageTiltShiftFilter alloc] init];
    
    // 边缘轮廓滤镜
    self.sepiaFilter = [[GPUImageSobelEdgeDetectionFilter alloc] init];
    
//    self.sepiaFilter = [[GPUImageMedianFilter alloc] init];
    
    
    [self.sepiaFilter forceProcessingAtSize:self.outImageView.sizeInPixels]; // This is now needed to make the filter run at the smaller output size
    
    [self.sourcePicture addTarget:self.sepiaFilter];
    [self.sepiaFilter addTarget:self.outImageView];
//    [(GPUImageSobelEdgeDetectionFilter *)self.sepiaFilter setTexelHeight:(1.0 / 500.0)];
    [self.sourcePicture processImage];

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
