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
    
    var notes : [Note] = [Note]();
    var note : Note?;
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    var category: Category?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = category!.name;
        if(category?.note != nil){
            loadNote();
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveNotes();
    }

    func saveNotes(){
        if(category?.note != nil){
            print("no longer nul")
            
            let request : NSFetchRequest<Note> = Note.fetchRequest();
            request.predicate = NSPredicate(format: "title MATCHES %@", (titleTextField?.text!)!)
            
            do{
                notes = try context.fetch(request);
                print(notes.count)
            }catch{
                print("error")
            }
            
            note = notes[0];
            note?.body = textView.text
            
            
            
            
            do{
                try context.save()
                print("Saved successfully");
            }catch{
                print(error);
            }
        }else{
            print("It is null")
            let note = Note(context:context);
            note.body = textView.text;
            note.category = category;
            note.title = category?.name;
            do{
                try context.save()
                print("Saved successfully");
            }catch{
                print(error);
            }
        }
        
        
    }
    
    func loadNote(){
        
        let request : NSFetchRequest<Note> = Note.fetchRequest();
        request.predicate = NSPredicate(format: "category.name MATCHES %@", (category?.name!)!)
        
        do{
            notes = try context.fetch(request);
            print(notes.count)
        }catch{
            print("error")
        }
        
        var x = 1;
        for note1 in notes{
            print(note1.body);
            print(x);
            x = x+1;
        }
       textView.text = notes[0].body
    }
    
}

