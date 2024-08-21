//
//  TeamView.swift
//  probable-node
//
//  Created by m1_air on 8/13/24.
//

import SwiftUI

struct TeamView: View {
    @State var teamManager: TeamViewModel = TeamViewModel(members: [TeamMember(id: UUID().uuidString, role: "Developer", name: "PETER J. BISHOP", image: "https://scontent-den2-1.xx.fbcdn.net/v/t39.30808-6/447799235_10103364506938085_178705048584251809_n.jpg?stp=cp6_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=r51uSuPSkvAQ7kNvgGItPZ0&_nc_ht=scontent-den2-1.xx&oh=00_AYB7hqRGXn1tvEr10SLueWjLxfc0p7DCDiLpV_IOV_VNdw&oe=66C1D9C8", description: "Hi, I'm Peter! I'm an application developer with experience in SwiftUI, Flutter, and React frameworks. I also have backend experience building RESTful APIs with Node, Express, MongoDB, MySQL, and Apollo GraphQL. In my current position in as a Subject Matter Expert for the Techniccal Support Team at ClickUp I work regularly to troubleshoot internal and external APIs in the context of Angular web and Flutter mobile applications."), TeamMember(id: UUID().uuidString, role: "DevDog", name: "Oliver Bishop", image: "https://scontent-den2-1.xx.fbcdn.net/v/t39.30808-6/288386814_10102929320724745_917516006894952137_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=Vp8x8Emjkv4Q7kNvgGDVXFC&_nc_ht=scontent-den2-1.xx&oh=00_AYDP4rnCoNLBHPSobHnsF_R8fdI7xxYk0I4XHxv69wDADA&oe=66C1DAFC", description: "Hi, I'm Oliver! I'm an application developer's assistant with a passion for adventure. Need to fit a square dog in a round doughnut?  I got you covered. Look for me by the desk because I take a real paws on approach to project management.")], member: TeamMember(id: UUID().uuidString, role: "", name: "", image: "", description: ""))
    
    var body: some View {
            ZStack{
                Color(.black)
                VStack{
                    Text("")
                    ScrollView(content: {
                        ForEach(teamManager.members) {
                            member in
                            ZStack{
                                VStack{
                                    HStack{
                                        Text(member.role).font(.system(size: 28)).foregroundStyle(Color.white).fontWeight(.ultraLight)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(member.name).font(.system(size: 18)).foregroundStyle(Color.white).padding(EdgeInsets(top: 0, leading: 18, bottom: 8, trailing: 0))
                                        Spacer()
                                    }
                                    Spacer()
                                    AsyncAwaitImageView(imageUrl: URL(string: member.image)!)
                                                   .scaledToFill()
                                                   .frame(width: 320, height: 320)
                                                   .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                                   .shadow(color: .black.opacity(0.6), radius: 15, x: 5, y: 5)
                                                   .padding(.horizontal, 20)
                                                   .padding(.vertical, 30)
                                    ScrollView(content: {
                                        Text(member.description).font(.system(size: 18)).foregroundStyle(Color.white).fontWeight(.ultraLight).padding()
                                    })
                                }
                            }
                            .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill( LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0.02), .purple.opacity(0.75), .cyan.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .shadow(color: Color.black.opacity(0.5), radius: 20)
                                )
                                .padding()
                        }
                    }).padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
                }
                
            }.ignoresSafeArea()
    }
}

#Preview {
    TeamView()
}
