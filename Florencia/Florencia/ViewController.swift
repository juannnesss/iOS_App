//
//  ViewController.swift
//  Florencia
//
//  Created by Juan Vargas on 11/29/18.
//  Copyright © 2018 Juan Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    
    //MARK: Properties
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btGo: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Maneja text fueld inputs del usuario mediante delegados callbacks
        
        txtName.delegate=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: Delegados de UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
      //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        lbName.text=textField.text
    }
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //se activa cuando se cancela la selecion de pohotos, no se hace nada dismiss
        dismiss(animated: true, completion:nil)
    }
    //se maneja lo que se hace con la infomracion selecionada
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        //set imageView to display the selected image
        imageView.image=selectedImage
        //dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
  
// metodo para selecionar la photo, se agrego UIImagePickerControllerDelegate,UINavigationControllerDelegate
    //protocolos
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //hide the keyboard
        txtName.resignFirstResponder()
        //UIImagePickerController permite seleccionar fotos desde la libreria
        let imagePickerControler=UIImagePickerController()
        //para que solo se puedan selecionar, no tomar
        imagePickerControler.sourceType = .photoLibrary
        //Avisa a ViewController sea notifcado
        imagePickerControler.delegate=self
        present(imagePickerControler,animated: true,completion: nil)
    }
   
    @IBAction func setGo(_ sender: UIButton) {
        lbName.text="New Go"
    }
    
    


}

