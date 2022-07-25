//
//  TestCaseApp.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import SwiftUI

@main
struct TestCaseApp: App {
    let persistenceController = PersistenceManager.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
