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
    
    
    public var body: some View {
        
        VStack {
            
            // Chart
            ZStack {
                
                ForEach(elements.indices, id: \.self) { index in
                    
                    let element = self.elements[index]
                    let startValue = self.elements[0..<index].reduce(0) { $0 + $1.value }
                    let endValue = startValue + element.value
                    
                    HJRingChartSection(startValue: startValue, endValue: endValue, color: element.color)
                }
                
                content()

            }
            
            // Legend
            HStack(alignment: .center) {
                
                ForEach(elements, id: \.self) { element in
                    HJRingChartLegend(title: element.title, color: element.color)
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
            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
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
        HJChartElement(title: "Ground", value: 0.3, color: Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0)),
        HJChartElement(title: "Volley", value: 0.5, color: Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0)),
        HJChartElement(title: "Serve", value: 0.2, color: Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0)),
    ]
    
    

    static var previews: some View {
        
        Group {
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                VStack {
                    Text("123")
                        .font(.system(size: 25.0, weight: .bold, design: .default))
                        .italic()
                        //.foregroundColor(Color("Background_Medium"))
                    Text("Shots")
                }
            }
            .previewLayout(.fixed(width: 200, height: 150))
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                VStack {
                    Text("123")
                        .font(.system(size: 25.0, weight: .bold, design: .default))
                        .italic()
                        //.foregroundColor(Color("Background_Medium"))
                    Text("Shots")
                }
            }
            .previewLayout(.fixed(width: 300, height: 200))
            
            HJRingChartView(elements: HJRingChartView_Previews.elements) {
                VStack {
                    Text("123")
                        .font(.system(size: 25.0, weight: .bold, design: .default))
                        .italic()
                        //.foregroundColor(Color("Background_Medium"))
                    Text("Shots")
                }
            }
            .previewLayout(.fixed(width: 400, height: 300))
            
        }
        
    }
    
}
