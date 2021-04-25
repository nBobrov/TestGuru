# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestsUser.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

User.create!([{ name: 'admin', email: 'admin@gmail.com' },
              { name: 'nk', email: 'alexander.andreev@me.com' }])

categories = Category.create!([{ title: 'Ruby'},
                               { title: 'Rails'},
                               { title: 'SQL'}])

tests = Test.create!([{ title: 'Ruby Test 1', level: 1, category_id: categories[0].id, author_id: User.where(name: 'admin').first.id },
                      { title: 'Ruby Test 2', level: 1, category_id: categories[0].id, author_id: User.where(name: 'admin').first.id },
                      { title: 'Ruby Test 3', level: 3, category_id: categories[0].id, author_id: User.where(name: 'admin').first.id },
                      { title: 'Rails Test 1',  level: 2, category_id: categories[1].id, author_id: User.where(name: 'admin').first.id },
                      { title: 'SQL Test 1',  level: 2, category_id: categories[2].id, author_id: User.where(name: 'admin').first.id }])

questions = Question.create!([{ body: 'Question 1 for Ruby Test 1', test_id: tests[0].id },
                              { body: 'Question 2 for Ruby Test 1', test_id: tests[0].id },
                              { body: 'Question 1 for Ruby Test 2', test_id: tests[1].id },
                              { body: 'Question 1 for Ruby Test 3', test_id: tests[2].id },
                              { body: 'Question 1 for Rails Test 1', test_id: tests[3].id },
                              { body: 'Question 2 for Rails Test 1', test_id: tests[3].id },
                              { body: 'Question 1 for SQL Test 1', test_id: tests[4].id }])

Answer.create!([{ body: 'Answer 1 for Question 1 Ruby Test 1', question_id: questions[0].id },
                { body: 'Answer 1 for Question 2 Ruby Test 1', question_id: questions[1].id },
                { body: 'Answer 2 for Question 2 Ruby Test 1', question_id: questions[1].id },
                { body: 'Answer 3 for Question 2 Ruby Test 1', question_id: questions[1].id },
                { body: 'Answer 4 for Question 2 Ruby Test 1', question_id: questions[1].id },
                { body: 'Answer 3 for Question 2 Ruby Test 1', question_id: questions[2].id },
                { body: 'Answer 1 for Question 1 Rails Test 1', question_id: questions[4].id },
                { body: 'Answer 2 for Question 1 Rails Test 1', question_id: questions[4].id },
                { body: 'Answer 2 for Question 1 SQL Test 1', question_id: questions[5].id }])

TestsUser.create!([{ user_id: User.where(name: 'nk').first.id, test_id: tests[0].id, finished: true },
                   { user_id: User.where(name: 'nk').first.id, test_id: tests[1].id },
                   { user_id: User.where(name: 'nk').first.id, test_id: tests[2].id },
                   { user_id: User.where(name: 'nk').first.id, test_id: tests[3].id },
                   { user_id: User.where(name: 'nk').first.id, test_id: tests[4].id },
                   { user_id: User.where(name: 'admin').first.id, test_id: tests[1].id, finished: true }])

pp Test.get_tests_title_by_category('Ruby')
pp User.where(name: 'nk').first.find_tests_by_level(2)
pp Test.first.author.name