namespace :init do 
	desc "Create the pages"
	task pages: :environment do
		Page.destroy_all
		
		Page.create(name: 'home', content: 'content')
		Page.create(name: 'presentation', content: 'content')
		Page.create(name: 'contact', content: 'content')
	end
end