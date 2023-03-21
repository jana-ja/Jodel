//
//  TabHostView.swift
//  A3.3
//
//  Created by Jana Jansen on 21.03.23.
//

import SwiftUI

struct TabHostView: View {
    
    @StateObject private var viewmodel = ViewModel()
    
    var body: some View {
        ZStack{
            TabView{
                PostListView(tab: 0)
                    .tabItem({
                        Image(systemName: "clock.fill")
                    })
                PostListView(tab: 1)
                    .tabItem({
                        Image(systemName: "text.bubble.fill")
                        
                    })
                PostListView(tab: 2)
                    .tabItem({
                        Image(systemName: "chevron.up")
                        
                    })
            }.environmentObject(viewmodel)
            
            VStack(){
                Spacer()
                Button(action: {}){
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(Color.black.opacity(0.4))
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                }
            }.padding(.bottom, 70)
        }
    }
}

struct TabHostView_Previews: PreviewProvider {
    static var previews: some View {
        TabHostView()
    }
}
