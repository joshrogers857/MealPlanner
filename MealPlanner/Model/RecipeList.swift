//
//  RecipeList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 11/03/2022.
//

import Foundation

struct RecipeList {
    static var recipes = [
        Recipe(
            name: "Breakfast Bars",
            preparationTime: 300.0,
            cookingTime: 2400.0,
            serves: 10,
            ingredients: [
                "3 tbsp vegetable oil",
                "2 bananas",
                "1 large egg, beaten",
                "70g light brown soft sugar",
                "250g nut muesli",
                "100g dried fruit mix"
            ],
            instructions: [
                "Preheat your oven to 180C/160C fan. Oil and line a 20cm deep tin with baking parchment",
                "Mash the bananas, then stir in the oil, egg, and sugar",
                "Fold in the muesli, 80% of the fruit mix and add a pinch of salt",
                "Bake for 40 minutes. Allow to cool, then turn out and cut into 10 bars"
            ]
        ),
        Recipe(
            name: "Shakshuka",
            preparationTime: 300.0,
            cookingTime: 1200.0,
            serves: 2,
            ingredients: [
                "1tbsp olive oil",
                "2 red onions, chopped",
                "1 red chilli, deseeded and finely chopped",
                "1 garlic clove, sliced",
                "1 small bunch of coriander, chopped",
                "2 cans of cherry tomatoes",
                "1 tsp caster sugar",
                "4 eggs"
            ],
            instructions: [
                "Heat the oil in a frying pan, with the lid on",
                "Soften the onions, chilli, garlic and coriander for 5 minutes",
                "Stir in the tomatoes and sugar, and simmer for 8-10 minutes",
                "Using the back of a large spoon, make 4 wells in the sauce. Crack an egg into each one. Put the lid back on the pan and cook on a low heat for 6-8 minutes",
                "Serve with a side of your choice"
            ]
        ),
        Recipe(
            name: "Breakfast Smoothie",
            preparationTime: 120.0,
            cookingTime: 0.0,
            serves: 2,
            ingredients: [
                "1 banana",
                "1 tbsp porridge oats",
                "80g soft fruit",
                "150ml milk",
                "1 tsp honey",
                "1 tsp vanilla extract"
            ],
            instructions: [
                "Put all ingredients into a blender and blend for 1 minute",
                "Pour into two glasses and serve"
            ]
        ),
        Recipe(
            name: "Pancakes",
            preparationTime: 60.0,
            cookingTime: 120.0,
            serves: 2,
            ingredients: [
                "1 small knob of butter",
                "1 banana",
                "1 egg",
                "1 heaped tbsp self-raising flour",
                "0.5 tsp baking powder"
            ],
            instructions: [
                "Melt the butter in a frying pan",
                "Add the banana, egg, flour and baking powder to a blender and blend for 20 seconds",
                "Pour three small circles of mixture into the pan. Cook for 1 minute, then flip and cook for 30 seconds. Repeat with the rest of the mixture",
                "Serve with toppings of your choice"
            ]
        ),
        Recipe(
            name: "Eggs Benedict",
            preparationTime: 300.0,
            cookingTime: 900.0,
            serves: 2,
            ingredients: [
                "3 tbsp white wine vinegar",
                "4 large eggs",
                "2 toasting muffins",
                "400ml hollandaise sauce",
                "4 slices parma ham"
            ],
            instructions: [
                "Bring a deep saucepan of water to the boil (minimum 2 litres). Add the white wine vinegar",
                "Swirl the water and crack an egg into the centre. Cook for 2-3 minutes, then remove and repeat with the other eggs",
                "Toast the muffins. Spread some sauce onto each, add a slice of ham, then an egg. Top with the remaining sauce"
            ]
        ),
        Recipe(
            name: "Red Pepper and Tomato Soup",
            preparationTime: 600.0,
            cookingTime: 1800.0,
            serves: 2,
            ingredients: [
                "400g tomatoes, halved",
                "1 red onion, quartered",
                "2 Romano peppers, roughly chopped",
                "2 tbsp olive oil",
                "2 garlic cloves, crushed",
                "A few thyme sprigs",
                "1 tbsp red wine vinegar"
            ],
            instructions: [
                "Preheat your oven to 200C/180C fan/gas 6. Put the tomatoes, onion and peppers in a roasting tin, toss with the oil and season. Add in the garlic and thyme sprigs, then roast for 25-30 minutes.",
                "Add the garlic cloves to the tin, strip the leaves off the thyme and add to the tin. Mix the vinegar into the tin then blend everything with a stick blender, adding water to loosen to your preferred consistency (we used around 150ml).",
                "Reheat the soup if necessary, then spoon into two bowls and top each with a drizzle of oil. Serve"
            ]
        ),
        Recipe(
            name: "Tuna Lettuce Wraps",
            preparationTime: 900.0,
            cookingTime: 120.0,
            serves: 2,
            ingredients: [
                "2 drops rapeseed oil, for brushing",
                "2 x 140g fresh tuna fillets",
                "1 ripe avocado",
                "0.5 tsp English mustard powder",
                "1 tsp cider vinegar",
                "1 tbsp capers",
                "8 romaine lettuce leaves",
                "16 cherry tomatoes, halved"
            ],
            instructions: [
                "Brush the tuna with a little oil. Heat a non-stick pan, add the tuna and cook for 1 min each side. Transfer to a plate to rest",
                "Halve and stone the avocado and scoop the flesh into a small bowl. Add the mustard powder and vinegar, then mash well until smooth. Stir in the capers. Spoon into two small dishes and put on serving plates with the lettuce leaves, and tomatoes.",
                "Slice the tuna and arrange on the plates. Spoon some of the mixture on the lettuce leaves and top with tuna and cherry tomatoes and a few extra capers. Roll up and serve"
            ]
        ),
        Recipe(
            name: "Chicken Salad",
            preparationTime: 600.0,
            cookingTime: 600.0,
            serves: 2,
            ingredients: [
                "1 boneless, skinless chicken breast",
                "1 tbsp fish sauce",
                "1 tbsp lime juice",
                "Lime zest",
                "1 tsp caster sugar",
                "100g bag mixed salad leaves",
                "A large handful of coriander, chopped",
                "0.25 red onion, thinly sliced",
                "0.5 chilli, deseeded and thinly sliced",
                "0.25 cucumber, halved lengthways, sliced"
            ],
            instructions: [
                "Cover the chicken with cold water, bring to the boil, then cook for 10 mins. Remove from the pan and shred",
                "Stir together the fish sauce, lime zest, juice and sugar until sugar dissolves",
                "Place the leaves and coriander in a container, then top with the chicken, onion, chilli and cucumber. Toss the dressing through the salad and serve"
            ]
        ),
        Recipe(
            name: "Chicken Noodles",
            preparationTime: 600.0,
            cookingTime: 0.0,
            serves: 2,
            ingredients: [
                "1 tbsp tahini",
                "1 lime, juiced",
                "2 tsp soy sauce",
                "2 garlic cloves, roasted",
                "1 tsp sesame oil",
                "0.5 tsp chilli flakes",
                "200g cooked rice noodles",
                "200g cooked chicken",
                "1 roasted aubergine",
                "1 carrot, grated",
                "0.5 cucumber, seeds removed and cut into half moons",
                "0.5 small pack mint, roughly chopped"
            ],
            instructions: [
                "Whisk together the tahini, lime juice, soy sauce, flesh from the roasted garlic, sesame oil and chilli flakes in a large bowl, adding water until creamy",
                "Add the noodles, leftover roast chicken, aubergine and carrot and toss everything to combine, then fold in the cucumber and mint. Add to two bowls, and serve"
            ]
        ),
        Recipe(
            name: "Chicken with Butter Beans",
            preparationTime: 300.0,
            cookingTime: 0.0,
            serves: 2,
            ingredients: [
                "2 roasted garlic clove",
                "1.5 tbsp olive oil",
                "0.5 lemon, zested and juiced",
                "0.5 tsp smoked paprika",
                "400g can of butter beans, drained and rinsed",
                "2 roasted peppers, sliced",
                "150g cherry tomatoes, halved",
                "100g rocket",
                "150g cooked chicken",
                "25g feta"
            ],
            instructions: [
                "Squeeze the garlic out of the skins and whisk together with the oil, lemon zest, juice, smoked paprika and seasoning in a bowl. Add the butter beans, peppers, tomatoes and rocket, and mix",
                "Divide between two bowls. Top with the chicken and crumble over the feta"
            ]
        ),
        Recipe(
            name: "Slow Cooker Chicken Casserole",
            preparationTime: 600.0,
            cookingTime: 21600.0,
            serves: 4,
            ingredients: [
                "1 knob of butter",
                "0.5 tbsp olive oil",
                "1 large onion, finely chopped",
                "1.5 tbsp flour",
                "650g boneless, skinless chicken thighs",
                "3 garlic cloves, crushed",
                "400g baby new potatoes, halved",
                "2 sticks celery, diced",
                "2 carrots, diced",
                "500ml stock made with 2 low salt chicken stock cubes",
                "2 tsp Dijon mustard",
                "2 bay leaves"
            ],
            instructions: [
                "Heat a knob of butter and 0.5 tbsp olive oil in a large frying pan, cook 1 finely chopped large onion for 8-10 mins until softened",
                "Meanwhile, put 1.5 tbsp flour and a pinch of salt and pepper in a bowl and toss 650g boneless, skinless chicken thighs in it",
                "Add 3 crushed garlic cloves and the chicken to the pan and cook for 4-5 mins more",
                "Transfer to your slow cooker, along with 400g halved baby new potatoes, 2 diced celery sticks, 2 diced carrots, 500ml chicken stock, 2 tsp Dijon mustard and 2 bay leaves",
                "Give it a good stir. Cook on Low for 7 hours or High for 4 hours",
                "Remove the bay leaves and serve with a little Dijon mustard on the side"
            ]
        ),
        Recipe(
            name: "Chicken and Bean Enchiladas",
            preparationTime: 600.0,
            cookingTime: 1800.0,
            serves: 4,
            ingredients: [
                "1 tbsp vegetable oil",
                "1 red onion, chopped",
                "1 garlic clove, crushed",
                "1 tbsp fajita seasoning",
                "2 x 395g cans kidney beans in chilli sauce",
                "2 roast chicken legs, meat shredded off the bone",
                "195g can sweetcorn, drained",
                "8 flour tortillas",
                "140g hard cheese, grated"
            ],
            instructions: [
                "Preheat oven to 180C/160C fan/gas 4. Heat the oil in a frying pan and cook the onion and garlic for 5 mins",
                "Stir in the fajita seasoning and cook for 1 min more before adding the kidney beans, shredded chicken and sweetcorn",
                "Divide the mixture between the tortillas, sprinkle over half the cheese, then roll up and place into a baking dish",
                "Sprinkle over the remaining cheese, then bake for 20-25 mins"
            ]
        ),
        Recipe(
            name: "Fish Pie",
            preparationTime: 900.0,
            cookingTime: 2700.0,
            serves: 4,
            ingredients: [
                "1kg Maris Piper potatoes, peeled and halved",
                "400ml milk",
                "25g butter",
                "25g plain flour",
                "4 spring onions, finely sliced",
                "400g pack fish pie mix",
                "1 tsp Dijon or English mustard",
                "A small bunch chives, finely snipped",
                "A handful frozen sweetcorn",
                "A handful frozen petits pois",
                "A handful grated cheddar",
            ],
            instructions: [
                "Preheat the oven to 200C/fan 180C",
                "Put 1kg potatoes, peeled and halved, in a saucepan and pour over enough water to cover. Bring to the boil and then simmer until tender",
                "Drain thoroughly and mash with a splash of milk and a knob of butter. Season with a pinch of black pepper",
                "Put 25g butter, 25g plain flour and 4 finely sliced spring onions in another pan and heat gently until the butter has melted, stirring regularly. Cook for 1-2 mins",
                "Gradually whisk in 400ml milk using a balloon whisk. Bring to the boil, stirring regularly. Cook for 3-4 minutes",
                "Take off the heat and stir in 320g-400g mixed fish, 1 tsp Dijon or English mustard, a small bunch of finely snipped chives, handful of sweetcorn and handful of petits pois. Spoon into an ovenproof dish",
                "Spoon the potato on top and sprinkle with a handful of grated cheddar cheese",
                "Cook for 20-25 minutes. Allow to cool, then serve"
            ]
        ),
        Recipe(
            name: "Lasagne",
            preparationTime: 900.0,
            cookingTime: 3600.0,
            serves: 4,
            ingredients: [
                "1 tbsp olive oil",
                "2 rashers smoked streaky bacon",
                "1 onion, finely chopped",
                "1 celery stick, finely chopped",
                "1 medium carrot, grated",
                "2 garlic cloves, finely chopped",
                "500g beef mince",
                "1 tbsp tomato purée",
                "2 x 400g cans chopped tomatoes",
                "1 tbsp clear honey",
                "500g pack lasagne sheets",
                "400ml crème fraîche",
                "125g ball mozzarella, torn",
                "50g grated parmesan"
            ],
            instructions: [
                "Heat the oil in a large saucepan. Cut the bacon into small pieces. Add the bacon to the pan and cook for just until it begins to turn golden. Add the onion, celery and carrot, and cook over a medium heat for 5 minutes until softened",
                "Add the garlic and cook for 1 minute, then add the mince and cook for 6 mins until browned",
                "Stir in the tomato purée and cook for 1 min, mixing with the beef and vegetables. Add the chopped tomatoes. Fill each can half full with water to rinse out any tomatoes left in the can, and add to the pan. Add the honey and season to taste. Simmer for 20 mins",
                "Preheat oven to 200C/180C fan. To assemble the lasagne, ladle a little of the sauce into the bottom of the roasting tin, spreading it. Place 2 sheets of lasagne on top of the sauce overlapping, then repeat with more sauce and another layer of pasta. Repeat with a further 2 layers of sauce and pasta, finishing with a layer of pasta",
                "Put the crème fraîche in a bowl and mix with 2 tbsp water to loosen it. Pour over the top of the pasta, then top with the mozzarella. Sprinkle Parmesan over the top and bake for 25–30 minutes. Allow to cool and serve"
            ]
        ),
        Recipe(
            name: "Chicken and Sweet Potato Curry",
            preparationTime: 600.0,
            cookingTime: 2700.0,
            serves: 4,
            ingredients: [
                "1 tbsp sunflower oil",
                "1 onion, chopped",
                "450g boneless, skinless chicken thigh, cut into bite-sized pieces",
                "165g jar korma paste",
                "2 garlic cloves, crushed",
                "500g sweet potato, cut into small chunks",
                "400g can chopped tomato",
                "100g baby spinach",
                "basmati rice, to serve"
            ],
            instructions: [
                "Heat the oil in a pan, add the onion and cook over a low heat for about 5 minutes until softened. Increase the heat, add the chicken pieces and brown",
                "Stir in the curry paste and garlic, cooking for 2 minutes. Add 100ml water, the sweet potatoes and chopped tomatoes. Simmer for 20-30 mins until the chicken is cooked through and the sweet potato is tender",
                "Season to taste and add the spinach, removing the pan from the heat and stirring until the spinach has wilted. Serve with basmati rice"
            ]
        )
    ]
}
