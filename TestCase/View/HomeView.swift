//
//  ContentView.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import SwiftUI
import CoreData

struct HomeView: View {

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
                                             count: UIDevice.current.userInterfaceIdiom == .pad ? iPadCoulmns : iPhoneCoulmns)) {
                        ForEach(items) { item in
                            NavigationLink(destination: {
                                DetailView(data: item.title ?? "")
                            }, label: {
                                CollectionRowView(item: item)
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
