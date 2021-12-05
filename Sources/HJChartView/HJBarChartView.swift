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
                        let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                        
                        HJBarChartSection(width: width, color: color)
                    }
                    
                }
                
            }
            .padding([.leading, .trailing, .bottom])
            
            // Legend
            HStack(alignment: .center) {
                
                ForEach(elements.indices, id: \.self) { index in
                    
                    let element = self.elements[index]
                    let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                    
                    HJBarChartLegend(title: element.title, color: color)
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
        HJChartElement(title: "Class0", value: 0.1),
        HJChartElement(title: "Class1", value: 0.2),
        HJChartElement(title: "Class2", value: 0.4),
        HJChartElement(title: "Class3", value: 0.3),
    ]
    
    

    static var previews: some View {
        
        Group {
            
            HJBarChartView(elements: HJBarChartView_Previews.elements) {
                Text("Small")
            }
            .previewLayout(.fixed(width: 200, height: 80))
            
            HJBarChartView(elements: HJBarChartView_Previews.elements) {
                Text("Medium")
            }
            .previewLayout(.fixed(width: 300, height: 90))
            
            HJBarChartView(elements: HJBarChartView_Previews.elements) {
                Text("Large")
            }
            .previewLayout(.fixed(width: 400, height: 100))
            
        }
        
    }
    
}
