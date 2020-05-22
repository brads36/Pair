//
//  PairListTableViewController.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import UIKit

class PairListTableViewController: UITableViewController {

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        presentMemberAddAlert()
    }
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        
        for pair in PairController.shared.pairs {
            PairController.shared.DeletePair(pair)
        }
        
        var id = 0
        var index = (MemberController.shared.members.count / 2)
        var tempMembers = MemberController.shared.members.shuffled()
        
//        while index > 0 {
//            if (tempMembers[index] == tempMembers.last) {
//                var newPair = Pair(pairID: id, firstMember: tempMembers[index])
//            }
//        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PairController.shared.pairs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pairCell", for: indexPath) as? PairTableViewCell else { return UITableViewCell() }

        let pair = PairController.shared.pairs[indexPath.row]
        cell.pairIDLabel.text = "Group \(pair.pairID)"
        //cell.memberOneLabel.text

        return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

} // End Of class

extension PairListTableViewController {
    func presentMemberAddAlert() {
        let alertController = UIAlertController(title: "Add Name", message: "Enter new name here", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter here..."
            textField.autocapitalizationType = .words
        }
        
        let addMemberAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let text = alertController.textFields?.first?.text, !text.isEmpty
                else { return }
            
            MemberController.shared.addMember(text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(addMemberAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
        }
}

