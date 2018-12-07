//
//  BWCodeScanViewController.m
//  BitouqWallet
//
//  Created by 赵一欢 on 2018/12/7.
//  Copyright © 2018 Joker. All rights reserved.
//

#import "BWCodeScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "YHMaskView.h"
float const SCAN_HEIGHT = 300.0f;
@interface BWCodeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong)YHMaskView * maskView;
@end

@implementation BWCodeScanViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.session) {
        [self.session startRunning];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}
- (void)initSubViews
{
    _maskView = [[YHMaskView alloc] initWithFrame:(CGRectMake(0, 0, self.view.width, self.view.height))];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0.6;
    [_maskView showRectPathWithFrame:(CGRectMake((self.view.width - (SCAN_HEIGHT - 2)) / 2, (self.view.height - (SCAN_HEIGHT - 2)) / 2 - 64, (SCAN_HEIGHT - 2), (SCAN_HEIGHT - 2))) andRadius:0];
    [self.view addSubview:_maskView];
    
    UIView * topLine = [[UIView alloc] initWithFrame:(CGRectMake((self.view.width - (SCAN_HEIGHT - 2)) / 2, (self.view.height - (SCAN_HEIGHT - 2)) / 2 - 64, SCAN_HEIGHT - 2, 1))];
    topLine.backgroundColor = [UIColor colorWithHexString:COLOR_MAIN];
    [self.view addSubview:topLine];
    
    UIView * bottomLine = [[UIView alloc] initWithFrame:(CGRectMake((self.view.width - (SCAN_HEIGHT - 2)) / 2, (self.view.height - (SCAN_HEIGHT - 2)) / 2 + (SCAN_HEIGHT - 2) - 1 - 64, SCAN_HEIGHT - 2, 1))];
    bottomLine.backgroundColor = [UIColor colorWithHexString:COLOR_MAIN];
    [self.view addSubview:bottomLine];
    
    UIView * leftLine = [[UIView alloc] initWithFrame:(CGRectMake((self.view.width - (SCAN_HEIGHT - 2)) / 2, (self.view.height - (SCAN_HEIGHT - 2)) / 2 - 64, 1, SCAN_HEIGHT - 2))];
    leftLine.backgroundColor = [UIColor colorWithHexString:COLOR_MAIN];
    [self.view addSubview:leftLine];
    
    UIView * rightLine = [[UIView alloc] initWithFrame:(CGRectMake((self.view.width - (SCAN_HEIGHT - 2)) / 2 + SCAN_HEIGHT - 3, (self.view.height - (SCAN_HEIGHT - 2)) / 2 - 64, 1, SCAN_HEIGHT - 2))];
    rightLine.backgroundColor = [UIColor colorWithHexString:COLOR_MAIN];
    [self.view addSubview:rightLine];
    
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    
    //设置识别区域
    float scanY = (self.view.height - SCAN_HEIGHT) / 2 - 32;
    //深坑，这个值是按比例0~1设置，而且X、Y要调换位置，width、height调换位置
    output.rectOfInterest = CGRectMake(scanY / SCREEN_HEIGHT , 15/SCREEN_WIDTH, SCAN_HEIGHT/SCREEN_HEIGHT, (self.view.width - 30)/SCREEN_WIDTH);
    
    
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    self.session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [self.session addInput:input];
    [self.session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * cameraLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    cameraLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    cameraLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view.layer insertSublayer:cameraLayer atIndex:0];
    //开始捕获
    [self.session startRunning];
}
#pragma mark - 扫描成功
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [_session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex :0];
        if ([self.delegate respondsToSelector:@selector(scanCodeResString:)]) {
            [self.delegate scanCodeResString:metadataObject.stringValue];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
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
