//
//  MDAOPManager.m
//  AOP_Demo
//
//  Created by 李永杰 on 2018/6/6.
//  Copyright © 2018年 muheda. All rights reserved.
//

#import "MDAOPManager.h"
#import "MDAOPManager+ViewController.h"

typedef void (^AspectEventBlock)(id<AspectInfo> aspectInfo);

@implementation MDAOPManager

+(void)load{
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    [mutableDic addEntriesFromDictionary:[MDAOPManager AOP_ViewControllerConfigDic]];
    [self configAOPWithDic:mutableDic];
    
}
+(void)configAOPWithDic:(NSDictionary *)configDic{
    for (NSString *className in configDic) {
        /*
         swift使用NSClassFromString，需要项目名+.+className才能获取到Class
         */
        Class clazz = NSClassFromString([NSString stringWithFormat:@"%@%@",@"AOPSwift.",className]);
        NSDictionary *config = configDic[className];
        NSArray *trackArr = config[@"TrackEvents"];
        if (trackArr) {
            for (NSDictionary *event in trackArr) {
                
                AspectEventBlock buttonBlock = event[@"block"];
                NSString *method = event[@"EventSelectorName"];
                NSString *moment = event[@"moment"];
                
                AspectOptions option = AspectPositionAfter;
                if ([moment isEqualToString:@"before"]) {
                    option = AspectPositionBefore;
                }else if ([moment isEqualToString:@"instead"]){
                    option = AspectPositionInstead;
                }
                
                SEL selector = NSSelectorFromString(method);
 
                [clazz aspect_hookSelector:selector withOptions:option usingBlock:^(id<AspectInfo> aspectInfo) {
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                            buttonBlock(aspectInfo);
                        });
                } error:NULL];
            }
        }
    }
}
@end
