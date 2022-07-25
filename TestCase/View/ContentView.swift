//
//  ContentView.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.title, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @StateObject var viewModel = HomeViewModel()


    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()),
                                             count: UIDevice.current.userInterfaceIdiom == .pad ? 8 : 4)) {

                        ForEach(items) { item in
                            NavigationLink(destination: {
                                DetailView(data: item.title ?? "")
                            }, label: {
                                SearchResultRow(item: item)
                            })
                        }
                    }
                }.padding([.horizontal], 5)
            }
            .onAppear(perform: {
                viewModel.getData()
            })
        }
    }
}

struct SearchResultRow: View {

    @ObservedObject var item: Item

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 1).fill(.yellow)
                .frame(maxWidth: .infinity).aspectRatio(1, contentMode: .fit)
                .overlay(Text(item.title ?? ""))
        }.padding(.all, 2)
            .background(Color.red)
    }
}

