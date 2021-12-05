//
//  HJChartData.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJChartData {
    
    public var elements = [HJChartElement]()
    
    public init(elements: [HJChartElement]) {
        self.elements = elements
    }
    
    public mutating func addElement( _ element: HJChartElement) {
        elements.append(element)
    }
    
}
