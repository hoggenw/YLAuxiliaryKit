//
//  YLNavigationController.swift
//  YLTestCode
//
//  Created by 王留根 on 17/3/30.
//  Copyright © 2017年 ios-mac. All rights reserved.
//

import UIKit

public class YLNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    
    var notSwipeVCNames: [String] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        //手势操作冲突问题
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        if viewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_navbar_back"), style: .plain, target: self, action: #selector(back));
        }
    }
    
    func back()  {
        popViewController(animated: true)
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        var shouldBigen = true
        
        if (self.navigationController != nil) && self.navigationController?.viewControllers.count == 1 {
            return false
        }else if !shouldRightSwipeWithChildViewController(childVC: self.childViewControllers.last!) {
            shouldBigen = false
        }
        return shouldBigen
    }
    
    
    func shouldRightSwipeWithChildViewController(childVC: UIViewController) -> Bool{
        var needGesture = true
        for vcName in notSwipeVCNames {
            if childVC.isKind(of: NSClassFromString(vcName)!) {
                needGesture = false
                break
            }
        }
        return needGesture
        
    }
    

}
