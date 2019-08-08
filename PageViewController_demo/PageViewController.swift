//
//  PageViewController.swift
//  PageViewController_demo
//
//  Created by JIJO G OOMMEN on 08/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    
    // vc_1 = variable for UIViewController
    //pvc  = variable for PageviewController
    
    // v1 = variable for the ViewController
    // v2 = variable for the SecondViewController
    
    
    var vc_1 : [UIViewController] = {
        let pvc = UIStoryboard(name: "Main", bundle: nil)
        
    let v1 = pvc.instantiateViewController(withIdentifier: "ViewControllerid")as! ViewController
        
    let v2 = pvc.instantiateViewController(withIdentifier: "SecondViewControllerid")as! SecondViewController
        
    let v3 = pvc.instantiateViewController(withIdentifier: "ThirdViewControllerid")as! ThirdViewController
        
    let v4 = pvc.instantiateViewController(withIdentifier: "FourthViewControllerid")as! FourthViewController
        
        return[v1,v2,v3,v4]
    }()
    
    
    
    
    var pageControl = UIPageControl()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
       
        // setting the first view
        
        if let firstview = vc_1.first{
            self.setViewControllers([firstview], direction: .forward, animated: true, completion: nil)
            
           
         self.configurePageControl()
           
            
        }
    }
   
    
   // page view controller datasource funcions

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        // for enabling reverse movement of page
        
        guard let vcindex = vc_1.firstIndex(of: viewController)
            else {
                return nil
        }
        
        let previous = vcindex - 1
        print("Reverse Scrolling count ::\(previous)")
        guard previous >= 0
            else {
                return nil
        }
        
        guard vc_1.count > previous
            
            else {
                return nil
        }
        
        return vc_1[previous]
       
        
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        // for enabling forward movement of page
        
        guard let vcindex = vc_1.firstIndex(of: viewController)
            
        
            else {
                return nil
                
        }
        
        let next = vcindex + 1
       
        guard next >= 0
            else {
            return nil
        }
        
        guard vc_1.count > next
            else {
                return nil
        }
        
        return vc_1[next]
        
        
        
    }
    
// End of pageviewController datasource fuctions

 
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = vc_1.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = vc_1.index(of: pageContentViewController)!
        
    }
    
}
