//
//  FirebaseController.swift
//  FirebaseTest
//
//  Created by Julio Brazil on 28/04/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import Firebase

public class FirebaseController {
    static let instance = FirebaseController()
    
    let ref = FIRDatabase.database().reference()
    private var dataBase: FIRDataSnapshot
    
    private init() {
        ref.keepSynced(true)
        self.dataBase = FIRDataSnapshot()
        setObserver()
    }
    
    private func setObserver() {
        ref.observe(.value, with: { (snapshot) in
            self.dataBase = snapshot
        })
    }
    
    public func getSnapshot() -> [String: AnyObject]{
        return dataBase.value as! [String: AnyObject]
    }
    
    //Mark: - GROUP STUFF
    public func saveGroup(_ group: Group) {
        ref.child("Groups").child("\(group.id)").setValue(group.getDictionary())
    }
    
    public func getGroups() -> [Group] {
        let snapshot = self.dataBase.childSnapshot(forPath: "Groups").children
        var groups: [Group] = []
        for group in snapshot {
            groups.append(Group(snapshot: group as! FIRDataSnapshot))
        }
        return groups
    }
    
    public func getGroup(withId id: String) -> Group {
        let snapshot = self.dataBase.childSnapshot(forPath: "Group").childSnapshot(forPath: id)
        let group = Group(snapshot: snapshot)
        return group
    }
    
    //Mark: - USER STUFF
    public func saveUser(_ user: Usuario) {
        ref.child("Users").child("\(user.tia)").setValue(user.getDictionary())
    }
    
    public func getUsers() -> [Usuario] {
        let snapshot = self.dataBase.childSnapshot(forPath: "Users").children //reduces the snapshot to a more specific sector
        var users: [Usuario] = [] //array of users
        for user in snapshot { //wlk through the users in the snapshot and add them to the array
            users.append(Usuario(snapshot: user as! FIRDataSnapshot))
        }
        return users //return the array of users
    }

    public func getUser(withId id: String) -> Usuario {
        let snapshot = self.dataBase.childSnapshot(forPath: "Users").childSnapshot(forPath: id)
        let user = Usuario(snapshot: snapshot)
        return user
    }
}
