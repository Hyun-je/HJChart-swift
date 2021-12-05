//
//  HJRingChartView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI


public struct HJRingChartView<Content: View>: View {
    
    let elements: [HJChartElement]
    let content: () -> Content
    
    public init(elements: [HJChartElement], content: @escaping () -> Content) {
        self.elements = elements
        self.content = content
    }
    
    public var body: some View {
        
        VStack {
            
            // Chart
            ZStack {
                
                ForEach(elements.indices, id: \.self) { index in
                    
                    let element = self.elements[index]
                    let startValue = self.elements[0..<index].reduce(0) { $0 + $1.value }
                    let endValue = startValue + element.value
                    let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                    
                    HJRingChartSection(startValue: startValue, endValue: endValue, color: color)
                }
                
                content()

            }
            
            // Legend
            HStack(alignment: .center) {
                
                ForEach(elements.indices, id: \.self) { index in
                    
                    let element = self.elements[index]
                    let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                    
                    HJRingChartLegend(title: element.title, color: color)
                }
                
            }
                
        }
        
    }
    
    
}


struct HJRingChartSection: View {
    
    let startValue: Float
    let endValue: Float
    let color: Color
    
    var body: some View {
        
        Circle()
            .trim(from: CGFloat(startValue), to: CGFloat(endValue))
            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(Angle(degrees: 270.0))
            .padding()
        
    }
    
}


struct HJRingChartLegend: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        
        VStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 10, height: 10)
            Text(title)
                .font(.system(size: 13.0, weight: .light, design: .default))
        }
        
    }
    
}


struct HJRingChartView_Previews: PreviewProvider {
    
    static let elements = [
        HJChartElement(title: "Class0", value: 0.1),
        HJChartElement(title: "Class1", value: 0.2),
        HJChartElement(title: "Class2", value: 0.4),
        HJChartElement(title: "Class3", value: 0.3),
    ]
    
    

    static var previews: some View {
        
        Group {
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                Text("Small")
            }
            .previewLayout(.fixed(width: 200, height: 150))
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                Text("Medium")
            }
            .previewLayout(.fixed(width: 300, height: 200))
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                Text("Large")
            }
            .previewLayout(.fixed(width: 400, height: 300))
            
        }
        
    }
    
}
