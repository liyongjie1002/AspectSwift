//
//  MDAOPManager+ViewController.m
//  Aop-swift
//
//  Created by 李永杰 on 2019/1/21.
//  Copyright © 2019 Y了个J. All rights reserved.
//

#import "MDAOPManager+ViewController.h"

@implementation MDAOPManager (ViewController)
+(NSDictionary *)AOP_ViewControllerConfigDic{
    NSDictionary *configDic = @{
                                @"ViewController":@{
                                        @"TrackEvents":@[
                                                @{//实例方法
                                                    @"moment":@"before",
                                                    @"EventSelectorName":@"testAOP",
                                                    @"block":^(id<AspectInfo>aspectInfo){
                                                        // 获取方法的参数
                                                        NSLog(@"跳转");
                                                    },
                                                },
                                                @{//实例方法
                                                    @"moment":@"before",
                                                    @"EventSelectorName":@"clickWithArgument:",
                                                    @"block":^(id<AspectInfo>aspectInfo){
                                                        // 获取方法的参数
                                                        NSLog(@"%@",aspectInfo);
                                                    },
                                                },
                                            ]
                                        },
                                };
    return configDic;
}

@end
