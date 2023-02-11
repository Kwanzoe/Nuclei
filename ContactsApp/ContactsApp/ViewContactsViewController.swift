//
//  ViewContactsViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 09/02/23.
//

import UIKit
import Contacts

class ViewContactsViewController: UIViewController {

   
    
    @IBOutlet weak var viewContactsTable: UITableView!
    let saveRequest = CNSaveRequest()
    let store = CNContactStore()
    
    lazy var contacts: [CNContact] = {
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
        
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        return results

    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ViewContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewContactCell", for: indexPath)
        cell.textLabel?.text = String(contacts[indexPath.row].givenName) + " - " + contacts[indexPath.row].phoneNumbers[0].value.stringValue
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {_,_,_ in
            
            let updateContactVC = self.storyboard?.instantiateViewController(withIdentifier: "updateContact") as! UpdateContactViewController
            
            updateContactVC.modalPresentationStyle = .fullScreen
            
            updateContactVC.contactName = self.contacts[indexPath.row].givenName
            updateContactVC.contactNo = self.contacts[indexPath.row].phoneNumbers[0].value.stringValue
            updateContactVC.indexPath = indexPath
            
            
            self.present(updateContactVC, animated: true)
        }
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
            
            self.saveRequest.delete(self.contacts[indexPath.row].mutableCopy() as! CNMutableContact)
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           
            do{
                try self.store.execute(self.saveRequest)
                print("Success, You deleted the user")
              } catch let e{
                print("Error = \(e)")
              }
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [delete, edit])
        swipeActions.performsFirstActionWithFullSwipe = false // disables full swipe action

        return swipeActions
    }
}
