//
//  ViewController.m
//  APPIntenal
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 teacher. All rights reserved.
//

#import "ViewController.h"
#import "IntenalTools.h"

@interface ViewController()

@end

@implementation ViewController {
    
    UILabel *_lbl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
    

   
    _lbl.text = [IntenalTools costomLanguageWithKey:@"click"];
    
}

- (void)setupUI {
    _lbl = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 100)/2, 200, 100, 40)];
    [self.view addSubview:_lbl];
    _lbl.backgroundColor = [UIColor magentaColor];
    _lbl.textColor = [UIColor blackColor];
    _lbl.textAlignment = NSTextAlignmentCenter;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn];
    btn.center  = self.view.center;
    [btn addTarget:self action:@selector(clickBtnChangeText) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickBtnChangeText {
    NSString *lan = [IntenalTools currentLanguage];
    if([lan hasPrefix:@"zh-Hans"]){//判断当前的语言，进行改变
        [IntenalTools setUserlanguage:@"en"];
        
    }else{
        
        [IntenalTools setUserlanguage:@"zh-Hans"];
    }
    //改变完成之后发送通知，告诉其他页面修改完成，提示刷新界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

@end
