//
//  ResponseDataModel.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import Foundation

// MARK: - Main Object
struct ResponseData: Codable, Hashable {
    let data: [ResultItem]?
}

// MARK: - Result Item
struct ResultItem: Codable, Hashable {
    var id: Double?
    var title: String?
}

#if DEBUG
// MARK: - Example Item
extension ResultItem {

    static var example: ResultItem {

        ResultItem(
            id: 13124,
            title: "TestData"
        )
    }
}
#endif
