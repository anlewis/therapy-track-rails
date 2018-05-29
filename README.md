### Therapy Track

<CI HERE>
<COVERAGE HERE>
<TRACKING BOARD HERE>

TherapyTrack is an application for people with anxiety/depression that synthesizes user information in a single page report and remind users to schedule therapy appointments. This is the backend element of the application, responsible for creating JSON endpoints exposing the relevent user information.

#### Background

TherapyTrack has 2 main goals:

1. Provide appointment reminders for users so that they get to therapy
2. Generate a wellness report that will help them answer screening questions and more accurately reflect on their wellbeing over the last 2 weeks, 30 days, or 3 months

Anxiety disorders are the most common mental illness in the U.S., affecting 40 million adults in the United States, or 18.1% of the population every year. Anxiety disorders are often coupled with depressive disorders, such as major depressive disorder which affects about 6.7% of U.S. adults. However only 36.9% people affected by anxiety and 61.7% of those affected by depression receive treatment. The goal of this application is to allow users a way to synthesize information on their wellness and receive appointment reminders so that therapy appointments will be easier and less intimidating to attend. 

#### Getting Started

This project uses the Ruby on Rails framework, which can be installed from [here](http://installrails.com/).
[Bundler](http://bundler.io/) is used to install the gems needed for this application.

In order to run this appication in the development environment, perform the following in the CLI:

If you use rvm, the gemset is setup. From the project root directory, simply run:
```
rvm use .
gem install bundler
```
Then:
```
bundle install
rails db:create db:migrate db:seed
```

In order to spin-up the server, run: `rails s`

#### Contributing

Therapy track is integrated with the [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/2151386) project planning tool.
- If you choose to address a story on the board, open a new branch using the following naming convention: `STORY_ID-feature-name`.
- When creating commits, format as:

`git commit -m "Updated blah feature [(Finishes || Fixes || Delivers) #STORY_ID]"`.

This attaches the commit to the story's comment stream. If the commit address multiple stories, use sqaure brackets: `[#STORY_ID,#STORY_ID]`.

- When creating PRs, make sure to link the relevent story numbers, as layed out in the template.

#### Testing

[Rspec-Rails](https://github.com/rspec/rspec-rails) is used for testing.
[Factory_Bot](https://github.com/thoughtbot/factory_bot) is used to create test data.

In order to run tests, perform the following:

`rake db:test:prepare`

`rspec`

#### Linting

Linting is done by [Rubocop](http://rubocop.readthedocs.io/en/latest/).

From within the project folder, run `rubocop` to check files.

#### References

devise_token_auth setup by [Matt Hughes](http://matthughes.io/securing-a-rails-api-with-devise/)

OAuth 2.0 for Google setup through [Rich on Rails](https://richonrails.com/articles/google-authentication-in-ruby-on-rails/)

Google Calendar API setup following the guide [ReadySteadyCode](https://readysteadycode.com/howto-integrate-google-calendar-with-rails)

For stub_omniauth and testing [Jesse Spevack](http://www.jessespevack.com/blog/2016/10/16/how-to-test-drive-omniauth-google-oauth2-for-your-rails-app)

Advice on Psychology Assessments give by [Elena Kronmiller](https://www.linkedin.com/in/elena-kronmiller-a91679121/)
