//
//  RatingControl.swift
//  practiceApp
//
//  Created by Korman Chen on 9/14/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //Mark: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var starSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var starCount = 5
    
    //Mark: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //Mark: Actions for the buttons
    func ratingButtonTapped(button: UIButton)
    {
        print("The Button was tapped!")
    }
    
    //Mark: Private Methods
    private func setupButtons()
    {
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.backgroundColor = UIColor.black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            //Add button to the stack
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
}
