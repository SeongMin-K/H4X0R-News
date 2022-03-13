//
//  ContentView.swift
//  H4X0R News
//
//  Created by SeongMinK on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManger = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManger.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManger.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
