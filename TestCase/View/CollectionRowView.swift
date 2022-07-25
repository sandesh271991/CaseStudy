//
//  CollectionRowView.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import Foundation
import SwiftUI

struct CollectionRowView: View {

  //  @ObservedObject var item: Item
    let resultVM: ResultViewModel

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 1).fill(.yellow)
                .frame(maxWidth: .infinity).aspectRatio(1, contentMode: .fit)
                .overlay(Text(resultVM.artworkTitle ?? ""))
        }.padding(.all, 2)
            .background(Color.red)
    }
}
