//
//  CustomRadiusButton.swift
//  CustomView
//
//  Created by Юлия  on 21.09.2024.
//

import Foundation
import SwiftUI

///Кнопка с разными cornerRadius без stroke
struct CustomRadiusButton: View {
    
    let title: String
    var imageName: String?
    var height: CGFloat?
    let color: Color
    
    let topLeftRadius: CGFloat
    let topRightRadius: CGFloat
    let bottomLeftRadius: CGFloat
    let bottomRightRadius: CGFloat
    var iconFrame: CGFloat = 24
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .frame(width: iconFrame, height: iconFrame)
            }
            Text(LocalizedStringKey(title))
        }
        .frame(maxWidth: .infinity, minHeight: height ?? 44,maxHeight: height ?? 44)
        .background(color)
        .clipShape(RoundedCorner(radius: topRightRadius,
                                 corners: [.topRight])
        )
        .clipShape(RoundedCorner(radius: topLeftRadius,
                                 corners: [.topLeft])
        )
        .clipShape(RoundedCorner(radius: bottomLeftRadius,
                                 corners: [.bottomLeft])
        )
        .clipShape(RoundedCorner(radius: bottomRightRadius,
                                 corners: [ .bottomRight])
        )
    }
}
