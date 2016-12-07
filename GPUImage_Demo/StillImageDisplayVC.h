//
//  StillImageDisplayVC.h
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface StillImageDisplayVC : UIViewController
{
    GPUImageStillCamera *stillCamera;
    GPUImageOutput<GPUImageInput> *filter, *secondFilter, *terminalFilter;
    UISlider *filterSettingsSlider;
    UIButton *photoCaptureButton;
    
    GPUImagePicture *memoryPressurePicture1, *memoryPressurePicture2;
}

@property (nonatomic, copy) NSString *filterStr;

@end
