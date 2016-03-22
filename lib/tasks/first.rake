namespace :how_to_earn_money do
	task :learn_more_knowledge do
		puts 'knowledge is money'
        end
 
	task :work_hard do
		puts 'work hard to make profit'
  	end
	
	task :earn_money => [:learn_more_knowledge, :work_hard] do
		puts 'i am rich now'
	end

	task :your_work, [:work] do |t, args|
		puts "my work is #{args.name}"
	end
end

desc 'rails task'
namespace :rails_task do 
	task :show_first_user_in_bbs => :environment do
		puts User.first.name
	end

	task :create_posts_to_user => :environment do
		50.times { |i| User.first.posts.create(content:"hello#{i}") }
	end
end

