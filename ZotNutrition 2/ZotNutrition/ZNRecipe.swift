//
//  ZNRecipe.swift
//  ZotNutrition
//
//  Created by Lawrence Byun on 5/19/23.
//

import SwiftUI

struct ZNRecipe: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                RecipeCategoryButton(title: "Protein", meals: [
                    Meal(name: "Chicken Stir-Fry", ingredients: ["Chicken", "Vegetables", "Soy Sauce"], recipe: "1. Cook chicken\n2. Stir-fry vegetables\n3. Add soy sauce"),
                    Meal(name: "Salmon Salad", ingredients: ["Salmon", "Lettuce", "Tomatoes"], recipe: "1. Grill salmon\n2. Toss with lettuce and tomatoes")
                ], color: .red)
                
                RecipeCategoryButton(title: "High Carb", meals: [
                    Meal(name: "Pasta Alfredo", ingredients: ["Pasta", "Cream", "Parmesan"], recipe: "1. Cook pasta\n2. Mix with cream and parmesan"),
                    Meal(name: "Vegetable Fried Rice", ingredients: ["Rice", "Vegetables", "Soy Sauce"], recipe: "1. Cook rice\n2. Stir-fry vegetables\n3. Add soy sauce")
                ], color: .orange)
                
                RecipeCategoryButton(title: "Low Carb", meals: [
                    Meal(name: "Grilled Chicken Salad", ingredients: ["Chicken", "Lettuce", "Cucumbers"], recipe: "1. Grill chicken\n2. Toss with lettuce and cucumbers"),
                    Meal(name: "Stuffed Bell Peppers", ingredients: ["Bell Peppers", "Ground Turkey", "Rice"], recipe: "1. Prepare stuffing\n2. Stuff bell peppers\n3. Bake in the oven")
                ], color: .yellow)
                
                RecipeCategoryButton(title: "Vegan", meals: [
                    Meal(name: "Quinoa Salad", ingredients: ["Quinoa", "Spinach", "Tomatoes"], recipe: "1. Cook quinoa\n2. Toss with spinach and tomatoes"),
                    Meal(name: "Black Bean Tacos", ingredients: ["Black Beans", "Tortillas", "Salsa"], recipe: "1. Warm tortillas\n2. Fill with black beans\n3. Top with salsa")
                ], color: .green)
            }
            .navigationBarTitle("Recipes")
        }
    }
}

struct RecipeCategoryButton: View {
    var title: String
    var meals: [Meal]
    var color: Color
    
    var body: some View {
        NavigationLink(destination: MealListView(meals: meals)) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct MealListView: View {
    var meals: [Meal]
    var body: some View {
        List {
            ForEach(meals) { meal in
                NavigationLink(destination: RecipeView(meal: meal)) {
                    Text(meal.name)
                }
            }
        }
        .navigationBarTitle("Meals")
    }
}

struct RecipeView: View {
    var meal: Meal
    
    var body: some View {
        VStack {
            Text("Ingredients:")
                .font(.title)
                .padding()
            
            VStack {
                ForEach(meal.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            Text("Recipe:")
                .font(.title)
                .padding()
            
            Text(meal.recipe)
        }
        .navigationBarTitle(meal.name)
    }
}


struct Meal: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var recipe: String
}

struct ZNRecipe_Previews: PreviewProvider {
    static var previews: some View {
        ZNRecipe()
    }
}

