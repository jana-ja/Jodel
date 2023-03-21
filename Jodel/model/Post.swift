//
//  Post.swift
//  A3.3
//
//  Created by Jana Jansen on 05.01.23.
//

import Foundation

struct Post: Identifiable{
    var id = UUID()
    var text: String
    var comments: [Comment] = []
    var showComments: Bool = false
    var votes: Int = 0
}
