holiday = Survey.create!({
  title: 'Excitement Across Holidays',
  description: 'Asks participants how excited they feel for given holidays throughout the year'
})

chicken = Survey.create!({
  title: 'Chicken Survey',
  description: "Understanding people's wants and needs involving chickens"
})

c1 = chicken.questions.create!(body: "Do you like chickens?")

c1os = c1.question_options.create!([
  {body: "yes, lots"},
  {body: "oh hell no"},
  {body: "moderately"}
])

c2 = chicken.questions.create!(body: "Do you plan to own chickens?")

c2os = c2.question_options.create!([
  {body: "yes"},
  {body: "no"}
])

c3 = chicken.questions.create!(body: "Which types of chickens are you most interested in?")

c3os = c3.question_options.create!([
  {body: "white ones"},
  {body: "speckled ones"},
  {body: "crazy ones"},
  {body: "floofy ones"}
])

