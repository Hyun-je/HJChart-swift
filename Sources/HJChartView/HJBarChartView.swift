//
//  HJBarChartView.swift
//
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI


public struct HJBarChartView<Content: View>: View {
    
    let elements: [HJChartElement]
    let content: () -> Content
    
    
    public var body: some View {
        
        VStack {
            
            // Chart
            GeometryReader { geometry in
                
                HStack(spacing: 0) {
                
                    ForEach(elements.indices, id: \.self) { index in
                        
                        let element = self.elements[index]
                        let width = element.value * Float(geometry.size.width)
                        
                        HJBarChartSection(width: width, color: element.color)
                    }
                    
                }
                
            }
            
            // Legend
            HStack(alignment: .center) {
                
                ForEach(elements, id: \.self) { element in
                    HJBarChartLegend(title: element.title, color: element.color)
                }
                
            }
                
        }
        
    }
    
    
}


struct HJBarChartSection: View {
    
    let width: Float
    let color: Color
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .padding(0)
            .frame(width: CGFloat(width))
        
    }
    
}


struct HJBarChartLegend: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        
        VStack {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 10, height: 10)
            Text(title)
                .font(.system(size: 13.0, weight: .light, design: .default))
        }
        
    }
    
}


struct HJBarChartView_Previews: PreviewProvider {
    
    static let elements = [
        HJChartElement(title: "Ground", value: 0.3, color: Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0)),
        HJChartElement(title: "Volley", value: 0.5, color: Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0)),
        HJChartElement(title: "Serve", value: 0.2, color: Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0)),
    ]
    
    

    static var previews: some View {
        
        Group {
            
            HJBarChartView(elements: HJRingChartView_Previews.elements) {
                Text("Small")
            }
            .previewLayout(.fixed(width: 200, height: 60))
            
            HJBarChartView(elements: HJRingChartView_Previews.elements) {
                Text("Medium")
            }
            .previewLayout(.fixed(width: 300, height: 60))
            
            HJBarChartView(elements: HJRingChartView_Previews.elements) {
                Text("Large")
            }
            .previewLayout(.fixed(width: 400, height: 60))
            
        }
        
    }
    
}
