//
//  PictureDisplayVC.m
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import "PictureDisplayVC.h"
#import "GPUImage.h"


@interface PictureDisplayVC ()

@property (nonatomic, strong) GPUImagePicture *sourcePicture;
@property (nonatomic, strong) GPUImageOutput<GPUImageInput> *sepiaFilter;
@property (nonatomic, strong) GPUImageView *outImageView;

@end

@implementation PictureDisplayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
    
    
    if (!NSClassFromString(self.filterStr)) {
        NSLog(@"滤镜不存在");
        return;
    } else {
        
        if ([self.filterStr containsString:@"BlendFilter"]) {
            [self setupBlendFiltering];
        } else {
            [self setupImageFiltering];
        }
    }

}

- (void)initView {
    
    self.outImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:self.outImageView];
    
}

- (void)setupBlendFiltering {
    UIImage *inputImage = [UIImage imageNamed:@"6666.JPG"];
    
    self.sourcePicture = [[GPUImagePicture alloc] initWithImage:inputImage smoothlyScaleOutput:YES];
    
    
    
    
    self.sepiaFilter = [[NSClassFromString(self.filterStr) alloc] init];
    
    // 针对color类型的滤镜，需要设置相应的颜色值，才可看到效果
    if ([self.filterStr isEqualToString:@"GPUImageSaturationFilter"]) {
        // Saturation: 0 -- 2, 默认 1
        [(GPUImageSaturationFilter *)self.sepiaFilter setSaturation:(2.0)];
    }
    
    
    [self.sepiaFilter forceProcessingAtSize:self.outImageView.sizeInPixels];
    
    [self.sourcePicture addTarget:self.sepiaFilter];
    [self.sepiaFilter addTarget:self.outImageView];
    
    [self.sourcePicture processImage];

}


- (void)setupImageFiltering {
    UIImage *inputImage = [UIImage imageNamed:@"6666.JPG"];
    
    self.sourcePicture = [[GPUImagePicture alloc] initWithImage:inputImage smoothlyScaleOutput:YES];
    
    
    self.sepiaFilter = [[NSClassFromString(self.filterStr) alloc] init];
    
    // 针对color类型的滤镜，需要设置相应的颜色值，才可看到效果
    if ([self.filterStr isEqualToString:@"GPUImageSaturationFilter"]) {
        // Saturation: 0 -- 2, 默认 1
        [(GPUImageSaturationFilter *)self.sepiaFilter setSaturation:(2.0)];
    }
    
    
    [self.sepiaFilter forceProcessingAtSize:self.outImageView.sizeInPixels];
    
    [self.sourcePicture addTarget:self.sepiaFilter];
    [self.sepiaFilter addTarget:self.outImageView];
    
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
