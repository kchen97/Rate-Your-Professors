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
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
    {
        didSet
        {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5
        {
        didSet
        {
            setupButtons()
        }
    }
    
    var rating = 0 {
        didSet {
            updateButtonSelectedState()
        }
    }
    
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
        guard let index = ratingButtons.index(of: button) else {
            fatalError("Button was not found, \(button) is not in the array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1
        
        if(selectedRating == rating)
        {
            rating = 0
        }
        else
        {
            rating = selectedRating
        }
    }
    //Mark: Private Methods
    private func setupButtons()
    {
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for buttons in ratingButtons
        {
            removeArrangedSubview(buttons)
            buttons.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            //Add button to the stack
            addArrangedSubview(button)
            ratingButtons.append(button)
            updateButtonSelectedState()
        }
    }
    
    private func updateButtonSelectedState()
    {
        for(index, button) in ratingButtons.enumerated()
        {
            button.isSelected = index < rating
        }
    }
}
