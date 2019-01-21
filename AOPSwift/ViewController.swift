//
//  ViewController.swift
//  Aop-swift
//
//  Created by 李永杰 on 2019/1/21.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button:UIButton = UIButton(type:(UIButton.ButtonType.custom))
        button.frame=CGRect(x:50,y:180,width:self.view.bounds.size.width - 100,height:50)
        button.setTitle("点击了", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(testAOP), for: .touchUpInside)
        self.view.addSubview(button);
        
        
        let button1:UIButton = UIButton(type:(UIButton.ButtonType.custom))
        button1.frame=CGRect(x:50,y:250,width:self.view.bounds.size.width - 100,height:50)
        button1.setTitle("带参数", for: .normal)
        button1.backgroundColor = .gray
        button1.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        self.view.addSubview(button1);
        
    }
    // objc 能被oc获取到
    @objc func testAOP() {
        print("swift666")
    }
    @objc func clickAction() {
        clickWithArgument("你说什么")
    }
    // dynamic 动态查找成员 ,这里能获取到函数的参数
    @objc dynamic func clickWithArgument(_ name: String) {
        print("\(name) + 嗯嗯")
    }
}

