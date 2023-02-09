//
//  ViewContactsViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 09/02/23.
//

import UIKit

class ViewContactsViewController: UIViewController {

    @IBOutlet weak var viewContactsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ViewContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewContactCell", for: indexPath)
        cell.textLabel?.text = "Kwanzo"
        return cell
    }
}
