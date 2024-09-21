//
//  GetHeightModifier.swift
//  CustomView
//
//  Created by Юлия  on 21.09.2024.
//

import Foundation
import SwiftUI

///Получает размер контента на view SwiftUI. Использовать для создания bottom sheet 
struct GetHeightModifier: ViewModifier {
    
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}


/*
 @State var sheetHeight: CGFloat = .zero
 
 .sheet(isPresented: $needOpenSheet, content: {
    if #available(iOS 16.0, *) {
        view
            .fixedSize(horizontal: false, vertical: true)
            .modifier(GetHeightModifier(height: $sheetHeight))
            .presentationDetents([.height(sheetHeight)])
    }
 })
 
 */
