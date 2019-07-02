//
//  SHMainViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2019/7/2.
//  Copyright © 2019 yzq. All rights reserved.
//

import UIKit

class SHMainViewController: SHBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView:UITableView?;
    var arrContent:[[String:String]] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNav();
        
        self.initData();
        
        self.initContent();
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrContent.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "cellIdentifier";
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier);
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier);
        }
        
        cell?.textLabel?.text = self.arrContent[indexPath.row]["title"];
        
        return cell!;
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName:String = self.arrContent[indexPath.row]["vc"]!;
        let classStr:String = self.classString(className: vcName);
        let cls = NSClassFromString(classStr) as! UIViewController.Type;
        
        let vc:UIViewController = cls.init();
        vc.navigationItem.title = self.arrContent[indexPath.row]["title"];
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Init
    
    func initNav() -> Void {
        self.navigationItem.title = "SHDemo-Swift";
    }
    
    func initData() -> Void {
        self.arrContent = [
            ["title":"测试视图","vc":"SHTestViewController"],
            ["title":"动态初始化","vc":"SHDynamicInitViewController"]
        ];
    }
    
    func initContent() -> Void {
        self.tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableView.Style.plain);
        self.tableView?.dataSource = self;
        self.tableView?.delegate = self;
        self.view.addSubview(self.tableView!);
    }
    
    // MARK: - Util
    
    func classString(className:String) -> String {
        var nameSpace:String = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        nameSpace = nameSpace.replacingOccurrences(of: "-", with: "_");
        return nameSpace + "." + className;
    }
}
