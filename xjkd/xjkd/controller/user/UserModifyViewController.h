//
//  UserModifyViewController.h
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "BaseViewController.h"

@interface UserModifyViewController : BaseViewController<HttpCallBackDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) IBOutlet UIButton* btnLogo;
@property (nonatomic, strong) IBOutlet UIButton* btnModify;
@property (nonatomic, strong) IBOutlet UITextField* tfName;
@property (nonatomic, strong) IBOutlet UITextField* tfMail;
@property (nonatomic, strong) IBOutlet UIImageView* ivLogo;

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *imagePicture;

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
