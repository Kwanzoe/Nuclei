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
        
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addContactBtnTapped(_ sender: UIButton) {
        if nameField.text != "" && numberField.text != ""{
            contact.givenName  = nameField.text!
            contact.phoneNumbers = [CNLabeledValue(
                label: CNLabelPhoneNumberiPhone,
                value: CNPhoneNumber(stringValue: numberField.text!))]
            
            saveRequest.add(contact, toContainerWithIdentifier: nil)
            
            
            do {
                try store.execute(saveRequest)
            } catch {
                print("Saving contact failed, error: \(error)")
            }
            
        }
        
    }
    
}
