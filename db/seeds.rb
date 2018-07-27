[
  User,
  Place,
  PlaceCategory,
  Tag,
].each(&:destroy_all)

[
  {email: 'mathieu.h@cheerz.com',   sexe: :male},
  {email: 'tom@cheerz.com',         sexe: :male},
  {email: 'raphaele@cheerz.com',    sexe: :female},
  {email: 'max@cheerz.com',         sexe: :male},
  {email: 'elif@cheerz.com',        sexe: :female},
  {email: 'juliette.c@cheerz.com',  sexe: :female},
  {email: 'theo@cheerz.com',        sexe: :male},
  {email: 'raphaele.dq@cheerz.com', sexe: :female},
  {email: 'robin@cheerz.com',       sexe: :female},
  {email: 'alexandre@cheerz.com',   sexe: :male},
  {email: 'charles@cheerz.com',     sexe: :male},
  {email: 'maxime@cheerz.com',      sexe: :male},
  {email: 'tristan@cheerz.com',     sexe: :male},
  {email: 'denis@cheerz.com',       sexe: :male},
  {email: 'david@cheerz.com',       sexe: :male},
  {email: 'mapy@cheerz.com',        sexe: :female},
  {email: 'julien@cheerz.com',      sexe: :male},
  {email: 'cyndie@cheerz.com',      sexe: :female},
  {email: 'alexandrew@cheerz.com',  sexe: :male},
].each do |user_attributes|
  User.create! user_attributes.merge(password: 'password')
end

PlaceCategory.create! tag: :food,   name: 'Food'
PlaceCategory.create! tag: :drinks, name: 'Drinks'

[
  {place_category_tag: :food,   name: 'OUR',                  address: '41 Rue de Londres',            lat: 48.877882, lng: 2.326238, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: 'AUGUSTIN',             address: '15 Place Richard Baret',       lat: 48.884066, lng: 2.321716, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: 'LE KIM',               address: '25 rue de Bruxelles',          lat: 48.882734, lng: 2.328305, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: 'GAVOTTES',             address: "39 Rue d'Amsterdam",           lat: 48.879032, lng: 2.326876, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: 'VITAMINE',             address: '20 Rue de Bucarest',           lat: 48.880651, lng: 2.325256, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: "POPOTE",               address: '62 rue de clichy',             lat: 48.881629, lng: 2.328477, user_email: 'tom@cheerz.com'},
  {place_category_tag: :food,   name: "DÉJEUNER SUR L'HERBE", address: '56 Bis Rue de Clichy',         lat: 48.881154, lng: 2.328780, user_email: 'tom@cheerz.com'},
  {place_category_tag: :food,   name: 'LUCKY LUCIANO',        address: '46 Rue des Dames',             lat: 48.884122, lng: 2.322676, user_email: 'tom@cheerz.com'},
  {place_category_tag: :drinks, name: 'LES CAVES POPULAIRES', address: '22 Rue des Dames',             lat: 48.884784, lng: 2.324687, user_email: 'raphaele@cheerz.com'},
  {place_category_tag: :food,   name: 'JAMES BUN',            address: '10 Boulevard des Batignolles', lat: 48.883553, lng: 2.326307, user_email: 'tom@cheerz.com'},
  {place_category_tag: :food,   name: 'LITTLE ITALY',         address: '5 Place de Clichy',            lat: 48.883610, lng: 2.326593, user_email: 'tom@cheerz.com'},
  {place_category_tag: :food,   name: 'LE FRENCH BURGER',     address: '16 Rue Lepic',                 lat: 48.884806, lng: 2.333853, user_email: 'maxime@cheerz.com'},
  {place_category_tag: :food,   name: 'Nausicaa',             address: '101 B rue du Mont Cenis',      lat: 48.880760, lng: 2.324332, user_email: 'mathieu@cheerz.com'},
  {place_category_tag: :food,   name: 'LOYAL',                address: "70 bis rue d'Amsterdam",       lat: 48.880742, lng: 2.327175, user_email: 'elif@cheerz.com'},
  {place_category_tag: :food,   name: 'YENO',                 address: '29 Boulevard de Clichy',       lat: 48.882609, lng: 2.335847, user_email: 'robin@cheerz.com'},
  {place_category_tag: :food,   name: 'I LOVE BO BUN',        address: '73 Rue de la Victoire',        lat: 48.882707, lng: 2.316307, user_email: 'robin@cheerz.com'},
  {place_category_tag: :drinks, name: 'LA RÉCOLTE',           address: '18 Boulevard des Batignolles', lat: 48.883370, lng: 2.325386, user_email: 'juliette.c@cheerz.com'},
  {place_category_tag: :drinks, name: 'CHEERZ',               address: '7 rue de bucarest',            lat: 48.880643, lng: 2.326289, user_email: 'raphaele@cheerz.com'},
  {place_category_tag: :food,   name: 'PECO-PECO',            address: '47 Rue Jean-Baptiste Pigalle', lat: 48.880246, lng: 2.334602, user_email: 'theo@cheerz.com'},
  {place_category_tag: :food,   name: 'TSUBAME',              address: '40 Rue de Douai',              lat: 48.883011, lng: 2.331900, user_email: 'raphaele@cheerz.com'},
  {place_category_tag: :food,   name: "MC DONALD'S",          address: '10 Place de Clichy',           lat: 48.883465, lng: 2.328319, user_email: 'tristan@cheerz.com'},
  {place_category_tag: :drinks, name: 'LES TANINS',           address: '18 Rue de Moscou',             lat: 48.880507, lng: 2.325413, user_email: 'raphaele.dq@cheerz.com'},
  {place_category_tag: :drinks, name: 'BRUSSEL BEER PROJECT', address: '1 Rue de Bruxelles',           lat: 48.883560, lng: 2.331974, user_email: 'david@cheerz.com'},
  {place_category_tag: :drinks, name: 'BAR À BULLES',         address: '4Bis Cité Véron',              lat: 48.884562, lng: 2.332218, user_email: 'mapy@cheerz.com'},
  {place_category_tag: :drinks, name: 'UN BISTROT EN VILLE',  address: '11 Rue de Moscou',             lat: 48.880373, lng: 2.325349, user_email: 'cyndie@cheerz.com'},
].each do |place_attributes|
  Place.create! place_attributes
