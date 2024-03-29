//
//  RecipeTabView.swift
//  RecipeListEnhanced
//
//  Created by 王柏凱 on 2021-11-26.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }.environmentObject(RecipeModel()) // TabView
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
