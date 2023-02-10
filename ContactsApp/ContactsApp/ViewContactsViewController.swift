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
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "updateContact") as! UpdateContactViewController
            
            vc.modalPresentationStyle = .fullScreen
            
            vc.contactName = self.contacts[indexPath.row].givenName
            vc.contactNo = self.contacts[indexPath.row].phoneNumbers[0].value.stringValue
            
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            self.saveRequest.delete(self.contacts[indexPath.row].mutableCopy() as! CNMutableContact)
           
            do{
                try self.store.execute(self.saveRequest)
                print("Success, You deleted the user")
              } catch let e{
                print("Error = \(e)")
              }
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
            
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.saveRequest.delete(self.contacts[indexPath.row].mutableCopy() as! CNMutableContact)
           
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
