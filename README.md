# project_surveyor
Build it, take it, view it.

[A Ruby on Rails project from the Viking Code School which uses Active Record Associations, nested forms, collection forms, range fields, and PostgreSQL](https://www.vikingcodeschool.com)


Anne Richardson


## Warmup

1. What is the relationship between a survey and its questions?

A survey `has_many` questions. A question `belongs_to` a survey.

2. How might you create a survey and also create questions for it?

Nested forms where a survey `accepts_nested_attributes_for` questions.

3. What is the relationship between a multiple choice question and its options?

A question `has_many` options. An option `belongs_to` a question.

4. How do you create a multiple choice question and also create options for it?

Nested forms where a question `accepts_nested_attributes_for` options.

