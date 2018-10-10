//
//  TeamProgressPageVC.swift
//  SteppedProgresssBar
//
//  Created by AFFIXUS IMAC1 on 4/24/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar


class TeamProgressPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        let page1: FirstViewController! = (storyboard?.instantiateViewController(withIdentifier: "first"))! as! FirstViewController
        let page2: SecondViewController! = (storyboard?.instantiateViewController(withIdentifier: "second"))! as! SecondViewController
        let page3: ThirdViewController! = (storyboard?.instantiateViewController(withIdentifier: "third"))! as! ThirdViewController
        
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
 
        
        let currentIndex = pages.index(of: viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
     
        
        let currentIndex = pages.index(of: viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
}
