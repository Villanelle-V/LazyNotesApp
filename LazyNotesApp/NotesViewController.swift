//
//  NotesViewController.swift
//  LazyNotesApp
//
//  Created by Polina on 14.04.2022.
//

import UIKit

class NotesViewController: UIViewController {
    private let tableView = UITableView()
    private var notes: [Notes] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
    // MARK: - UITableViewDataSource
    extension NotesViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
                return cell
            }
        }

    // MARK: - UITableViewDelegate
    extension NotesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            var cellHeight:CGFloat = CGFloat()
            cellHeight = 80
            return cellHeight
        }
    }
