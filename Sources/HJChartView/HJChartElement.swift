//
//  HJChartElement.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJChartElement: Hashable {
    
    public let title: String
    public let value: Float
    public let color: Color
    
    
    public init(title: String, value: Float, color: Color) {
        self.title = title
        self.value = value
        self.color = color
    }

}
