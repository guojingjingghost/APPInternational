//
//  IntenalTools.m
//  APPIntenal
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 teacher. All rights reserved.
//

#import "IntenalTools.h"

static NSBundle *bundle = nil;
@implementation IntenalTools

+(void)initUserLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [def valueForKey:@"userLanguage"];
    
    if(string.length == 0){
        
        //获取系统当前语言版本(中文zh-Hans,英文en)
        
        NSArray* languages = [def objectForKey:@"AppleLanguages"];
        
        NSString *current = [languages objectAtIndex:0];
        if ([current hasPrefix:@"en"]) {
            [def setValue:@"en" forKey:@"userLanguage"];
            string = @"en";
            
        } else if([current hasPrefix:@"zh-Hans"]) {
            [def setValue:@"zh-Hans" forKey:@"userLanguage"];
            string = @"zh-Hans";
        } else {
            [def setValue:@"en" forKey:@"userLanguage"];
            string = @"en";
        }
        
        [def synchronize];//持久化，不加的话不会保存
    }
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}
+(NSString *)currentLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *language = [def valueForKey:@"userLanguage"];
    
    return language;
}
+(void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    
    bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:@"userLanguage"];
    
    [def synchronize];
}  
+ (NSString *)costomLanguageWithKey:(NSString *)key {
    NSString *content = [bundle localizedStringForKey:key value:nil table:@"Localizable"];
    return content;
}
@end
