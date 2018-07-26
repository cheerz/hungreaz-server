[
  User,
  Place,
  PlaceCategory,
].each(&:destroy_all)

User.create! email: 'tom@cheerz.com', password: 'password', nickname: 'Tom'


food_category   = PlaceCategory.create!(tag: :food,   name: 'Food')
drinks_category = PlaceCategory.create!(tag: :drinks, name: 'Drinks')

Place.create! name: 'Cheerz Palace',    lat: 48.88060188, lng: 2.32590994, place_category: food_category
Place.create! name: 'Pôle emploi',      lat: 48.876708,   lng: 2.327097,   place_category: drinks_category
Place.create! name: 'Pharmacie Jémal',  lat: 48.881340,   lng: 2.327168,   place_category: drinks_category
Place.create! name: 'Bim Bim Bap',      lat: 48.880249,   lng: 2.325751,   place_category: food_category
Place.create! name: 'Stade de France',  lat: 48.881250,   lng: 2.327746,   place_category: food_category
Place.create! name: 'Métro 46',         lat: 48.879755,   lng: 2.329247,   place_category: drinks_category
Place.create! name: "Oulala c'est bon", lat: 48.882027,   lng: 2.328218,   place_category: food_category

tag_values = ['Fast food', 'Hangover', 'Take away', 'Asiatic', 'Cheap', 'French', 'Big portion', 'Terrasse', 'Salad', 'Healthy', 'Bio', 'On-site', 'Italian', 'Corporate', 'Drinks', 'Late lunch', 'World']
tag_values.each do |value|
  Tag.create tag: value.downcase.gsub(/\s/, '_'), name: value
end