# coding: UTF-8
module MedicosHelper

  def clinica_options(selected = nil)
    options_for_select({"Mais Recente" => "most_recent", "Menor Preço" => "lowest_price",
    "Maior Preço" => "highest_price", "Maior Desconto" => "highest_discount"}, selected)
  end

end
