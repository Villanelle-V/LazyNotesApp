//
//  NotesViewController.swift
//  LazyNotesApp
//
//  Created by Polina on 14.04.2022.
//

import UIKit

final class NotesViewController: UIViewController {
    // MARK: - Properties
    private let tableView = UITableView()
    private let placeholder = UILabel()
    
    // MARK: - Private data
    private var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addPlaceholder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let vc = NoteViewController()
                vc.loadingState(state: Review())
                self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - UITableViewDataSource
extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NotesTableViewCell.className), for: indexPath) as! NotesTableViewCell
        cell.dateLabel.text = notes[indexPath.row].date
        cell.timeLabel.text = notes[indexPath.row].time
        cell.contextLabel.text = notes[indexPath.row].text
    
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

// MARK: - Configure View
private extension NotesViewController {
    func configureUI() {
        configureTableView()
        configureNavigationBar()
    }
    
    func configureTableView() {
        view.addAndFill(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: NotesTableViewCell.className), bundle: nil), forCellReuseIdentifier: String(describing: NotesTableViewCell.className))

        view.addSubview(tableView)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoteButton(sender:)))
    }
    
    @objc func addNoteButton(sender: UIBarButtonItem) {
        let vc = NoteViewController()
        vc.loadingState(state: CreateNew())
        vc.delegate = self
        show(vc, sender: sender)
    }
}

// MARK: - AddNoteDelegate
extension NotesViewController: AddNoteDelegete {
    func addNote(note: Note) {
            self.notes.append(note)
            self.tableView.reloadData()
            self.placeholder.isHidden = true
    }
}

// MARK: - AddPlaceholderLabel
extension NotesViewController {
    func addPlaceholder() {
        view.addSubview(placeholder)
        placeholder.text = "Press '+' to create a new note!"
            placeholder.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                placeholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                placeholder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                placeholder.widthAnchor.constraint(equalToConstant: 250),
                placeholder.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
}
