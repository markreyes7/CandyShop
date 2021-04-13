elsif user_input.chomp.eql? "remove candy"
                puts "In which shelf would you like to remove candy?"
                shelf_num = gets
                shelf_num = the_shop.which_shelf(shelf_num)
                puts "What is the candies name?"
                candy_name = gets
                the_shop.remove_candy(shelf_num, candy_name)