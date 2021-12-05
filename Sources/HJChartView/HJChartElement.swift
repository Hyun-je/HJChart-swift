//
//  HJChartElement.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJChartElement: Hashable {
    
    public let title: String
    public let startValue: Float
    public let endValue: Float
    public let color: Color
    
    
    public init(title: String, startValue: Float, endValue: Float, color: Color) {
        self.title = title
        self.startValue = startValue
        self.endValue = endValue
        self.color = color
    }

}
