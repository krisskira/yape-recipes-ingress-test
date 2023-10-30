//
//  MockRecipesRequestResponse.swift
//  Yape RecipesTests
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation
@testable import Yape_Recipes

import Foundation

let MockRecipesRequestResponse: RecipeRequestModel = RecipeRequestModel(
    page: 1,
    per_page: 1,
    total_recipes: 2,
    recipes: [
        RecipeModel(
            id: 0,
            name: "Sudado de pollo y papa",
            ingredients: [
                "1 cucharada de aceite vegetal (14 g)",
                "1 diente de ajo triturado (3 g)",
                "1 tomate sin piel finamente picado (123 g)",
                "2 tallos de cebolla larga finamente picada (30 g)",
                "4 piernas de pollo (800 g)",
                "1 taza de agua (250 ml)",
                "1 libra de papa pastusa, pelada y partida a la mitad (500 g)",
                "1 sobre de CALDO DE GALLINA MAGGI® desmenuzado (9 g)"
            ],
            images: [
                "https://www.mycolombiancocina.com/images/mains/pollo_sudado.jpg",
                "https://www.momentosfriko.com/Portals/MomentosFriko/2022/Recetas/Sudado%20de%20Pollo/Banne-principal.jpg?ver=2022-09-22-074944-000"
            ],
            location: LocationModel(lat: 3.43722, lng: -76.5225),
            description: "El sudado de pollo colombiano o pollo sudado con papas es una preparación cotidiana en Colombia. En cada hogar de este país hay una versión más o menos parecida, motivo por el cual forma parte de la memoria gastronómica de todos los colombianos. Aunque parece tener muchos ingredientes, realmente es bastante fácil de hacer, otra ventaja de esta deliciosa receta. Básicamente, se trata de un plato de pollo con hortalizas y condimentos que todos tenemos en nuestras cocinas regularmente."),
        RecipeModel(
            id: 1,
            name: "Sushi",
            ingredients: [
                "Arroz",
                "Pescado fresco",
                "Alga nori",
                "Vinagre de arroz",
                "Sésamo"
            ],
            images: [
                "https://www.paulinacocina.net/wp-content/uploads/2023/07/maki-comida.jpg",
                "https://i.blogs.es/602b31/como-hacer-sushi-empanizado/1366_2000.png"
            ],
            location: LocationModel(
                lat: 35.682839,
                lng: 139.759455
            ),
            description: "Sushi es un plato típico de origen japonés basado en arroz aderezado con vinagre de arroz, azúcar y sal y combinado con otros ingredientes como pescados crudos, mariscos, verduras, etc.​​​ Este plato es uno de los más reconocidos de la gastronomía japonesa y uno de los más populares internacionalmente."
        ),
        RecipeModel(
            id: 2,
            name: "Spaghetti Carbonara",
            ingredients: [
                "Spaghetti",
                "Huevos",
                "Queso parmesano",
                "Panceta",
                "Pimienta negra"
            ],
            images: [
                "https://www.allrecipes.com/thmb/Vg2cRidr2zcYhWGvPD8M18xM_WY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/11973-spaghetti-carbonara-ii-DDMFS-4x3-6edea51e421e4457ac0c3269f3be5157.jpg",
                "https://assets.bonappetit.com/photos/5a6f48f94f860a026c60fd71/1:1/w_5111,h_5111,c_limit/pasta-carbonara.jpg"
            ],
            location: LocationModel(lat: 41.9028, lng: 12.4964),
            description: "Carbonara es un plato de pasta italiano originario del Lacio, y más concretamente de Roma. La receta original se basa en yemas de huevos, queso, guanciale y pimienta negra. Los espaguetis son la pasta generalmente utilizada; sin embargo, también se puede utilizar rigatoni o bucatini."
        ),
        RecipeModel(
            id: 3,
            name: "Tacos",
            ingredients: [
                "Tortillas de maíz",
                "Carne asada",
                "Cebolla",
                "Cilantro",
                "Salsa"
            ],
            images: [
                "https://www.pequerecetas.com/wp-content/uploads/2020/10/tacos-mexicanos.jpg",
                "https://www.elespectador.com/resizer/mhjKGPoxEw3KwuxTLH2wyFlaaZE=/arc-anglerfish-arc2-prod-elespectador/public/LQGRLP3KGFAR5JVP45JSXETKLQ.jpg"
            ],
            location: LocationModel(lat: 19.4326, lng: -99.1332),
            description: "El taco es una preparación culinaria muy popular de México que consiste en una tortilla, generalmente de maíz, que comúnmente se enrolla para contener dentro diversos ingredientes y algún tipo de salsa y verdura."
        ),
        RecipeModel(
            id: 4,
            name: "Moussaka",
            ingredients: [
                "Berenjenas",
                "Carne molida",
                "Salsa de tomate",
                "Bechamel",
                "Queso feta"
            ],
            images: [
                "https://www.dontgobaconmyheart.co.uk/wp-content/uploads/2021/04/best-moussaka-recipe.jpg",
                "https://www.allrecipes.com/thmb/X0hHxXjqGAjwNt5aDT74QIcB0Kc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/19644-moussaka-DDMFS-4x3-066ed4bc6ee14583a81e276020bb4ea7.jpg"
            ],
            location: LocationModel(lat: 37.9838, lng: 23.7275 ),
            description: "La musaka o musaca ​​ es un plato tradicional de los Balcanes y el Medio Oriente hecho a base de berenjena. La versión griega, que es la más conocida internacionalmente, consiste de capas de carne picada de cordero, berenjena en rebanadas, y tomate, cubierto de una salsa bechamel y horneado."
        ),
        
    ]
)
