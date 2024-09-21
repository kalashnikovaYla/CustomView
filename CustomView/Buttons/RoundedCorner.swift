//
//  RoundedCorner.swift
//  CustomView
//
//  Created by Юлия  on 21.09.2024.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
