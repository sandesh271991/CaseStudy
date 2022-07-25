//
//  HomeViewModel.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import Foundation
import CoreData
import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var results = [ResultItem]()
    @Published var coreDM: PersistenceController = PersistenceController()

    func getData() {
        guard let gUrl = URL(
            string: "https://api.artic.edu/api/v1/artworks"
        ) else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode(ResponseData.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.results = response.data ?? []
                    self?.coreDM.deleteOldResult()
                    self?.results.forEach{
                        self?.coreDM.saveResult(title: $0.title ?? "")
                    }
                }
            } catch {
                print("*** ERROR ***")
            }
        }
    }
}
