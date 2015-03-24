namespace :init do 
	desc "Create the pages"
	task pages: :environment do
		Page.destroy_all
		lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nulla nisl, eleifend scelerisque porta non, volutpat quis elit. Nullam ornare, sapien et adipiscing sagittis, nunc felis posuere justo, fermentum lobortis dui massa nec lorem. Mauris sollicitudin nisl vel dapibus vehicula. Etiam sagittis, tortor sed tristique tincidunt, leo ante eleifend purus, ut gravida eros justo blandit enim. Nunc id urna a diam dictum dignissim. Fusce dictum lectus vel eros tempus porta. Etiam ac tortor vulputate, volutpat magna quis, semper velit. Nunc vel ligula nunc. Ut vitae commodo nulla, nec adipiscing tortor. Morbi ullamcorper diam euismod lacus imperdiet, eget aliquam erat viverra. In hac habitasse platea dictumst."
		Page.create(name: 'home', content: lorem)
		Page.create(name: 'presentation', content: lorem)
		Page.create(name: 'contact', content: lorem)
	end

	desc "Create the days"
	task days: :environment do
		Day.destroy_all

		Day.create(name: "Lundi")
		Day.create(name: "Mardi")
		Day.create(name: "Mercredi")
		Day.create(name: "Jeudi")
		Day.create(name: "Vendredi")
		Day.create(name: "Samedi")
		Day.create(name: "Dimanche")
	end

	desc "Create recurrences"
	task recurrences: :environment do
		Recurrence.destroy_all

		Recurrence.create(name: "tous les jours")
		Recurrence.create(name: "toutes les semaines")
		Recurrence.create(name: "toutes les 2 semaines")
		Recurrence.create(name: "tous les mois")
		Recurrence.create(name: "Aucune")
	end

	desc "Create an admin user"
	task user: :environment do
		User.create(name: "Admin", password: "12341", password_confirmation: "12341", level: 1)
	end

	task onelife_page: :environment do
		Page.create(name: 'fribourg', content: "Texte à éditer")
		Page.create(name: 'shiloa', content: "Texte à éditer")
		Page.create(name: 'vision', content: "Texte à éditer")
	end
end