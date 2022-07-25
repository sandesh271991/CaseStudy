//
//  TestCaseApp.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import SwiftUI

@main
struct TestCaseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
