//
//  GKColor.swift
//  DatePIckerExample
//
//  Created by UBS_003 on 17/12/21.
//

import Foundation
import SwiftUI

extension Color {

    
    static let COLOR_155 : Color = color2(red: 155, green: 155, blue: 155)
    static let COLOR_151 : Color = color2(red: 151, green: 151, blue: 151)
    static let COLOR_201 : Color = color2(red: 201, green: 201, blue: 201)
    static let COLOR_206 : Color = color2(red: 206, green: 206, blue: 206)
    static let COLOR_102 : Color = color2(red: 102, green: 102, blue: 102)
    static let COLOR_240 :Color = color2(red: 240, green: 240, blue: 240)
    static let COLOR_230 :Color = color2(red: 230, green: 230, blue: 230)
    static let COLOR_242 :Color = color2(red: 242, green: 242, blue: 242)
    static let COLOR_250 :Color = color2(red: 250, green: 250, blue: 250)
    static let COLOR_SHADOW : Color = color2(red: 214, green: 214, blue: 214)
    
    static let COLOR_248_178_114 = color2(red: 248, green: 178, blue: 114)
    static let COLOR_245_87_120 = color2(red: 245, green: 87, blue: 120)
    static let COLOR_232_230_234 = color2(red: 232, green: 230, blue: 234)
    static let COLOR_214 = color2(red: 214, green: 214, blue: 214)
    static let COLOR_227 = color2(red: 227, green: 227, blue: 227)
    static let COLOR_79 = color2(red: 79, green: 79, blue: 79)
    static let COLOR_255_196_228 = color2(red: 255, green: 196, blue: 228)
    static let COLOR_BUTTON_GRADIENT:Gradient = Gradient(colors: [Color.COLOR_248_178_114, Color.COLOR_245_87_120])
}

func color1(red:CGFloat , green:CGFloat , blue:CGFloat , alpha:CGFloat) -> UIColor {
    return UIColor(red: (red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: alpha)
}

func color2(red:Double , green:Double , blue:Double) -> Color {
    return Color(red: (red/255.0), green: (green/255.0), blue: (blue/255.0))
}

