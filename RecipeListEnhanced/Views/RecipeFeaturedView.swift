//
//  RecipeiFeaturedView.swift
//  RecipeListEnhanced
//
//  Created by 王柏凱 on 2021-11-29.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                    } // VStack
                                } // ZStack
                            })
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                    RecipeDetailView(recipe: model.recipes[index])
                                })
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    } // GeometryReader
                    
                } // TabView
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } // VStack
        
            VStack(alignment:.leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.bottom, .leading])
        }
        .onAppear {
            setFeaturedIndex()
        }
        
        
    }
    
    func setFeaturedIndex() {
        
        tabSelectionIndex = model.recipes.firstIndex { r in
            return r.featured
        } ?? 0
    }
}

struct RecipeiFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
