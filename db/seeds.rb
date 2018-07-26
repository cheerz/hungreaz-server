[
  User,
].each(&:destroy_all)

User.create! email: 'tom@cheerz.com', password: 'password', nickname: 'Tom'