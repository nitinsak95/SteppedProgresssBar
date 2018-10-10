//
//  ViewController.swift
//  SteppedProgresssBar
//
//  Created by AFFIXUS IMAC1 on 4/24/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar



class ViewController: UIViewController, FlexibleSteppedProgressBarDelegate  {

    var progressBar: FlexibleSteppedProgressBar!
    var customPkgPageCotroller = TeamProgressPageVC()
    
    var backgroundColor = UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    var progressColor = UIColor(red: 53.0 / 255.0, green: 226.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
     var maxIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupProgressBar()

    }
    
    
        func setupProgressBar() {
            progressBar = FlexibleSteppedProgressBar()
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(progressBar)
            
            // iOS9+ auto layout code
            let horizontalConstraint = progressBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            let verticalConstraint = progressBar.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 20
            )
//            let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: CGFloat(450))
//            let heightConstraint = progressBar.heightAnchor.constraint(equalToConstant: CGFloat(150))
            let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: CGFloat(400))
            let heightConstraint = progressBar.heightAnchor.constraint(equalToConstant: CGFloat(100))
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
            
            // Customise the progress bar here
//            progressBar.numberOfPoints = 5
//            progressBar.lineHeight = 9
//            progressBar.radius = 15
//            progressBar.progressRadius = 25
//            progressBar.progressLineHeight = 3
//            progressBar.delegate = self
//            progressBar.completedTillIndex = 2
//            progressBar.useLastState = true
            
            progressBar.numberOfPoints = 3
            progressBar.lineHeight = 5
            progressBar.radius = 10
            progressBar.progressRadius = 15
            progressBar.progressLineHeight = 1
            progressBar.delegate = self
            progressBar.completedTillIndex = 1
            progressBar.useLastState = true
            
            
            progressBar.lastStateCenterColor = progressColor
            progressBar.selectedBackgoundColor = progressColor
            progressBar.selectedOuterCircleStrokeColor = backgroundColor
            progressBar.lastStateOuterCircleStrokeColor = backgroundColor
            progressBar.currentSelectedCenterColor = progressColor
            progressBar.currentSelectedTextColor = progressColor
            
            
            progressBar.currentIndex = 0
        }
        
        func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                         didSelectItemAtIndex index: Int) {
            progressBar.currentIndex = index
            if index > maxIndex {
                maxIndex = index
                progressBar.completedTillIndex = maxIndex
            }
        }
        
        func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                         canSelectItemAtIndex index: Int) -> Bool {
            return true
}
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        
        if position == FlexibleSteppedProgressBarTextLocation.top {
            switch index {
                
            case 0: return "First"
            case 1: return "Second"
            case 2: return "Third"
            default: return "Date"
                
            }
        } else if position == FlexibleSteppedProgressBarTextLocation.center {
            switch index {
                
            case 0: return "1"
            case 1: return "2"
            case 2: return "3"
          
            default: return "0"
                
            }
        }
        return ""
    }
    

}
