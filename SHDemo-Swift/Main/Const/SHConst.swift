//
//  SHConst.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/11/28.
//  Copyright © 2019 yzq. All rights reserved.
//

import Foundation
import UIKit

//#define sh_des    @"SHDemo-Swift"
let sh_des = "SHDemo-Swift";

//#define sc_screenSize     [UIScreen mainScreen].bounds.size
//#define sc_screenWidth    [UIScreen mainScreen].bounds.size.width
//#define sc_screenHeight   [UIScreen mainScreen].bounds.size.height
let sc_screenSize = UIScreen.main.bounds.size;
let sc_screenWidth = UIScreen.main.bounds.size.width;
let sc_screenHeight = UIScreen.main.bounds.size.height;

//#define iOS7OrLater   (UIDevice.currentDevice.systemVersion.doubleValue >= 7.0)
let iOS7OrLater = (Double(UIDevice.current.systemVersion) ?? 0.0) >= 7.0;

//#define RGBCOLOR(r,g,b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
func RGBCOLOR(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r, green: g, blue: b, alpha: 1);
}

//？？？利用宏声明方法的怎么解决
