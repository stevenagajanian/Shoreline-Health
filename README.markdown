![logo](/app/assets/images/ShorelineAltBig.png)

(PREVIOUSLY KOMODO)

Shoreline Health

#What is Shoreline?

Shoreline lets you easily catalog and share information about your health. 

* Store information in a secure, cloud server

* Discrete privacy controls for who sees which parts of your health record

* Easily update your family members or doctors about your health information

#Development Status

We are soon entering our next release: **version 0.2**

This phase will roll improvements to the user interface and many layouts. These updates are designed to minimize time required for entering data and streamline workflows. Also, significant functionality improvements have been made to the relationship system between users, allowing greater privacy control, building systems for public wikis and review of medications, and many more features. 

#Ways You Can Contribute

* Front-end Development
	* This includes all development concerned with design, user interface, and partially user experience. 
	* Ruby on Rails, the framework used to make Shoreline, by nature creates a lot of overlap between front-end and back-end development. This means there will always be a lot of communication between engineers and designers. 
	* Head over to the [Bootstrap docs](http://getbootstrap.com/) to learn more about our front-end CSS framework
* Back-end development
	* Ruby on Rails is the language and framework of Shoreline. Head over to [the official Ruby on Rails website](http://rubyonrails.org/) to get started. 
* Testing & Bug Squashing
	* PLEASE mark any issues in our GitHub issue tracker, or using the Feedback form found on the site. 
* Community Support

#Step-by-Step Setup

This is a simple installation document which gives you a basic idea who to get the project up and  running on your local machine

- Ruby installed
The latest version of Ruby (2.1 or newer)
You can find more information about Ruby here: http://rubyonrails.org/
	
- System dependencies
	Linux/UNIX, OS X, Windows
	You can find more information about how to install Ruby on different system here:
	https://www.ruby-lang.org/en/downloads/
	
- Rails and its dependencies
	With Ruby installed, you can install all of Rails and its dependencies through 
	RubyGems on the command line:
		
		gem install rails
		
	You can find more information about Rails here: http://rubyonrails.org/
	
- Download the project
	Clone the repo and run: 
	
		bundle install
	
	This installs the gem packages
	
- Database initialization
	 creates local testing SQL tables (SQLite), type in the following command:
		
		rake db:migrate
		
- Start rails server
	To run the rails server, type in the following command:
		
		rails server

	 Optionally, you can choose another port with:

		rails s -p 4000

	(this will run on port 4000)
	
- Run the app
	To run the Rails app, go to your browser and open: http://localhost:3000

#License

Shoreline is licensed under the GNU General Public License. For more information, read the license file in the Shoreline repository.

#Contributors

James Steininger
