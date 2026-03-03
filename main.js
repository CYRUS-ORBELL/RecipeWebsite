const express = require("express");
const app = express();
const port = 3000;
var connection = require('./db/connection').databaseConnection;

app.use(express.static('public'))
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));




app.get('/', (req, res) => { 
	res.render('home')
});

app.get('/recipes',(req,res)=>{
	 const sql = `
        SELECT id, title, category
        FROM recipes
        ORDER BY category, title
    `;
	connection.query(sql,(err,results)=>{
		if(err){
			console.err(err);
			return res.status(500).send("Database error");
		}

		const groupedRecipes = {
			Beef: [],
			Chicken: [],
			Beans: [],
			Other: []
		};
		results.forEach(recipe => {
			const category = recipe.category;

            if (category === 'Beef') {
                groupedRecipes.Beef.push(recipe);
            } else if (category === 'Chicken') {
                groupedRecipes.Chicken.push(recipe);
            } else if (category === 'Beans') {
                groupedRecipes.Beans.push(recipe);
            } else {
                groupedRecipes.Other.push(recipe);
            }
		});
		res.render('recipes', { groupedRecipes });
	});

})


app.get('/recipe/:id', (req,res)=> {
	const recipeId = req.params.id;

	const sql = `
        SELECT 
            r.id,
            r.title,
            r.category,
            r.instructions,
            i.name AS ingredient_name,
			i.fact AS ingredient_fact,
            ri.quantity
        FROM recipes r
        LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
        LEFT JOIN ingredients i ON i.id = ri.ingredient_id
        WHERE r.id = ?
    `;

	connection.query(sql, [recipeId], (err, results)=> {
		if(err){
			console.error(err);
			return res.status(500).send("database error");
		}

		if(results.length == 0){
			return res.status(404).send("Recipe not found");

		}


		const recipe = {
            id: results[0].id,
            title: results[0].title,
            category: results[0].category,
            instructions: results[0].instructions,
            ingredients: []
        };

        
        results.forEach(row => {
            if (row.ingredient_name) {
                recipe.ingredients.push({
                    name: row.ingredient_name,
                    quantity: row.quantity,
					fact: row.ingredient_fact
                });
            }
        });

		res.render('recipe', {recipe});
	});

})







app.get('/AddRecipes', (req, res) => {
    const sql = `SELECT id, name, fact FROM ingredients ORDER BY name`;
    connection.query(sql, (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Database error');
        }
        res.render('addrecipes', { ingredients: results });
    });
});

app.post('/recipes', (req, res) => {

    const { title, category, instructions } = req.body;
    let ingredientIds = req.body.ingredient_id || [];
    let quantities = req.body.quantity || [];

    if (!Array.isArray(ingredientIds)) ingredientIds = [ingredientIds];
    if (!Array.isArray(quantities)) quantities = [quantities];

    const recipeSql = `
        INSERT INTO recipes (title, category, instructions)
        VALUES (?, ?, ?)
    `;

    connection.query(recipeSql, [title, category, instructions], (err, recipeResult) => {

        if (err) {
            console.error(err);
            return res.status(500).send("Recipe insert error");
        }

        const recipeId = recipeResult.insertId;

        ingredientIds.forEach((id, i) => {
            const ingId = parseInt(id);
            const qty = (quantities[i] || '').toString().trim();
            if (!ingId) return;
            linkIngredient(recipeId, ingId, qty);
        });

        res.redirect(`/recipe/${recipeId}`);
    });

    function linkIngredient(recipeId, ingredientId, quantity) {
        const linkSql = `
            INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity)
            VALUES (?, ?, ?)
        `;
        connection.query(linkSql, [recipeId, ingredientId, quantity]);
    }

});


app.listen(port, function () {
  console.log(`Example app listening on port ${port}!`);
});
