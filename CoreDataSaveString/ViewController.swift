//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by Tran Ngoc Nam on 5/7/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            guard let entity = try AppDelegate.context.fetch(Person.fetchRequest()) as? [Person] else {return}
            inputTextField.text = entity.last?.name
        } catch  {
            print("Fetch Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(_ sender : UIBarButtonItem) {
        let entity = Person(context: AppDelegate.context)
        guard inputTextField.text != "" else { return }
        entity.name = inputTextField.text
        AppDelegate.saveContext()
    }
}

