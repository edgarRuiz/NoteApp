//
//  ViewController.swift
//  NoteApp
//
//  Created by Edgar Ruiz on 6/12/18.
//  Copyright © 2018 Edgar Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(textView.text)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

