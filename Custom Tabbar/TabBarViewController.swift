//
//  TabBarViewController.swift
//  Custom Tabbar
//
//  Created by Steve JobsOne on 5/17/17.
//  Copyright © 2017 Steve JobsOne. All rights reserved.
//

import UIKit
let   CustomtabBarHeight:CGFloat = 65;


class TabBarViewController: UITabBarController,UITabBarControllerDelegate  {
    
    let customTabbarView = CustomTabbarView()
    var CurrentSelectedIndex:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.itemPositioning = UITabBarItemPositioning.fill
        
        customTabbarView.unselectedimageArray = ["explore-tab-focus", "assistance-tab-focus", "settings-tab-focus"]
        customTabbarView.selectedImageArray = ["explore-tab-blur", "assistance-tab-blur", "settings-tab-blur"]
        customTabbarView.tabbarTitleArray =  ["Explore","Assistance","Settings"]
        
        customTabbarView.tabbarHeight = CustomtabBarHeight
        customTabbarView.tabbarUperLineHeight = 3.0
        customTabbarView.topSpaceButtonImageView = 15.0
        customTabbarView.titleSpaceFromButonImage = 12.0
        
        customTabbarView.tabbarFontName = "Helvetica Neue"
        customTabbarView.tabbarFrontSize = 13.0
        
        customTabbarView.selectedTabbarUperLineColor = UIColor.init(colorLiteralRed: 199.0/255.0, green: 20.0/255.0, blue: 69.0/255.0, alpha: 1.0)
        customTabbarView.selectedTabbarViewColor = UIColor.init(colorLiteralRed: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        customTabbarView.backGroundViewColor = UIColor.init(colorLiteralRed: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        customTabbarView.unSelectedTabbarUperLineColor = UIColor.init(colorLiteralRed: 204.0/255.0, green: 237.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        customTabbarView.seletedTabbarTitleColor =  UIColor.init(colorLiteralRed: 199.0/255.0, green: 20.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        customTabbarView.unSeletedTabbarTitleColor = UIColor.init(colorLiteralRed: 94.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0)
        
        customTabbarView.customTabbar(withTabbar: self.tabBar)
        
    }
    
    //tabbarcontroller delegate.....
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        CurrentSelectedIndex = tabBarController.selectedIndex;
        customTabbarView.setRightIndexPositionSeletedView(index: tabBarController.selectedIndex)
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let tabViewControllers = tabBarController.viewControllers
        
        let fromIndex = tabViewControllers?.index(of: tabBarController.selectedViewController!)
        
        let toIndex = tabViewControllers?.index(of: viewController)
        
        let fromView:UIView = (tabBarController.selectedViewController?.view)!
        
        let toView:UIView = viewController.view
        
        if fromView == toView {
            
            return false
        }
        
        if fromIndex! > toIndex! {
            
            let viewSize:CGRect = fromView.frame
            
            fromView.superview?.addSubview(toView)
            toView.frame = CGRect(x: -self.view.bounds.size.width, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
            
            UIView.animate(withDuration: 0.3, delay: 0.0 , animations: {
                
                fromView.frame = CGRect(x:self.view.bounds.size.width, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
                toView.frame = CGRect(x:0, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
                
            }, completion: { _ in
                
                self.tabBarController?.selectedIndex = 0
            })
            
        } else {
            
            let viewSize:CGRect = fromView.frame
            
            fromView.superview?.addSubview(toView)
            toView.frame = CGRect(x: self.view.bounds.size.width, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
            
            UIView.animate(withDuration: 0.3, delay: 0.0 , animations: {
                fromView.frame = CGRect(x:-self.view.bounds.size.width, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
                toView.frame = CGRect(x:0, y: viewSize.origin.y, width: toView.bounds.size.width, height: viewSize.size.height)
            }, completion: { _ in
                
                self.tabBarController?.selectedIndex = 0
            })
        }
        
        return true
    }
    
    
    
    override func viewWillLayoutSubviews() {
        
        var tabFrame:CGRect = self.tabBar.frame
        tabFrame.size.height = CustomtabBarHeight
        tabFrame.origin.y = self.view.frame.size.height - CustomtabBarHeight
        self.tabBar.frame = tabFrame;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
