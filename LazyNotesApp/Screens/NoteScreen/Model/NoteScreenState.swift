//
//  NoteScreenState.swift
//  LazyNotesApp
//
//  Created by Polina on 18.06.2022.
//

import Foundation

// MARK: - State Protocol
protocol State {
    func loadingState(view: NoteViewController)
}

class Review: State {
    func loadingState(view: NoteViewController) {
        view.noteText.isEditable = false
    }
}

class CreateNew: State {
    func loadingState(view: NoteViewController) {
        view.noteText.isEditable = true
        view.configureNavigationBar()
    }
}

class Edit: State {
    func loadingState(view: NoteViewController) {
        view.noteText.isEditable = true
        view.configureNavigationBar()
    }
}
