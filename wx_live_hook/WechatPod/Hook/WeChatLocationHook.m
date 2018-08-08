//
//  WeChatLocationHook.m
//  WechatPod
//
//  Created by monkey on 2017/8/2.
//  Copyright © 2017年 Coder. All rights reserved.
//

/**
 1. 修改定位
 */

#import <CaptainHook/CaptainHook.h>
#import "WechatPodForm.h"
#import <UIKit/UIKit.h>

CHDeclareClass(CLLocation);

CHOptimizedMethod0(self, CLLocationCoordinate2D, CLLocation, coordinate){
    CLLocationCoordinate2D coordinate = CHSuper(0, CLLocation, coordinate);
    WechatPodForm *config = [WechatPodForm sharedInstance];
    if(config.location.longitude || config.location.latitude ){
        coordinate = config.location;
    } else if (!config.location.longitude || !config.location.latitude ){
        config.location = coordinate;
    }
    
    return coordinate;
}

CHConstructor{
    CHLoadLateClass(CLLocation);
    CHClassHook(0, CLLocation, coordinate);
}
