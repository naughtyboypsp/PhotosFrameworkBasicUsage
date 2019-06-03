//
//  BaseViewController.m
//  PhotosFrameworkUsage
//
//  Created by 瓜豆2018 on 2019/5/31.
//  Copyright © 2019年 hongyegroup. All rights reserved.
//

#import "BaseViewController.h"
#import <MessageUI/MessageUI.h>

@interface BaseViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)hudWithTitle:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    hud.label.text = title;
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:1.2];
}

+ (void)alertWithTitle:(NSString *)title {
    [self alertWithTitle:title message:nil];
}

+ (void)alertWithMessage:(NSString *)message {
    [self alertWithTitle:@"notice" message:message];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    });
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error  {
    NSLog(@"%d - %@", result,error);
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
