//
//  PostView.swift
//  A3.3
//
//  Created by Jana Jansen on 05.01.23.
//

import SwiftUI

struct PostView: View {
    
    var post: Post
    @EnvironmentObject var viewmodel: ViewModel
    
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                    // top leiste
                    HStack(spacing: 10){
                        Text("@Tag")
                            .modifier(PostTextModifier())
                        Text("nah")
                            .modifier(PostTextModifier())
                        Text("10 min")
                            .modifier(PostTextModifier())
                    }.padding()
                    
                    // content
                    HStack{
                        VStack(alignment: .leading){
                            Text(post.text)
                                .modifier(PostTextModifier())
                                .font(.body)
                                
                            if(post.showComments){
                                Divider()
                                ForEach(post.comments){ comment in
                                    Text("\(comment.author): \(comment.text)")
                                        .modifier(PostTextModifier())
                                }
                            }
                        }
                        
                    }.padding(.leading)
                    
                    // bottom leiste
                    
                        HStack{
                            Button(action:{viewmodel.showComments(index: 0)}){
                                Image(systemName: "text.bubble.fill")
                                    .modifier(PostSymbolModifier())
                            }
                            Spacer()
                            Button(action:{}){
                                Image(systemName: "ellipsis")
                                    .modifier(PostSymbolModifier())
                            }.padding(.leading, 20)
                            Spacer()
                        }.padding()
                        
                }
                VStack(spacing: 10){
                    Button(action:{}){
                        Image(systemName: "chevron.up")
                            .fontWeight(.heavy)
                            .modifier(PostSymbolModifier())
                    }
                    Text("\(post.votes)")
                        .modifier(PostTextModifier())
                    Button(action:{}){
                        Image(systemName: "chevron.down")
                            .fontWeight(.heavy)
                            .modifier(PostSymbolModifier())
                    }
                }.padding(.trailing)
            }
            .background(Color.purple)
            .cornerRadius(10)
        
    }
}

struct PostTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
    }
}
struct PostSymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
    }
}

struct PostView_Previews: PreviewProvider {
    static let viewmodel = ViewModel()
    static var previews: some View {
        PostView(post: Post(text: "Test Post total viel Text über die Uni undso Schüler raus haha Paulaner.", comments: [Comment(text: "hehe", author: "Bert")], showComments: false)).environmentObject(viewmodel)
    }
}
