//
//  MyContactsApp.swift
//  MyContacts
//
//  Created by Cristian David Laguna Aldana on 28/04/24.
//

import SwiftUI
import SwiftData

@main
struct MyContactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Contact.self)
        }
    }
}
