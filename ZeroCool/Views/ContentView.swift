//
//  ContentView.swift
//  ZeroCool
//
//  Created by Giorgi Samkharadze on 11.10.22.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            
            .navigationTitle("ZeroCool")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [ Post(id: "1", title: "gamarjoba"),Post(id: "2", title: "hell no"),Post(id: "3", title: "zdrast")]
