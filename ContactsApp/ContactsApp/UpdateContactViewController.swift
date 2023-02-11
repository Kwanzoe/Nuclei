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
    
    var contactName: String!
    var contactNo: String!
    var indexPath: IndexPath!
    
    lazy var contactToChange: CNContact = {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: CNContact!
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)
                if containerResults[0].givenName == contactName && containerResults[0]
                    .phoneNumbers[0].value.stringValue == contactNo {
                    results = containerResults[0]
                }
            } catch {
                print("Error fetching results for container")
            }
        }
        return results

    }()
    
    let contact = CNMutableContact()
    let store = CNContactStore()
    let saveRequest = CNSaveRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactNameField.text = contactName
        contactNoField.text = contactNo
        
    }
    
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        // Deleting old contact
        let viewContactsVC = storyboard?.instantiateViewController(withIdentifier: "viewContacts") as! ViewContactsViewController
        
        viewContactsVC.saveRequest.delete(viewContactsVC.contacts[indexPath.row].mutableCopy() as! CNMutableContact)
        viewContactsVC.contacts.remove(at: indexPath.row)

        do{
            try viewContactsVC.store.execute(viewContactsVC.saveRequest)
            print("Success, You deleted the user")
          } catch let e{
            print("Error = \(e)")
          }
        
        //adding the new edited contact
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
        
        dismiss(animated: true)
    }
    
}
