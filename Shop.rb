class Shop
    require_relative 'Shelf'
    require_relative 'Candy' 
    attr_accessor :shop_name 
    
    def initialize(shop_name)
        @shop_name = shop_name
        @unshelved = [] #array of unshelved candies
        @total_shelfs = [] #array of shelfs. (shelf)
    end

    def to_do
        count = 0
        count_to_int = count.to_i
        if @unshelved.length() == 0
            puts "Nothing to do! Clean the shop or grab some tea."
        else
            puts "You still have work to do! Make sure to shelf: "
            for candy in @unshelved
                count_to_int += 1
                puts count_to_int.to_s + "." + candy.name    
            end
        end
    end  

    def create_new_candy(new_name)
        candy = Candy.new(new_name)
        @unshelved.unshift candy
        puts "A new candy has entered the store! Make sure to put it on a shelf."
    end

    def remove_candy(shelf,candy_to_remove)
        count = 0
        count = count.to_i
        if @total_shelfs[shelf] == nil
            puts "No shelf here"
        else
            for i in @total_shelfs[shelf].shelfy
                if i.name == candy_to_remove
                    @unshelved.unshift @total_shelfs[shelf].shelfy[-1]
                    @total_shelfs[shelf].shelfy.delete_at(count) 
                else
                count +=1
                end 
            end        
        end       
    end

    def build_shelf
        shelf = Shelf.new
        @total_shelfs << shelf
        puts "Shelf has been built. Ready to add candies?"
    end
    
    def remove_shelf(number)
        real_number = number.to_i #shelf number to remove.
        total_shelfs.delete_at(real_number - 1)
        puts "Shelf destroyed!"
    end        


    def shelf_one
        length = @unshelved.length()  #to get the next candy to be shelved
        shelf_length = @total_shelfs.length() #get what shelf we want to place candy in
        @total_shelfs[shelf_length-1].shelfy << @unshelved[length-1]
        unshelved.pop
        puts @total_shelfs[shelf_length-1].shelfy[shelf_length-1].name
        puts "candy was placed in shelf."
    end

    def shelf_amount(shelf_to_be_placed, num)   #add a which shelf parameter.
        shelf_length = @total_shelfs.length() #get what shelf we want to place candy in
        length = @unshelved.length() #to get all candies in unshelved TODO: fix this to make it more dynamic *shelf*.
        real_num = num.to_i
    
    
        if  shelf_length == 0 || total_shelfs[shelf_to_be_placed] == nil
            puts "You have no shelfs"
            return 
        elsif real_num < length
            count = real_num
            until count == 0
                @total_shelfs[shelf_to_be_placed].shelfy << @unshelved[-1]
                unshelved.pop 
                count -= 1
            end
        elsif  real_num > length
            puts "You entered more than you have! Storing all in the unshelved."
            count = length
            until count == 0
                @total_shelfs[shelf_to_be_placed].shelfy << @unshelved[-1]
                unshelved.pop
                count -= 1
            end    
                
        else
            count = length
            until count == 0
                @total_shelfs[shelf_to_be_placed].shelfy << @unshelved[-1]
                unshelved.pop
                count -= 1
            end
        end         

    end

    def which_shelf(shelf_index)   #will return num
        shelf_indexy = shelf_index.to_i
        shelf_indexy -= 1
    end
    

    def unshelved
        @unshelved
    end

    def total_shelfs
        @total_shelfs
    end    

end

#shop1 = Shop.new("hello")
#shop1.create_new_candy("snickers")
#shop1.create_new_candy("crunch")
#shop1.create_new_candy("reeses")
#shop1.build_shelf
#shop1.build_shelf

#shop1.shelf_amount(shop1.which_shelf(1),5)
#shop1.remove_shelf(2)
#shop1.total_shelfs[0].read_all_candies