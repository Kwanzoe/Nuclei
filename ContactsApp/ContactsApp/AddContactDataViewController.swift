//
//  AddContactDataViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 07/02/23.
//

import UIKit
import Contacts

class AddContactDataViewController: UIViewController {
    
    let contact = CNMutableContact()
    let store = CNContactStore()
    let saveRequest = CNSaveRequest()
    
    @IBOutlet weak var nameField: UITextField!
        
    @IBOutlet weak  var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addContactBtnTapped(_ sender: UIButton) {
        if nameField.text != "" && numberField.text != ""{
            contact.givenName  = nameField.text!
            contact.phoneNumbers = [CNLabeledValue(
                label: CNLabelPhoneNumberiPhone,
                value: CNPhoneNumber(stringValue: numberField.text!))]
            saveRequest.add(contact, toContainerWithIdentifier: nil)
            
            print(contact.givenName)
                
            do {
                try store.execute(saveRequest)
                
                nameField.text = ""
                numberField.text = ""
                
            } catch {
                print("Saving contact failed, error: \(error)")
            }
            
            dismiss(animated: true)
            
        }
    }
    
    
}


