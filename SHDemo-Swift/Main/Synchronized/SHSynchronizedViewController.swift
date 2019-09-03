//
//  SHSynchronizedViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/9/3.
//  Copyright © 2019 yzq. All rights reserved.
//

import UIKit

class SHSynchronizedViewController: SHBaseViewController {
    
    var letters:[String] = [String]();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //调用的时候可以采用尾随闭包方式的写法，这样就和OC很类似了
        synchronized(self.letters) {
            self.letters.append("swift");
        }
    }
    
    /// 自定义实现oc的@synchronized()方法
    func synchronized(_ lock:Any, closure:()->Void) -> Void {
        objc_sync_enter(lock);
        closure();
        objc_sync_exit(lock);
    }
}
