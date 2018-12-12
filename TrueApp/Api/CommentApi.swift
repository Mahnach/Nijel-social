//
//  CommentApi.swift
//  TrueApp
//
//  Created by Nijel Hunt on 9/4/18.
//  Copyright © 2018 Nijel Hunt. All rights reserved.
//

import Foundation
import FirebaseDatabase

class CommentApi{
    var REF_COMMENTS = Database.database().reference().child("comments")

    func observeComments(withPostId id: String, completion: @escaping (Comment) -> Void){
        REF_COMMENTS.child(id).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any]{
                let newComment = Comment.transformComment(dict: dict)
                completion(newComment)
            }
        })
    }
    }

