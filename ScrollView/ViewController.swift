//
//  ViewController.swift
//  ScrollView
//
//  Created by Mohammad Otoofi on 06/08/2017.
//  Copyright © 2017 Mohammad Otoofi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!

    var myuiimages = [UIImageView]()
    var contentwidth: CGFloat = 0.0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeLeft))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)

        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        let scrollviewWidth = scrollView.frame.size.width
        var contentwidth: CGFloat = 0.0
        for x in 0...2
        {
            let imagee = UIImage(named: "icon\(x).png")
            let uiimageview = UIImageView(image: imagee)
            
            myuiimages.append(uiimageview)
            
            var newX: CGFloat = 0.0
            newX = scrollviewWidth / 2 + scrollviewWidth * CGFloat(x)
            contentwidth += newX
            
            
            scrollView.addSubview(uiimageview)
            uiimageview.frame = CGRect.init(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
            
        }
        
        scrollView.contentSize = CGSize.init(width: contentwidth, height: view.frame.size.height)
        scrollView.clipsToBounds = false
    }
    
    func respondToSwipeRight(gesture: UIGestureRecognizer)
    {
        let scrollviewWidth = scrollView.frame.size.width

        var frame: CGRect = self.scrollView.frame
        frame.origin.x = scrollView.contentOffset.x + scrollviewWidth * CGFloat(1)
        frame.origin.y = (view.frame.size.height / 2) - 75
        self.scrollView.scrollRectToVisible(frame, animated: true)
    }
    
    
    func respondToSwipeLeft(gesture: UIGestureRecognizer)
    {
        let scrollviewWidth = scrollView.frame.size.width
        
        var frame: CGRect = self.scrollView.frame
        frame.origin.x = scrollView.contentOffset.x - scrollviewWidth * CGFloat(1)
        frame.origin.y = (view.frame.size.height / 2) - 75
        self.scrollView.scrollRectToVisible(frame, animated: true)

    }

   
}

