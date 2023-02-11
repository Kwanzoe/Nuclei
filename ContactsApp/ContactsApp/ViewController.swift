//
//  ViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 07/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addContact(_ sender: Any) {
        let addContactVC = storyboard?.instantiateViewController(withIdentifier: "addContacts") as! AddContactDataViewController
        
        addContactVC.modalPresentationStyle = .fullScreen
        present(addContactVC, animated: true)

    }
    
    @IBAction func viewContacts(_ sender: UIButton) {
        let viewContactsVC = storyboard?.instantiateViewController(withIdentifier: "viewContacts") as! ViewContactsViewController
        
        viewContactsVC.modalPresentationStyle = .fullScreen
        present(viewContactsVC, animated: true)

    }
    
    
    
}

