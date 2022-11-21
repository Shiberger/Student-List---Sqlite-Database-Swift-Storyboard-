//
//  ModelManager.swift
//  SqliteDemo
//
//  Created by Hannarong Kaewkiriya on 22/11/2565 BE.
//

import Foundation
import UIKit

// Create Global Instace
var shareInstance = ModelManager()

class ModelManager{
    
    var database : FMDatabase? = nil
    
    static func getInstance() -> ModelManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SqliteDemo.db"))
        }
        return shareInstance
    }
    
    // MARK: Saving Student Data
    func SaveStudent(student : StudentModel) -> Bool{
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO student (name, mark) VALUES(?,?)", withArgumentsIn: [student.name, student.mark])
        
        shareInstance.database?.close()
        return isSave!
        
    }
    
    // MARK: Fetching Student Data
    func getAllStudent() -> [StudentModel]{
        shareInstance.database?.open()
        var students = [StudentModel]()
        do{
            let resultset : FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM student", values: nil)
            
            if resultset != nil{
                while resultset!.next() {
                    
                    let student = StudentModel(id: (resultset!.string(forColumn: "id")!),name: (resultset!.string(forColumn: "name")!), mark: resultset!.string(forColumn: "mark")!)
                    students.append(student)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return students
    }
    
    // MARK: Update Student Data
    func updateStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        
        let isUpdate = shareInstance.database?.executeUpdate("UPDATE student SET name=?, mark=? WHERE id=?", withArgumentsIn: [student.name, student.mark, student.id])
        
        shareInstance.database?.close()
        return isUpdate!
    }
    
    // MARK: Delete Student Data
    func deleteStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        
        let isDelete = shareInstance.database?.executeUpdate("DELETE FROM student WHERE name=?", withArgumentsIn: [student.name])
        
        shareInstance.database?.close()
        return isDelete!
    }
}

//class ModelManager{
//
//    var database : FMDatabase? = nil
//
//    static func getInstance() -> ModelManager{
//        if shareInstance.database == nil{
//            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SqliteDemo.db"))
//        }
//        return shareInstance
//    }
//
//
//    // MARK: Saving Student Data
//    func SaveStudent(student : StudentModel) -> Bool{
//        shareInstance.database?.open()
//
//        let isSave = shareInstance.database?.executeUpdate("INSERT INTO student (name, mark) VALUE(?,?)", withArgumentsIn: [student.name, student.mark])
//
//        shareInstance.database?.close()
//        return isSave!
//    }
//}
