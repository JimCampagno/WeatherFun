//
//  WeatherView.swift
//  WeatherFun
//
//  Created by Jim Campagno on 7/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

final class WeatherView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bottomEmojiLabel: UILabel!
    @IBOutlet weak var rightEmojiLabel: UILabel!
    @IBOutlet weak var topEmojiLabel: UILabel!
    @IBOutlet weak var leftEmojiLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var smallDescripLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    
    // If someone is to initialize a WeatherView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // If someone is to initalize a WeatherView in Storyboard setting the Custom Class of a UIView
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // 1. Load the nib named 'WeatherView' into memory, finding it in the main bundle.
        Bundle.main().loadNibNamed("WeatherView", owner: self, options: [:])
        
        // 2. Adding the 'contentView' to self (self represents the instance of a WeatherView which is a 'UIView').
        addSubview(contentView)
        
        // 3. Setting this false allows us to set our constraints on the contentView programtically
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 4. Setting the constraints programatically
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
}
