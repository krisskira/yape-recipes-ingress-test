//
//  RecipeView.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var router: RouterService
    var recipe: RecipeModel
    let CardWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Color.white
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage( url: URL(string: recipe.images[0]) ) { image in
                        image
                            .resizable()
                            .frame(width: CardWidth, height: 300)
                    }
                placeholder: {
                    Image("placeholder-image", bundle: .main)
                        .resizable()
                        .frame(width: CardWidth, height: 300)
                }
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.title)
                            .bold()
                            .padding(.vertical, 10)
                            .accessibilityIdentifier("recipe_view_title")
                        Text(recipe.description)
                            .font(.callout)
                            .bold()
                            .padding(.vertical, 10)
                        Text("Ingredientes:")
                            .font(.title3)
                            .bold()
                            .padding(.vertical, 4)
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text("∙ " + ingredient)
                                .font(.callout)
                        }
                        Spacer().frame(height: 40)
                        Button("Ir al origen de la receta", systemImage: "map") {
                            let location = RecipeMapLocationModel(
                                location: recipe.location,
                                name: recipe.name
                            )
                            router.goToRecipeLoactionMap(location: location)
                        }
                        .buttonStyle(.borderedProminent)
                        .accessibilityIdentifier("recipe_view_map_button")
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16)
                    .foregroundColor(.black)
                }
                .padding(.bottom, 16)
            }
        })
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeView(recipe: PreviewRecipesRequestData.recipes.first!)
}
