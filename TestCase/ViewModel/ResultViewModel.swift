//
//  ResultViewModel.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import Foundation

struct ResultViewModel {

    let model: ResultItem

    var artworkTitle: String {
        return model.title ?? ""
    }
}
