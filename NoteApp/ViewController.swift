//
//  ViewController.swift
//  NoteApp
//
//  Created by Edgar Ruiz on 6/12/18.
//  Copyright © 2018 Edgar Ruiz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    var note : [Note] = [Note]();
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    var noteTitle: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(textView.text)
        titleTextField.text = noteTitle;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

