//
//  HJRingGaugeView.swift
//
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJRingGaugeView<Content: View>: View {
    
    let value: Float
    let color: Color
    let content: () -> Content
    
    
    public init(value: Float, color: Color = Color.black, content: @escaping () -> Content) {
        
        self.value = value
        self.color = color
        self.content = content
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
        
            ZStack(alignment: .center) {
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color.opacity(0.1))
                    .rotationEffect(Angle(degrees: 270.0))
                Circle()
                    .trim(from: CGFloat(0), to: CGFloat(value))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270.0))
                
                content()

            }
            .padding()
            
        }
        
    }
}

struct HJRingGaugeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            HJRingGaugeView(value: 0.3, color: Color.orange) {
                Text("Small")
            }
            .previewLayout(.fixed(width: 200, height: 150))
            
            HJRingGaugeView(value: 0.5, color: Color.orange) {
                Text("Medium")
            }
            .previewLayout(.fixed(width: 300, height: 200))
            
            HJRingGaugeView(value: 0.8, color: Color.orange) {
                Text("Large")
            }
            .previewLayout(.fixed(width: 400, height: 300))
            
        }
        
    }
    
}
