//
//  AddStudentViewController.swift
//  SqliteDemo
//
//  Created by Hannarong Kaewkiriya on 22/11/2565 BE.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    var studentData : StudentModel?
    var headerTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if headerTitle != ""{
            self.title = headerTitle
            txtName.text = studentData?.name
            txtMarks.text = studentData?.mark
        }
    }
    
    @IBAction func onClickAdd(_ sender: UIButton) {
        if headerTitle != ""{
            let student = StudentModel(id: studentData!.id, name: txtName.text!, mark: txtMarks.text!)
            let isUpdated = ModelManager.getInstance().updateStudent(student: student)
            print("isUpdate : \(isUpdated)")

        }
        else {
            let student = StudentModel(id: "", name: txtName.text!, mark: txtMarks.text!)
            let isSave = ModelManager.getInstance().SaveStudent(student: student)
            print("isSave : \(isSave)")
            
        }
        
    }
    
}
