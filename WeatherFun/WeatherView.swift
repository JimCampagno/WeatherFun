//
//  WeatherView.swift
//  WeatherFun
//
//  Created by Jim Campagno on 7/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

final class WeatherView: UIView {
    
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
        //TODO: Do some stuff
    }
    
}
