//
//  customGroupBox.swift
//  probable-node
//
//  Created by m1_air on 8/11/24.
//

import SwiftUI

struct customGroupBox: View {
    var body: some View {
        ZStack{
            Color(.black)
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.5), .purple, .pink.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ///
            ZStack{
                VStack{
                    HStack{
                        Text("VISA").font(.system(size: 28)).foregroundStyle(Color.white).fontWeight(.ultraLight).padding()
                        Spacer()
                    }
                    Spacer()
                    Text("4000   7878   6619   1897").font(.system(size: 28)).foregroundStyle(Color.white).fontWeight(.ultraLight)
                    Text("Exp. 12/25").font(.system(size: 14)).foregroundStyle(Color.white).fontWeight(.ultraLight).padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0))
                    Spacer()
                    HStack{
                        Text("PETER J. BISHOP").font(.system(size: 18)).foregroundStyle(Color.white).fontWeight(.ultraLight).padding(EdgeInsets(top: 0, leading: 18, bottom: 8, trailing: 0))
                        Spacer()
                    }
                }
            }.frame(width: 380, height: 230)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .shadow(color: Color.black.opacity(0.5), radius: 20)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.75), lineWidth: 0.5) // Adding the white border with 1px width
            )
            .padding()
            ///
        }.ignoresSafeArea()
    }
}

#Preview {
    customGroupBox()
}
