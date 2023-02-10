//
//  UpdateContactViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 10/02/23.
//

import UIKit
import Contacts

class UpdateContactViewController: UIViewController {
    
    @IBOutlet weak var contactNameField: UITextField!
    
    @IBOutlet weak var contactNoField: UITextField!
    
    let contact = CNMutableContact()
    let store = CNContactStore()
    let saveRequest = CNSaveRequest()
    
    var contactName: String!
    var contactNo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactNameField.text = contactName
        contactNoField.text = contactNo
        
    }
    
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        contact.givenName  = contactNameField.text!
        contact.phoneNumbers = [CNLabeledValue(
            label: CNLabelPhoneNumberiPhone,
            value: CNPhoneNumber(stringValue: contactNoField.text!))]
        saveRequest.add(contact, toContainerWithIdentifier: nil)
            
        do {
            try store.execute(saveRequest)
            
            contactNameField.text = ""
            contactNoField.text = ""
            
        } catch {
            print("Saving contact failed, error: \(error)")
        }
    }
    
}
