//
//  Data.swift
//  HomeWork14
//
//  Created by Yura on 08.01.2022.
//
import Foundation
import RealmSwift

class Data {
    
    private static let realm = try! Realm()
    
    static func append(newElement: Note) {
        try! realm.write {
            realm.add(newElement)
        }
            
        
    }
    
    static func count() -> Int{
        return realm.objects(Note.self).count
    }
    
    static subscript (i: Int) -> Note {
        return realm.objects(Note.self)[i]
    }
    
    static func remove(at i: Int) {
        try! realm.write {
            let objToDel = realm.objects(Note.self)[i]
            realm.delete(objToDel)
        }
    }
    
}
