//
//  IntenalTools.h
//  APPIntenal
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 teacher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntenalTools : NSObject

//初始化语言
+(void)initUserLanguage;

//当前语言
+(NSString *)currentLanguage;

//设置语言
+(void)setUserlanguage:(NSString *)language;

//根据设置的key读取响应的内容
+ (NSString *)costomLanguageWithKey:(NSString *)key;
@end
