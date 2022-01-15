//
//  Data.swift
//  HomeWork14
//
//  Created by Yura on 10.01.2022.
//
import Foundation
import CoreData
import UIKit

class Data3 {
    
    static private var listOfNotes: [NSManagedObject] = []
    
    static func fetchData() {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "NoteCoreD")
        
        do {
          listOfNotes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    static func count() -> Int{
        return listOfNotes.count
    }
    
    // Сюда попадаем когда кто-то вызыавает например Data3[2]
    static subscript (i: Int) -> String {
        return listOfNotes[i].value(forKey: "message") as! String
    }
    
    static func remove(at i: Int) {
        
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let object = listOfNotes[i]
        managedContext.delete(object)
    }
    
    
    
    static func append(_ x: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "NoteCoreD", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        
        note.setValue(x, forKeyPath: "message")
        
        do {
            try managedContext.save()
            listOfNotes.append(note)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
    
}
