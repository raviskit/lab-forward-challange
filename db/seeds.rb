# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DataInput.create(input: [1, 2, 1, 0, 1, 2, 1, 8, 9, 8, 1, 2, 0, 2, 1, 2, 3, 1, 2, 0, 8, 9, 2, 0, 3, 0,
                        2, 1, 2, 3, 8, 10, 2, 1, 2, 3, 0, 1, 2, 1, 2, 7, 6, 9, 1, 2, 0, 1, 2, 1], threshold: 3).save
DataInput.create(input: [0, 2, 1, 2, 3, 10, 12, 1, 1, 2, 3, 0, 1, 2, 1, 2, 7, 6, 9, 1, 2, 0, 1, 2, 1,
                        3, 0, 2, 3, 1, 1, 2, 3, 10, 9, 12, 0, 2, 3, 1, 2, 0, 1, 7, 11, 0, 1, 2 ], threshold: 3).save
DataInput.create(input: [2, 1, 3, 0, 2, 2, 9, 7, 2, 3, 1, 2, 9, 8, 2, 3, 1, 2, 0, 1, 2, 3, 0, 10, 9,
                        1, 2, 1, 0, 1, 2, 1, 8, 9, 8, 1, 2, 0, 2, 1, 2, 1, 14, 10, 0, 1, 1, 2, 0, 3], threshold: 3).save