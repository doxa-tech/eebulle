namespace :init do

	desc "Setup the environment"
  task :all => [:pages, :days, :recurrences, :user]

	desc "Create the pages"
	task pages: :environment do
		lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nulla nisl, eleifend scelerisque porta non, volutpat quis elit. Nullam ornare, sapien et adipiscing sagittis, nunc felis posuere justo, fermentum lobortis dui massa nec lorem. Mauris sollicitudin nisl vel dapibus vehicula. Etiam sagittis, tortor sed tristique tincidunt, leo ante eleifend purus, ut gravida eros justo blandit enim. Nunc id urna a diam dictum dignissim. Fusce dictum lectus vel eros tempus porta. Etiam ac tortor vulputate, volutpat magna quis, semper velit. Nunc vel ligula nunc. Ut vitae commodo nulla, nec adipiscing tortor. Morbi ullamcorper diam euismod lacus imperdiet, eget aliquam erat viverra. In hac habitasse platea dictumst."
		%w[home presentation contact kidsbulle vision financement network].each do |page|
			Page.create(name: page, content: lorem) if Page.find_by_name(page).nil?
		end
	end

	desc "Create the days"
	task days: :environment do
		Day.find_or_create_by(name: "Lundi")
		Day.find_or_create_by(name: "Mardi")
		Day.find_or_create_by(name: "Mercredi")
		Day.find_or_create_by(name: "Jeudi")
		Day.find_or_create_by(name: "Vendredi")
		Day.find_or_create_by(name: "Samedi")
		Day.find_or_create_by(name: "Dimanche")
	end

	desc "Create recurrences"
	task recurrences: :environment do
		Recurrence.find_or_create_by(name: "tous les jours")
		Recurrence.find_or_create_by(name: "toutes les semaines")
		Recurrence.find_or_create_by(name: "toutes les 2 semaines")
		Recurrence.find_or_create_by(name: "tous les mois")
		Recurrence.find_or_create_by(name: "Aucune")
	end

	desc "Create an admin user"
	task user: :environment do
		if User.find_by_name("Admin").nil?
			User.create(name: "Admin", password: "12341", password_confirmation: "12341", level: 1)
		end
	end
end
