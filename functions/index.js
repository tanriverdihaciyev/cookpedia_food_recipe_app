
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { getDatabase } = require("firebase-admin/database");
admin.initializeApp();

exports.addRecipeViewLenght = functions
    .firestore
    .document("recipeVisits/{recipeID}/visitors/{userID}")
    .onWrite((change, context) => {
        admin.firestore().collection("recipeVisits").doc(context.params.recipeID).collection("visitors").get().then((visitors) => {
            admin.firestore().collectionGroup("userRecipes").get().then((recipes) => {
                recipes.docs.forEach((recipe) => {
                    if (recipe.id == context.params.recipeID) {
                        recipe.ref.update({ "view": visitors.docs.length });
                    }
                });
            });
        });

    });
exports.addUserDetailViewLenght = functions
    .firestore
    .document("userVisits/{visitUserID}/visitors/{activeUserId}")
    .onWrite((change, context) => {
        admin.firestore().collection("userVisits").doc(context.params.visitUserID).collection("visitors").get().then((visitors) => {
            admin.firestore().collection("users").get().then((users) => {
                users.docs.forEach((user) => {
                    if (user.id == context.params.visitUserID) {
                        user.ref.update({ "view": visitors.docs.length });
                    }
                });
            });
        });

    });
