//
//  CustomTabBar.swift
//  Projet OLIS
//
//  Created by apprenant50 on 13/05/2022.
//

import SwiftUI

struct CustomTabBar: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                Spacer()
                switch viewRouter.currentPage {
                case .home :
                        HomeView()
                
                case .stat :
                   TableauDeStat()
                case .profile :
                    ProfilView()
                case .chat :
                    ChatView()
                }
                Spacer()
                
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndheight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack{
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .stat,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "chart.line.uptrend.xyaxis", tabName: "Statistiques")
                        
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.height/7)
                                .shadow(radius: 4)
                            Image(systemName: "calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/9-6, height: geometry.size.height/9-6)
                                .foregroundColor(.orange)
                                .rotationEffect(Angle(degrees: showPopUp ? 360 : 0))
                        }
                        .offset(y:-geometry.size.height/8/4)
                        .onTapGesture {
                            withAnimation {
                                showPopUp.toggle()
                                
                            }
                            
                        }
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .profile,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle.fill", tabName: "Profil")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .chat,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "message.fill", tabName: "Chat")
                    }
                    
                    .frame(width: geometry.size.width, height:  80)
                    
                }
                
            }.edgesIgnoringSafeArea(.bottom)
        }
       
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(viewRouter: ViewRouter())
    }
}

struct PlusMenu : View {
    let widthAndheight : CGFloat
    
    var body: some View {
        HStack(spacing : 50){
            ZStack{
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: widthAndheight, height: widthAndheight)
                Image(systemName: "eyes.inverse")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndheight, height: widthAndheight)
                    .foregroundColor(.white)
            }
            ZStack{
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: widthAndheight, height: widthAndheight)
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndheight, height: widthAndheight)
                    .foregroundColor(.white)
            }
        }
        .transition(.scale)
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage :Page
    
    let width, height: CGFloat
    let systemIconName, tabName:String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .padding(.vertical, 50)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.black : .gray)
    }
}

