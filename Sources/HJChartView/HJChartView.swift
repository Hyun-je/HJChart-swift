//
//  HJChartView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJChartView {
    
    static var colors = [
        Color(red:100, green:152, blue:192),
        Color(red:82, green:87, blue:75),
        Color(red:216, green:153, blue:103),
        Color(red:138, green:104, blue:177),
        Color(red:81, green:122, blue:106),
        Color(red:209, green:99, blue:138),
        Color(red:223, green:191, blue:136),
        Color(red:50, green:67, blue:134),
        Color(red:177, green:88, blue:105),
        Color(red:135, green:193, blue:151),
    ]

}

extension Color {
    
    init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
    
}
