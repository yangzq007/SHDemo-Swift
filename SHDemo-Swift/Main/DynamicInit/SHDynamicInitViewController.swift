//
//  SHDynamicInitViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/7/2.
//  Copyright © 2019 yzq. All rights reserved.
//

import UIKit

class SHDynamicInitViewController: SHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initContent();
    }
    
    // MARK: - Action
    
    @objc func clickToTypeInit() -> Void {
//        let classStr:String = NSStringFromClass(type(of: self));
//        let cls = NSClassFromString(classStr) as! UIViewController.Type;
        
        let cls = type(of: self);
        
        let vc:UIViewController = cls.init();
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @objc func clickToGetClassInit() -> Void {
//        let classStr:String = NSStringFromClass(object_getClass(self)!);
//        let cls = NSClassFromString(classStr) as! UIViewController.Type;
        
        let cls = object_getClass(self) as! UIViewController.Type;
        
        let vc:UIViewController = cls.init();
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @objc func clickToStrInit() -> Void {
        let vcName:String = "SHDynamicInitViewController";
        let classStr:String = self.classString(className: vcName);
        let cls = NSClassFromString(classStr) as! UIViewController.Type;
        
        let vc:UIViewController = cls.init();
        self.navigationController?.pushViewController(vc, animated: true);
    }

    // MARK: - Init
    
    func initContent() -> Void {
        self.view.addSubview(self.btnType);
        self.view.addSubview(self.btnGetClass);
        self.view.addSubview(self.btnStr);
    }
    
    // MARK: - Lazy
    
    lazy var btnType: UIButton = {
        let btnType = UIButton.init(frame: CGRect(x: 15, y: 100, width: 200, height: 44));
        btnType.titleLabel?.font = UIFont.systemFont(ofSize: 15.0);
        btnType.setTitle("通过typeof初始化", for: UIControl.State.normal);
        btnType.setTitleColor(UIColor.orange, for: UIControl.State.normal);
        btnType.addTarget(self, action: #selector(clickToTypeInit), for: UIControl.Event.touchUpInside);
        return btnType;
    }()
    
    lazy var btnGetClass: UIButton = {
        let btnGetClass = UIButton.init(frame: CGRect(x: 15, y: 200, width: 200, height: 44));
        btnGetClass.titleLabel?.font = UIFont.systemFont(ofSize: 15.0);
        btnGetClass.setTitle("通过getclass初始化", for: UIControl.State.normal);
        btnGetClass.setTitleColor(UIColor.orange, for: UIControl.State.normal);
        btnGetClass.addTarget(self, action: #selector(clickToGetClassInit), for: UIControl.Event.touchUpInside);
        return btnGetClass
    }()
    
    lazy var btnStr: UIButton = {
        let btnStr = UIButton.init(frame: CGRect(x: 15, y: 300, width: 200, height: 44));
        btnStr.titleLabel?.font = UIFont.systemFont(ofSize: 15.0);
        btnStr.setTitle("通过字符串初始化", for: UIControl.State.normal);
        btnStr.setTitleColor(UIColor.orange, for: UIControl.State.normal);
        btnStr.addTarget(self, action: #selector(clickToGetClassInit), for: UIControl.Event.touchUpInside);
        return btnStr
    }()
    
    // MARK: - Util
    
    func classString(className:String) -> String {
        var nameSpace:String = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        nameSpace = nameSpace.replacingOccurrences(of: "-", with: "_");
        return nameSpace + "." + className;
    }
}
