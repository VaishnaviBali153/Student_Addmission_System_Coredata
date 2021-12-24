//
//  CoreDataHandler.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import Foundation
import CoreData
import UIKit

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjectContex: NSManagedObjectContext?
    
    private init(){
        manageObjectContex = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        
        appDelegate.saveContext()
    }
    
    func insert(spid: Int, name: String, div: String, phone: String, pass: String, completion: @escaping () -> Void){
        let stud = Student(context: manageObjectContex!)
        stud.spid = Int64(spid)
        stud.name = name
        stud.div = div
        stud.phone = phone
        stud.pass = pass
        save()
        completion()
    }
    func update(stud: Student, spid: Int, name: String, div: String, phone: String, pass: String, completion: @escaping () -> Void){
        let stud = Student(context: manageObjectContex!)
        stud.spid = Int64(spid)
        stud.name = name
        stud.div = div
        stud.phone = phone
        stud.pass = pass
        save()
        completion()
    }
    
    func delete(stud: Student, completion: @escaping () -> Void){
        
        manageObjectContex!.delete(stud)
        save()
        completion()
    }
    
    func fetch() -> [Student]{
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let empArray = try manageObjectContex?.fetch(fetchRequest)
            return empArray!
        } catch {
            print(error)
            return [Student]()
        }
    }

    func checkLogin(username: Int, password: String) -> [Student]
    {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do {
            let p1 = NSPredicate(format: "spid == %i", username)
            let p2 = NSPredicate(format: "password == %@", password)

            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [p1,p2])
            
            let studArray = try manageObjectContex?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    
    func fetchprofile(spid: Int) -> [Student]
    {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do {
            
            fetchRequest.predicate = NSPredicate(format: "spid == %i", spid)
            
            let studArray = try manageObjectContex?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    
    func fetchbydiv(div : String) -> [Student]
    {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            fetchRequest.predicate = NSPredicate(format: "classes == %@",div)
            
            
            let studArray = try manageObjectContex?.fetch(fetchRequest)
            return studArray!
        }catch{
            print(error)
            return [Student]()
        }
    }

    func changepassword(stud: Student,password : String ,completion: @escaping () -> Void)
    {
        stud.pass = password
        save()
        completion()
    }
    
    func noticefetchbydiv(div : String) -> [Notice]
    {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        do{
            fetchRequest.predicate = NSPredicate(format: "div == %@",div)
            
            
           let noticeArray = try manageObjectContex?.fetch(fetchRequest)
            return noticeArray!
        }catch{
            print(error)
            return [Notice]()
        }
    }
    //Noteice
    
    func saveNote(){
        
        appDelegate.saveContext()
    }
    
    func insertNote(title: String, div: String, desc: String, completion: @escaping () -> Void){
        let note = Notice(context: manageObjectContex!)
        note.title = title
        note.div = div
        note.desc = desc
        saveNote()
        completion()
    }
    
    func updateNote(title: String, div: String, desc: String, completion: @escaping () -> Void){
        let note = Notice(context: manageObjectContex!)
        note.title = title
        note.div = div
        note.desc = desc
        saveNote()
        completion()
    }
    
    func deleteNote(note: Notice, completion: @escaping () -> Void){
        manageObjectContex!.delete(note)
        saveNote()
        completion()
    }
    
    func fetchNote() -> [Notice]
    {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        do{
            let noticeArray = try manageObjectContex?.fetch(fetchRequest)
            return noticeArray!
        } catch {
            print(error)
            return [Notice]()
        }
   }
}
