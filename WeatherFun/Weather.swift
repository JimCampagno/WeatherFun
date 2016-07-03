//
//  Weather.swift
//  WeatherFun
//
//  Created by Jim Campagno on 7/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//


import Foundation
import UIKit


enum Weather {
    
    case Sunny
    case Cloudy(coverage: Int)
    case Windy(speed: Double)
    
    var description: String {
        switch self {
        case .Sunny:
            return "It's sunny."
        case .Cloudy(let coverage):
            return "It's cloudy with a cloud coverage of \(coverage)."
        case .Windy(let speed):
            var windy = "The winds are gusting at \(speed) mph."
            if speed > 40 { windy += "!!" }
            return windy
        }
    }
    
    var image: UIImage {
        switch self {
        case .Sunny: return UIImage(named: "sunny")!
        case .Cloudy: return UIImage(named: "cloudy")!
        case .Windy: return UIImage(named: "windy")!
        }
    }
    
    static func produceWeatherReportWithWeek(week: [Weather]) -> String {
        
        var weatherReport = "WEATHER REPORT\n"
        
        for (index, day) in week.enumerated() {
            
            switch index {
            case 0: weatherReport += "Monday: "
            case 1: weatherReport += "Tuesday: "
            case 2: weatherReport += "Wednesday: "
            case 3: weatherReport += "Thursday: "
            case 4: weatherReport += "Friday: "
            case 5: weatherReport += "Saturday: "
            case 6: weatherReport += "Sunday: "
            default: weatherReport += ""
            }
            
            switch day {
            case .Sunny: weatherReport += "\(day.description)\n"
            case .Windy: weatherReport += "\(day.description)\n"
            case .Cloudy: weatherReport += "\(day.description)\n"
            }
            
        }
        
        return weatherReport
    }
    
    // It's a sunny week if 4 of the 7 days are supposed to be Sunny.
    static func isItASunnyWeek(week: [Weather]) -> Bool {
        var numberOfSunnyDays = 0
        
        for day in week {
            switch day {
            case .Sunny: numberOfSunnyDays += 1
            default: continue
            }
        }
        
        return numberOfSunnyDays >= 4
    }
}

// MARK: - Dummy Data
extension Weather {
    
    static func dummyMonth() -> [Weather] {
        let monday = Weather.Sunny
        let tuesday = Weather.Cloudy(coverage: 4)
        let wednesday = Weather.Windy(speed: 10)
        let thursday = Weather.Windy(speed: 55)
        let friday = Weather.Sunny
        let saturday = Weather.Sunny
        let sunday = Weather.Cloudy(coverage: 14)
        
        let week = [
            monday,
            tuesday,
            wednesday,
            thursday,
            friday,
            saturday,
            sunday
        ]
        
        return week
    }
    
}


