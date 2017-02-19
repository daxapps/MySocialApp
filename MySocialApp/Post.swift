//
//  Post.swift
//  MySocialApp
//
//  Created by Jason Crawford on 2/15/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation
import Firebase

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    private var _postRef: FIRDatabaseReference!
    private var _uid: String!
    private var _user: String!
    var userRef: FIRDatabaseReference!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    var user: String {
        if _user == nil {
            return "??"
        } else {
            return _user
        }
    }
    
    var uid: String {
        return _uid
    }
    
    init(caption: String, imageUrl: String, likes: Int, user: String) {
        self._caption = caption
        self._imageUrl = caption
        self._likes = likes
        
        let userInfo = DataService.ds.REF_USER_CURRENT.child("info")
        userInfo.observeSingleEvent(of: .value, with: { (snap) in
            if let value = snap.value as? Dictionary<String, String> {
                self._user = value["username"]
            }
        })
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
        
        if let postUser = postData["uid"] as? String {
            print("Dax: uid for user of post \(postUser)")
            self._uid = postUser 
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
        
    }
    
    func adjustLikes(addLike: Bool) {
        if addLike {
            _likes = _likes + 1
        } else {
            _likes = likes - 1
        }
        _postRef.child("likes").setValue(_likes)
        
    }
    
}
