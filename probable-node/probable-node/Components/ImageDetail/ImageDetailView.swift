//
//  ImageDetailView.swift
//  probable-node
//
//  Created by m1_air on 8/14/24.
//

import SwiftUI

struct ImageDetailView: View {
    var body: some View {
        ZStack{
            AsyncAwaitImageView(imageUrl: URL(string: "https://images.pexels.com/photos/2980955/pexels-photo-2980955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")!)
                           .scaledToFill()
                           .ignoresSafeArea(.all, edges: [.top, .bottom])
//                           .frame(width: 320, height: 320)
//                           .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
//                           .shadow(color: .black.opacity(0.6), radius: 15, x: 5, y: 5)
//                           .padding(.horizontal, 20)
//                           .padding(.vertical, 30)
            VStack{
                HStack{
                    VStack{
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "square.and.arrow.up.circle.fill").resizable().frame(width: 50, height: 50).tint(.white).shadow(color: .gray.opacity(0.5), radius: 15, x: 5, y: 5).padding()
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "figure.walk.circle.fill").resizable().frame(width: 50, height: 50).tint(.white).shadow(color: .gray.opacity(0.5), radius: 15, x: 5, y: 5).padding()
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "book.circle.fill").resizable().frame(width: 50, height: 50).tint(.white).shadow(color: .gray.opacity(0.5), radius: 15, x: 5, y: 5).padding()
                        })
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bookmark.circle.fill").resizable().frame(width: 50, height: 50).tint(.white).shadow(color: .gray.opacity(0.5), radius: 15, x: 5, y: 5).padding()
                        })
                        
                        
                    }
                    .frame(width: 70)
                    .background(Color(.black).opacity(0.2))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .shadow(color: .black.opacity(0.6), radius: 15, x: 5, y: 5)
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 0))
            }
        }
    }
}

#Preview {
    ImageDetailView()
}
