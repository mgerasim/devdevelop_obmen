namespace :course do
  desc "TODO"
  task run: :environment do
  	puts "course update"
  	Burse.all.each { |burse|  
  		puts burse.name
  		case burse.name
  		when 'Binance'
  			puts 'select binance'
  			burse.run_binance
  		when 'Bittrex'
  			puts 'select bitrex'
  			burse.run_bittrex
  		when 'Poloniex'
  			puts 'select poloniex'
  			burse.run_poloniex
  		when 'Livecoin'
  			puts 'select Livecoin'
  			burse.run_livecoin
      when 'Cryptopia'
        puts 'select Cryptopia'
        burse.run_cryptopia
      when 'EXMO'
        puts 'select EXMO'
        burse.run_exmo
  		else
  		end
  	}

  end

  desc "TODO"
  task clear: :environment do
  	Course.delete_all
  end

end
