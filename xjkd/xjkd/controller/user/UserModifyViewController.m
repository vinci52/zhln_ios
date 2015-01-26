//
//  UserModifyViewController.m
//  xjkd
//
//  Created by 聂宗波 on 15-1-11.
//  Copyright (c) 2015年 聂宗波. All rights reserved.
//

#import "UserModifyViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface UserModifyViewController ()

@end

@implementation UserModifyViewController{
    UserInfoModel *user;
    HttpApi* api;
    Boolean isAvailable;
    Boolean isCamera;
}
@synthesize btnLogo;
@synthesize btnModify;
@synthesize tfName;
@synthesize tfMail;
@synthesize ivLogo;
@synthesize imagePicker;
@synthesize imagePicture;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"资料修改"];
    [self refreshUI];
    api = [HttpApi new];
    api.delegate = self;
    [self.btnModify addTarget:self action:@selector(doModifyUser) forControlEvents:UIControlEventTouchUpInside];
    [btnLogo addTarget:self action:@selector(doPhoto:) forControlEvents:UIControlEventTouchUpInside];
    self.imagePicker = [[UIImagePickerController alloc] init];

}

-(void)refreshUI{
    user = [[MyApp getInstance]getUserInfo];
    if(user){
        if(user.username){
            self.tfName.text = user.username;
        }
        
        if(user.email){
            self.tfMail.text = user.email;
        }
        
        [self.ivLogo sd_setImageWithURL:[NSURL URLWithString:user.photo] placeholderImage:[UIImage imageNamed:@"placeholder_c"]];
    }
}

-(void)doPhoto:(id)sender
{
    isCamera = false;
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        
        self.imagePicker.sourceType = sourceType;
        // 设置媒体类型为所有对照相机有效的类型
        self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        self.imagePicker.allowsEditing = NO;
        // 设置拍照控件对象的委托
        self.imagePicker.delegate = self;
        isAvailable = true;
        [self presentModalViewController:imagePicker animated:YES];
    }
    else{
        [self.view makeToast:@"无法访问相册"];
    }
}

-(void)doModifyUser{
    NSString* name = tfName.text;
    NSString* email = tfMail.text;
    if([CommonUtil stringIsNull:name]){
        [self.view makeToast:@"请输入昵称"];
        return;
    }
    if([CommonUtil stringIsNull:email]){
        [self.view makeToast:@"请输入邮箱"];
        return;
    }
    if(![CommonUtil isValidateEmail:email]){
        [self.view makeToast:@"邮箱地址格式不正确"];
        return;
    }
    [self showProccess];
    [api modifyinfo:name email:email];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    // 处理静态照片
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        if (editedImage) {
            imageToSave = editedImage;
        }
        else {
            imageToSave = originalImage;
        }
        
        // 将静态照片（原始的或者被编辑过的）保存到相册（Camera Roll）
        if(isCamera){
            UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        }
        
        // 根据图片控件的尺寸缩放照片（只是为了显示效果。实际传输时依然使用原始照片）
        UIImage* scaledImage = [self imageWithImage:imageToSave scaledToSize:self.ivLogo.bounds.size];
        self.ivLogo.image = scaledImage;
        // 缓存传输照片
        self.imagePicture = imageToSave;
        [self showProccess];
        [picker dismissModalViewControllerAnimated:YES];
        [self performSelector:@selector(doUploadPic) withObject:nil afterDelay:0.0f];
     }
    else{
        [picker dismissModalViewControllerAnimated:YES];
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark - Utilities
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(float)countCompress:(UIImage*)image{
    float max = 10000.0f;
    NSData *imageData = UIImageJPEGRepresentation(self.imagePicture, 1);
    NSLog(@"length before:%d,",imageData.length);
    if(imageData.length>max){
        float rate =max/imageData.length;
        NSLog(@"rate:%f,",rate);
        return rate;
    }
    return 1;
}

-(void)doUploadPic{
   
    
    NSString *filename = [NSString stringWithFormat:@"%@-%@.jpg",user.phone,[CommonUtil fmtNowDate:@"MMddHHmmss"]];
    NSData *imageData = UIImageJPEGRepresentation(self.imagePicture, [self countCompress:self.imagePicture]);
     NSLog(@"length after:%d,",imageData.length);
    [api uploadUserphoto:filename imageIS:imageData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)httpCallback:(RspResultModel*)rsp requestCode:(NSString*)code{
    DLog(@"callback");
    [self closeProccess];
    if([self isRspOk:rsp]){
        [self.view makeToast:@"修改成功"];
        if([@"modifyinfo" isEqualToString:code]){
            user.username = tfName.text;
            user.email = tfMail.text;
        }
        else{
            user.photo = rsp.photo;
        }
        [[MyApp getInstance] setUserInfo:user];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN"
                                                            object:nil];
        [self refreshUI];
        //[self backVC];
    }
    else{
        [self.view makeToast:rsp.retmsg];
    }
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
