//
//  SHConstViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/11/28.
//  Copyright © 2019 yzq. All rights reserved.
//

import UIKit

class SHConstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RGBCOLOR(r: 236, g: 115, b: 89);
        print("项目名称是：\(sh_des)");
        print("屏幕宽度为：\(sc_screenWidth)");
        print("屏幕高度为：\(sc_screenHeight)");
        if iOS7OrLater {
            print("系统版本大于等于iOS 7.0");
        }
    }

}
