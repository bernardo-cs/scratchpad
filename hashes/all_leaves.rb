class Hash
  # {'x'=>{'y'=>{'z'=>1,'a'=>2}}}.leaves == [1,2]
  def leaves
    leaves = []

    each_value do |value|
      value.is_a?(Hash) ? value.leaves.each{|l| leaves << l } : leaves << value
    end

    leaves
  end
end

mega_hash = {"sale_order"=>
    {"client_code"=>"Cliente",
     "pep"=>"Nº do pedido",
     "request_date"=>"DataPedido",
     "buy_request_date"=>"Data doc._1",
     "buy_request_number"=>"Doc.compra",
     "buy_requisition_number"=>"ReqC",
     "sale_order_number"=>"Doc.vendas",
     "buyer_code"=>"GCm",
     "buyer_text"=>"Denominação_2",
     "transport"=>"SP"},
   "shipping_order"=>
    {"trip_type"=>"SP",
     "transport_name"=>"Localização/nome",
     "planned_delivery_date"=>"Dt.remessa",
     "origin_doc_number"=>"Doc.mat.",
     "origin_arrival_date"=>"Dt.lçto.",
     "manifest_ref_number"=>"Referência",
     "shipping_number"=>"Fornmto.",
     "shipping_doc_date"=>"Data doc._2",
     "estimated_arrival_date"=>"Data ETA",
     "estimated_departure_date"=>"Data ETD"},
   "material"=>{"description"=>"Denominação_1", "code"=>"Material"},
   "brand"=>{"name"=>"Grp.merc.2", "code"=>"Grp.merc."},
   "invoice"=>
    {"number"=>"Doc.fatur.",
     "date"=>"Dt.fatur.",
     "value_cents"=>"Val.líq._2",
     "value_currency"=>"Moeda_2"},
   "shipping_item"=>
    {"commercial_unit"=>"UC",
     "measurement_unit"=>"UM_2",
     "origin_item"=>"Itm_2",
     "shipping_item"=>"Itm_3",
     "crate_code"=>"Marca Contentor",
     "packaged_quantity"=>"Quantidade_3",
     "shipped_quantity"=>"Quantidade_2",
     "origin_doc_number"=>"Doc.mat.",
     "price_cents"=>"Val.líq._1",
     "price_currency"=>"Moeda_1"}
}

 p mega_hash.leaves
