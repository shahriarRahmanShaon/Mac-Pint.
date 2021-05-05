//
//  TabButton.swift
//  Mac Pint.
//
//  Created by sergio shaon on 5/5/21.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var text: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                selected = text
            }
        }, label: {
            HStack(spacing: 20){
                Image(systemName:image)
                    .font(.title2)
                    .foregroundColor(selected == text ? Color.black : Color.black.opacity(0.4))
                    .frame(width: 25)
                Text(text)
                    .font(.callout)
                    .fontWeight(selected == text ? .semibold : .none)
                    .foregroundColor(selected == text ? Color.black : Color.black.opacity(0.4))
            }
            Spacer()
            // tab indicator
            ZStack{
                Capsule()
                    .fill(Color.clear)
                    .frame(width: 3, height: 20)
                if selected == text{
                    Capsule()
                        .fill(Color.red)
                        .frame(width: 3, height: 25)
                        .matchedGeometryEffect(id: "tab", in: animation)
                }
            }
        })
        .padding(.horizontal)
        .buttonStyle(PlainButtonStyle())
    }
}


