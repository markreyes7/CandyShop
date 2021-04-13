class Test
    require_relative 'Shop'
    attr_accessor :the_shop
    def initialize()
        @the_shop = the_shop
    end    
    def run
        puts "Welcome to your brand new candy shop!"
        the_shop = Shop.new("CANDYLAND")
        store_is_open = true
        while (store_is_open)
            puts "Type what you would like to do!"
            the_shop.to_do
            user_input = gets
            if user_input.chomp.eql? "add"
                puts "What candy are you adding?"
                new_candy = gets
                the_shop.create_new_candy(new_candy)
                puts "Created new candy"
                puts the_shop.unshelved[0].name 
            
            elsif user_input.chomp.eql? "build"
                the_shop.build_shelf
            

            elsif user_input.chomp.eql? "shelf candies"
                puts "Add to which shelf?"
                num = gets.to_i
                
                pass = the_shop.which_shelf(num)
                puts "how many candies?"

                num2 = gets.to_i
                the_shop.shelf_amount(pass,num2)
                if the_shop.total_shelfs[pass] != nil
                    the_shop.total_shelfs[pass].read_all_candies
                end

            
            elsif user_input.chomp.eql? "destroy"
                shelf_to_destroy = gets.to_i
                the_shop.remove_shelf(shelf_to_destroy) 
                
            elsif user_input.chomp.eql? "list"
                puts "What shelf would you like to look through?"
                num = gets
                num = num.to_i
                pass = the_shop.which_shelf(num)
                if the_shop.total_shelfs.length() != 0
                    if the_shop.total_shelfs[pass] == nil
                        puts "No shelf DNE"
                    else
                        the_shop.total_shelfs[pass].read_all_candies
                    end   
                else 
                    puts "No candies to be found"     
                end
            elsif user_input.chomp.eql? "remove candy"
                puts "In which shelf would you like to remove candy?"
                shelf_num = gets
                shelf_num = the_shop.which_shelf(shelf_num)
                puts "What is the candies name?"
                candy_name = gets
                the_shop.remove_candy(shelf_num, candy_name)
                
            elsif user_input.chomp.eql? "finished"
                store_is_open = false
            elsif user_input.chomp.eql? "help"
                puts "Type 'remove candy' to unshelf and add to unshelved list" 
                puts "Type 'list' to see whats for sell in a given shelf"
                puts "Type 'destroy' to get rid of an entire shelf and all candies inside of it"
                puts "Type 'shelf candies' to add unshelved candies to a shelf"
                puts "Type 'add' to add a candy to the store in the unshelved pile. "
                puts "Type 'build' to build a new shelf."   
            end
        
        end
    end
end


tester = Test.new

tester.run
