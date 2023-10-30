//
//  HomeRecipeCellView.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import SwiftUI

struct HomeRecipeCellView: View {
    let recipe: RecipeModel
    let onPress: ((_ recipe: RecipeModel) -> Void)?
    let CardWidth: CGFloat = UIScreen.main.bounds.width - 32
    init(recipe: RecipeModel, onPress: ( (_: RecipeModel) -> Void)? = nil) {
        self.recipe = recipe
        self.onPress = onPress
    }
    var body: some View {
        Button (action: {
            onPress?(recipe)
        }) {
            ZStack {
                Color.white
                VStack(alignment:.leading) {
                    AsyncImage(url: URL(string: recipe.images[0]) )
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: CardWidth, height: 300)
                    } placeholder: {
                        Image("placeholder-image", bundle: .main)
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: CardWidth, height: 300)
                    }
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .bold()
                            .font(.title)
                        Spacer().frame(height: 16)
                        Text(recipe.description)
                            .font(.callout)
                    }
                    .padding(16)
                }
                .frame(width: CardWidth)
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
        }
        .foregroundColor(.black)
        .buttonStyle(.plain)
        .accessibilityIdentifier("recipe_list_item")
    }
}

#Preview("Recipe List Item", traits: .sizeThatFitsLayout) {
    HomeRecipeCellView(
        recipe: PreviewRecipesRequestData.recipes.first!
    )
}
