//
//  ViewController.swift
//  Florencia
//
//  Created by Juan Vargas on 11/29/18.
//  Copyright © 2018 Juan Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
   
    
    //MARK: Properties
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btGo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Maneja text fueld inputs del usuario mediante delegados callbacks
        
        txtName.delegate=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: Delegados de UIFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
      //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        lbName.text=textField.text
    }
    
    //MARK: Actions
    
  

    @IBAction func setGo(_ sender: UIButton) {
        lbName.text="New Go"
    }
    
    


}

