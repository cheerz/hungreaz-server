[
  User,
  Place,
].each(&:destroy_all)

User.create! email: 'tom@cheerz.com', password: 'password', nickname: 'Tom'

Place.create! name: 'Cheerz Palace',    lat: 48.88060188, lng: 2.32590994
Place.create! name: 'Pôle emploi',      lat: 48.876708,   lng: 2.327097
Place.create! name: 'Pharmacie Jémal',  lat: 48.881340,   lng: 2.327168
Place.create! name: 'Bim Bim Bap',      lat: 48.880249,   lng: 2.325751
Place.create! name: 'Stade de France',  lat: 48.881250,   lng: 2.327746
Place.create! name: 'Métro 46',         lat: 48.879755,   lng: 2.329247
Place.create! name: "Oulala c'est bon", lat: 48.882027,   lng: 2.328218