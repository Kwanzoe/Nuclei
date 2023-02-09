//
//  DeleteContactViewController.swift
//  ContactsApp
//
//  Created by Kuarnjo Taid on 09/02/23.
//

import UIKit

class DeleteContactViewController: UIViewController {

    @IBOutlet weak var deleteContactTableData: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension DeleteContactViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteContactCell", for: indexPath)
        
        return cell
    }
    
    
    
}
