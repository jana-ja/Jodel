//
//  ViewModel.swift
//  A3.3
//
//  Created by Jana Jansen on 05.01.23.
//

import Foundation


    @MainActor class ViewModel: ObservableObject {
        
        @Published var posts: Array<Post> = []{
            didSet{
                postsByUpvotes = posts.sorted{$0.votes > $1.votes}
                postsByCommentCount = posts.sorted{$0.comments.count > $1.comments.count}
            }
        }
        var postsByUpvotes: Array<Post> = []
        
        var postsByCommentCount: Array<Post> = []
        
        
        init() {
            self.posts = [
                Post(text: "Test Post", comments: [Comment(text: "cool", author: "Bert")], votes: 10),
                Post(text: "Texti Text", comments: [], votes: 20),
                Post(text: "Texti Text", comments: [Comment(text: "krass", author: "Brot"),Comment(text: "krass", author: "Brot")], votes: 5),
                Post(text: "Texti Text", comments: []),
                Post(text: "Texti Text", comments: [Comment(text: "krass", author: "Brot")]),
                Post(text: "Texti Text", comments: [Comment(text: "krass", author: "Brot")])
            ]
        }
        
        
        //func postsByUpvotes
        
        
        func addPost(post: Post){
            posts.append(post)
        }
        
        func showComments(index : Int){
            for i in posts.indices {
                posts[i].showComments = false
            }
            posts[index].showComments.toggle()
        }
        
    }

