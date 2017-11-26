<app-viewrecipe>
  <div class="ui container">
    <h2>Recipes</h2>
    <div class="ui divider"></div>
    <div class="ui middle aligned center aligned grid">
      <div class="ui grid">
        <div each="{ key,data in recipeData }" class="ui segment">
          <div class="{ key }">
            <a class="ui orange basic button " onclick="{ onlyrecipe.bind(key, data) }">
              <h4 if="{ +data.recipeName.length < 11 }">{ data.recipeName }</h4>
              <h4 if="{ +data.recipeName.length > 10 }">{ data.recipeName.substr(0, 10) } ...</h4>
              <div class="comment" if="{ +data.recipeComment.length < 11}">
                <i>{ data.recipeComment }</i>
              </div>
              <div class="comment" if="{ +data.recipeComment.length > 10}">
                <i>{ data.recipeComment.substr(0, 10) } ...</i>
              </div>
              <div class="ui divider"></div>
              <div class="creator">
                <i class="ui right aligned">Creator ... { data.creator }</i>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="flowChart"></div>


  <script>
    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        this.recipeData = recipe.val();
        this.update();
        console.log(this.recipeData);
      }else{
      }
    });

    this.onlyrecipe = (data, click) => { //何故か上と逆になる
      console.log(click.item.key);
      console.log(data);
      route('/viewrecipe/#' + click.item.key);
      riot.mount('#content', 'app-only', { key : click.item.key, data : data });
    };

  </script>
  <style>
  </style>
</app-viewrecipe>