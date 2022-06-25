//
//  EditViewController.swift
//  LazyNotesApp
//
//  Created by Polina on 25.04.2022.
//

import UIKit
// MARK: - AddNoteDelegate Protocol
protocol AddNoteDelegete {
    func addNote(note: Note)
}

final class NoteViewController: UIViewController {
    var state: State?
    var delegate: AddNoteDelegete?
    
    var noteText: UITextView {
        let note = UITextView(frame: CGRect(x: 20, y: 120, width: 350, height: 680))
        note.font = .systemFont(ofSize: 18)
        let borderGray = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        note.layer.borderColor = borderGray.cgColor
        note.layer.borderWidth = 0.5
        note.layer.cornerRadius = 5
        note.delegate = self

        return note
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(noteText)
    }
    
    func loadingState(state: State) {
        state.loadingState(view: self)
    }
}

// MARK: - Configure Navigation Bar
extension NoteViewController {
    func configureNavigationBar() {
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed(sender:)))
        self.navigationItem.rightBarButtonItem = save
    }
    
    @objc func saveButtonPressed(sender: UIBarButtonItem) {
        guard let text = noteText.text else { return }
        print("text is \(text)")
        let note = Note(text: text)
        delegate?.addNote(note: note)
        navigationController?.popViewController(animated: true)
    }
}

extension NoteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
            loadingState(state: Edit())
    }
}
