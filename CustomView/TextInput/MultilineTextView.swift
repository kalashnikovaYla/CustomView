//
//  MultilineTextView.swift
//  CustomView
//
//  Created by Юлия  on 21.09.2024.
//


import Foundation
import SwiftUI

///TextView в несколько строк + прозрачный background
struct MultilineTextView: UIViewRepresentable {
    
    @Binding var text: String
    ///Происходит ли редактирование текста
    @Binding var isEditing: Bool
    
    var isFirstResponder: Bool = true
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.delegate = context.coordinator
        textView.textColor = UIColor.label
        textView.tintColor = UIColor.orange
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, isEditing: $isEditing)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        @Binding var text: String
        @Binding var isEditing: Bool
        
        init(text: Binding<String>, isEditing: Binding<Bool>) {
            _text = text
            _isEditing = isEditing
        }
        func textViewDidChange(_ textView: UITextView) {
           text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            isEditing = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            isEditing = false
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
               let currentText = textView.text as NSString
               let newText = currentText.replacingCharacters(in: range, with: text)
               return newText.count <= 300
           }
    }
}

