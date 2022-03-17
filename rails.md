# Rails Cheatsheets

```ruby
<tbody>
  <% @users.each do |user| %>
    <tr>
    <td><%= user.name %></td>
    <td><%= user.phone %></td>
    <td><%= link_to 'show', user %></td>
    <td><%= link_to 'edit', edit_user_path(user) %></td>
  <% end %>
<tbody>
```
## Symbols
```ruby
"text".object_id # string
:text.object_id # symbol to recicle object_id (better).
```
## Active Record
Search:
```zsh
a = User.find( 1)
b = User.where(id: 1)
```
```zsh
City.where("nome LIKE '%Blu%'" )
# City Load (0.7ms)  SELECT  "cities".* FROM "cities" WHERE (nome LIKE '%B%') LIMIT $1  [["LIMIT", 11]
=> #<ActiveRecord::Relation [#<City id: 2, nome: "Blumenau"........>]>
```
```zsh
Car.where(car_model_id: 1).count # or length
Car.where(car_model_id: [1, 2, 3])
Car.joins(:name)
Car.joins(:name).where("car_model.name = 'Mercedes'").limit(1).order("Car.name desc") # Criteria: INNER JOIN
```

## Filters
```ruby
before_action, after_action, around_action.
```
## Partials
Ex: _form.html.erb
```ruby
<% form_for(@user) do |f| %>
...
<% f.label :name %>
<% f.text_field :name %>
```
## Params
Ex: users_controller.rb
```ruby
before_action :set_user [:show, :edit, :update, :destroy]
...
private
  
def set_user
  @user = User.find(params[:id])
end
def user_params 
  params.require(:user).permit(:name, :birthday, :phone, :obs)
end
```
# Internationalization - i18n

## Gems

# Notes

## ENV manage links
'''erb
<%= link_to "name", (ENV[""] || "https://exemplelink.com"), target: "_blank" %>
'''

## Dependence structures
- select from form example:
```ruby
<% f.select(:company_id, User.all.map{|i| [i.name, i.id], class: form-control}) %>
```
- Erro form: usando array
```ruby
<% form_for([@car, @car_brand], html: {class: 'form', role: 'form'}) do |f| %>
```
- Controller, para pegar apenas a marca do carro atual. Vinculado o carro a todas as marcas:
```ruby
def index
  @car_brands = CarBrands.where(car_id: @car.id)
end
```
## obs
```ruby
users_path: get only path from da url
users_url: get all url
```


## inspect

- In controllers
```ruby

puts '================================================='
puts '================================================='
puts User.inspect
puts '================================================='
```



## ENV gerenciando links
```ruby
<%= link_to "nome", (ENV[""] || "https://exemplolink.com"), target: "_blank" %>
```
`target: "_blank"` se quiser que abra em nova aba.

- Lembrar de não fazer commit de database , GemFile e  gemlock

## Active Record
```zsh
Car.where(name like '%Mer%')
Car.where(car_model_id: 1).count # ou .length
Car.where(car_model_id: [1, 2, 3])

Car.joins(:name)
Car.joins(:name).where("car_model.name = 'Mercedes'").limit(1).order("Car.name desc") # Criteria: INNER JOIN

```
```ruby
puts '================================================='
puts User.inspect
puts '================================================='
```'
```

### Flash

```ruby
flash [:success] = "Text message" # [:success, :error, :notice.]
```

```ruby
<%= raw "<p>Hello<p>" %> # Assim como .html_safe
```





### Render

```ruby
<%= render "companies/ordenar", url_form: {controller: "companies", action: "index"} %>
```



### Gems

```json
gem 'bootstrap-datepicker-rails'
```

```js
<!-- Example js -->
<script type="text/javascript">
    //include date
    $('[data-behaviour~=datepicker]').datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR"
    });
</script>
```
