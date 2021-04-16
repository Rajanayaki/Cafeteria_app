class OrderPdf < Prawn::Document
    before_action :check_as_admin, check_as_clerk
    def initialize(order,view)
        super(top_margin: 70)
        @order= order
        @view =view
        order_id
        @order_items_id = OrderItem.where(order_id:@order.id).pluck(:id)
        line_items
        total_pay
    end

    def order_id
        text "Order \##{@order.id}", size: 30, style: :bold
    end
    
    def line_items
        move_down 20
        table line_items_rows do 
            row(0).font_style = :bold
            columns(1..3).align = :right
            self.row_colors = ["DDDDDD","FFFFFF"]
            self.header = true
        end
    end

    def line_items_rows
        [["Item","Qty","Unit Price","Total P \
        ];lK
        Jhrice"]] +
        @order_items_id.map do |order_item|
            item = OrderItem.find(order_item)
            [item.item_name,item.quantity,price(item.item_price),price(item.total_price)]
        end       
    end 

    def price(num)
        @view.number_to_indian_currency(num)
    end

    def total_pay
        move_down 15
        text "Net Pay: #{price(@order.netpay)}",size: 16, style: :bold
    end
end