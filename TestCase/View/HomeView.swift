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
    @StateObject var networkManager = NetworkManager()

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
                                let viewModel = ResultItem(id: nil, title: item.title)
                                CollectionRowView(resultVM: ResultViewModel(model: viewModel))
                            })
                        }
                    }
                }.padding([.horizontal], 5)
            }
            .onAppear(perform: {
                networkManager.getData()
            })
        }
    }
}
