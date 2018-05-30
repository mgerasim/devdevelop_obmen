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
  		when 'Poloniex'
  			puts 'select poloniex'
  			burse.run_poloniex
  		when 'Livecoin'
  			puts 'select Livecoin'
  			burse.run_livecoin
  		else
  		end
  	}

  end

  desc "TODO"
  task clear: :environment do
  	Course.delete_all
  end

end
