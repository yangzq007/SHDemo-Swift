//
//  SHRespondsToSelectorViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/9/10.
//  Copyright © 2019 yzq. All rights reserved.
//

import UIKit

class SHRespondsToSelectorViewController: SHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strOriginal = "swift";
        
        //不响应
        let selector1 = NSSelectorFromString("double1WithStr:")
        if self.responds(to: selector1) {
            let temp:String? = self.perform(selector1, with: strOriginal)?.takeUnretainedValue() as? String;
            print("1:\(temp ?? "")");
        }
        
        //响应
        let selector2 = NSSelectorFromString("double2WithStr:");
        if self.responds(to: selector2) {
            let temp:String? = self.perform(selector2, with: strOriginal)?.takeUnretainedValue() as? String;
            print("2:\(temp ?? "")")
        }
        
        let strFunc = NSStringFromSelector(#selector(jonin(str1:str2:)));
        print("funcName:\(strFunc)");
        
    }
    
    func double1(str:String) -> String {
        return str + str;
    }
    
    @objc func double2(str:String) -> String {
        return str + str;
    }
    
    @objc func jonin(str1:String, str2:String) -> String {
        return str1 + str2;
    }
}
