//
//  StarRatingView.swift
//  Star_Rating
//
//  Created by Miriam Hendler on 10/12/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

protocol StarRatingViewDelegate {
    func getRating(rating: Int)
}

class StarRatingView: UIView {

    
    var ratingClosure: ((_ rating: Int) -> ())?
    var delegate : StarRatingViewDelegate?
    
    var stars : [UILabel] = []
    var currentAmountOfStarsHighlighted = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .blue
        createUILables(starAmount: 3, superViewFrame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func createUILables(starAmount: Int, superViewFrame: CGRect) {
        for star in 0..<starAmount {
            var label = UILabel(frame: CGRect(x: CGFloat(star) * (superViewFrame.width/CGFloat(starAmount)), y: 0, width: superViewFrame.width/CGFloat(starAmount), height: superViewFrame.height))
            label.text = "\u{2606}"
            label.font = label.font.withSize(500)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.1
            label.numberOfLines = 0
            label.textAlignment = .center
            stars.append(label)
        }
         addUILabels()
    }

    func addUILabels(){
        for star in 0..<stars.count{
            self.addSubview(stars[star])
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Location: \(location)")
            setRating(x : location.x, y: location.y)
            
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Location: \(location)")
            
            setRating(x : location.x, y: location.y)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Location: \(location)")
          
            setRating(x : location.x, y: location.y)
        }
    }
    
    func setRating(x : CGFloat, y: CGFloat){
        //See where touch is 
        //how many stars to highlight
        let halfStar = (self.frame.width / CGFloat(stars.count) / 2)
        var starCountToHighlight = ((CGFloat(x) + halfStar)/(self.frame.width / CGFloat(stars.count)))
        currentAmountOfStarsHighlighted = Int(starCountToHighlight)
//        delegate?.getRating(rating: Int(starCountToHighlight))
        
        ratingClosure!(currentAmountOfStarsHighlighted)
        
        setAllStarsToEmpty()
        
        for i in 0..<Int(starCountToHighlight){
            print(i)
            if(Int(starCountToHighlight) <= stars.count){
                stars[i].text = "\u{2605}"
            }
        }
        //update the stars
        
    }
    
    func setAllStarsToEmpty(){
        for label in stars{
            label.text = "\u{2606}"
        }
    }


}
