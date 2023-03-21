//
//  PostListView.swift
//  A3.3
//
//  Created by Jana Jansen on 19.01.23.
//

import SwiftUI

struct PostListView: View {
    var tab: Int
    @EnvironmentObject var viewmodel: ViewModel
    
    var body: some View {
        ZStack{
            switch tab {
            case 2:
                List(){
                    ForEach(viewmodel.postsByUpvotes){ post in
                        PostView(post: post)
                    }
                }
                .listStyle(.plain)
            case 1:
                List(){
                    ForEach(viewmodel.postsByCommentCount){ post in
                        PostView(post: post)
                    }
                }
                .listStyle(.plain)
            default:
                List(){
                    ForEach(viewmodel.posts){ post in
                        PostView(post: post)
                    }
                }
                .listStyle(.plain)
            }
            
        }
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(tab: 0)
            .environmentObject(ViewModel())
    }
}
