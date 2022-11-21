//
//  Util.swift
//  SqliteDemo
//
//  Created by Hannarong Kaewkiriya on 22/11/2565 BE.
//

import Foundation
import UIKit

class Util{
    
    static let share = Util()
    
    // MARK: Getting Path of our database
    
    func getPath(dbName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(dbName)
        print(fileUrl.path)
        return fileUrl.path
    }
    
    // MARK: If Database path is not exists the creating database path
    func copyDatabase(dbName: String){
        let dbPath = getPath(dbName: "SqliteDemo.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(dbName)
            do{
                try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
            }
            catch let err{
                print(err.localizedDescription)
            }
        }
    }
}