end


tag_values = ['Fast food', 'Hangover', 'Take away', 'Asiatic', 'Cheap', 'French', 'Big portion', 'Terrasse', 'Salad', 'Healthy', 'Bio', 'On-site', 'Italian', 'Corporate', 'Drinks', 'Late lunch', 'World']
tag_values.each do |value|
  Tag.create tag: value.downcase.gsub(/\s/, '_'), name: value
end

{
  'OUR'                  => ['Fast food','Hangover','Take away'],
  'AUGUSTIN'             => ['Fast food','Hangover','Take away'],
  'LE KIM'               => ['Asiatic', 'Take away', 'Cheap'],
  'GAVOTTES'             => ['French', 'Hangover', 'Big portion', 'Cheap'],
  'VITAMINE'             => ['Cheap', 'Big portion', 'Take away', 'Terrasse'],
  'POPOTE'               => ['Salad', 'Healthy', 'Take away', 'Bio'],
  "DÉJEUNER SUR L'HERBE" => ['French', 'Healthy', 'Take away', 'On-site'],
  'LUCKY LUCIANO'        => ['Italian', 'Take away', 'On-site', 'Hangover', 'Corporate'],
  "LES CAVES POPULAIRES" => ['Cheap', 'Wine'],
  'JAMES BUN'            => ['Asiatic', 'Take away', 'Big portion'],
  "LITTLE ITALY"         => ['Italian', 'Take away', 'On-site', 'Hangover', 'Corporate', 'Terrasse'],
  "LE FRENCH BURGER"     => ['Hangover', 'Big portion', 'Fast food', 'Late lunch'],
  "Nausicaa"             => ['World', 'Take away'],
  "LOYAL"                => ['Healthy', 'Salad', 'On-site', 'Corporate'],
  "YENO"                 => ['Asiatic', 'Take away', 'Cheap'],
  "I LOVE BO BUN"        => ['Asiatic', 'Take away', 'Big portion'],
  "LA RÉCOLTE"           => ['Bio', 'Salad', 'Take away'],
  "CHEERZ"               => ['Drinks', 'Terrasse'],
  "PECO-PECO"            => ['Healthy', 'Asiatic', 'On-site'],
  "TSUBAME"              => ['Healthy', 'Asiatic', 'On-site'],
  "MC DONALD'S"          => ['Hangover', 'Fast food'],
  "LES TANINS"           => ['Beer', 'Wine'],
  "BRUSSEL BEER PROJECT" => ['Beer'],
  "BAR À BULLES"         => ['Terrasse', 'Wine', 'Cocktail', 'Chic'],
  "UN BISTROT EN VILLE"  => ['Beer', 'Terrasse', 'Wine'],
}.each do |place_name, tags|
  place = Place.find_by name: place_name
  place_tags = Tag.where(tag: tags)
  place.tags = place_tags
end
