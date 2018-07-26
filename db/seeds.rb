[
  User,
].each(&:destroy_all)

User.create! email: 'tom@cheerz.com', password: 'password', first_name: 'Thomas', last_name: 'Wiart'