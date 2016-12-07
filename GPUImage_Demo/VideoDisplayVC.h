//
//  VideoDisplayVC.h
//  GPUImage_Demo
//
//  Created by 张昭 on 07/12/2016.
//  Copyright © 2016 张昭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
@interface VideoDisplayVC : UIViewController

{
    GPUImageView *view1, *view2, *view3, *view4;
    GPUImageVideoCamera *videoCamera;
}


@property (nonatomic, copy) NSString *filterStr;

@end
