//
//  ViewController.swift
//  Star_Rating
//
//  Created by Miriam Hendler on 10/12/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view, typically from a nib.
        var viewFrame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 100.0)
        var View = StarRatingView(frame: viewFrame)
        View.ratingClosure = getRating
        self.view.addSubview(View)
//        View.delegate = self
        
        

    }

    func testFunc(){
        print("test")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getRating(rating: Int) {
        scoreLabel.text = "\(rating)"
    }
    

}

