namespace :course do
  desc "TODO"
  task run: :environment do
  	puts "course update"
  	Burse.all.each { |burse|  
  		puts burse.name
  		case burse.name
  		when 'Bittrex'
  			puts 'select bitrex'
  			burse.run_bittrex

  		else
  		end
  	}

  end

  desc "TODO"
  task clear: :environment do
  	Course.delete_all
  end

end