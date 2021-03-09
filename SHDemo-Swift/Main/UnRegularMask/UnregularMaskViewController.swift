//
//  UnregularMaskViewController.swift
//  SHDemo-Swift
//
//  Created by yzq on 2021/3/1.
//  Copyright © 2021 yzq. All rights reserved.
//

import UIKit

class UnregularMaskViewController: SHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = UIView(frame: CGRect(x: 0, y: 200, width: sc_screenWidth, height: 300));
        contentView.backgroundColor = UIColor.orange;
        contentView.layer.cornerRadius = 6.0;
        contentView.layer.masksToBounds = true;
        self.view.addSubview(contentView);
        
        let path1 = UIBezierPath(rect: contentView.bounds);
        let path2 = UIBezierPath(roundedRect: CGRect(x: 30, y: 94, width: contentView.frame.size.width-30*2, height: contentView.frame.size.height-94), byRoundingCorners: UIRectCorner.topLeft.union(UIRectCorner.topRight), cornerRadii: CGSize(width: 6, height: 6));
        path1.append(path2);
        
        let maskLayer = CAShapeLayer();
        maskLayer.frame = contentView.bounds;
        maskLayer.path = path1.cgPath;
        maskLayer.fillRule = .evenOdd;
        contentView.layer.mask = maskLayer;
    }
    
    // MARK: - Init
    
    private func initContent() {
    }
    
    // MARK: - Lazy

}
