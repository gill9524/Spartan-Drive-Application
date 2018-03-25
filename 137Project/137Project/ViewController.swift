//
//  ViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 2/28/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    let database = CKContainer.default().privateCloudDatabase
    
    var counter: Int = 0
    
    var notes = [CKRecord]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addToDatabase() {
        
        counter += 1
        let record = CKRecord(recordType: "Note")
        
        record.setValue(String(counter), forKeyPath: "content")
        
        database.save(record) { (record, error) in
            guard error == nil else { return print("Error")}
            print("saved successfully")
            
        }
    }
    
    @IBAction func queryDatabase(){
        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { (records, error) in
            guard error == nil else { return }
            self.notes = records!
            for record in self.notes{
                print(record.value(forKey: "content"))
            }
        }
    }
    
    @IBAction func removeFromDatabase(){
        let lastNote = self.notes.last
        guard lastNote != nil else { return }
        database.delete(withRecordID: (lastNote?.recordID)!) { (_, error) in
            guard error == nil else { return }
            let lastIndex = self.notes.count - 1
            self.notes.remove(at: lastIndex)
            print("deleted successfully.")
        }
    }
    
   
    
 

}

