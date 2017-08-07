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
        for x in 0...2
        {
            let imagee = UIImage(named: "icon\(x).png")
            let uiimageview = UIImageView(image: imagee)
            
            myuiimages.append(uiimageview)
            
            var newX: CGFloat = 0.0
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            contentwidth += newX

            
            scrollView.addSubview(uiimageview)
            uiimageview.frame = CGRect.init(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            
        }
        
        scrollView.contentSize = CGSize.init(width: contentwidth, height: view.frame.size.height)
    }

   
}

