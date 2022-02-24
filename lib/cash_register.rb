class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        subtotal = price * quantity
        quantity.times { @items << title}
        @last_transaction = {"title" => title, "price" => price, "quantity" => quantity}
        @total += subtotal
    end

    def apply_discount
        if discount == 0 
            "There is no discount to apply."
        else
            sub_discount = @discount*0.01
            @total = (@total - (@total * sub_discount))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @last_transaction["quantity"].times {@items.pop}
        @last_transaction["quantity"].times { @total -= @last_transaction["price"] }
    end

end