require 'rubyXL'
require 'pry'

## Object must have parser_data
## method available, wich is a rubyxl
## object
module XLSXParamsVerifier
  def params
    parser_data.first
  end

  def is_valid?
    passed_validations.size == validators.size
  end

  def passed_validations
    validators.select{ |e| send(e) }
  end

  def failed_validations
    validators.reject{ |v| passed_validations.include? v }
  end

  protected
  def validate_size
    params.size == valid_params.size
  end

  def validate_params
    params == valid_params
  end

  def validators
    protected_methods.grep( /validate_/ )
  end

  def missing_params
    valid_params.reject{ |e| params.include? e }
  end

  def extra_params
    params.reject{ |e| valid_params.include? e }
  end
end

class Parser
  include XLSXParamsVerifier

  attr_accessor :parser, :valid_params
  def initialize *args
    @valid_params = ['Cliente',
                     'Nº do pedido',
                     'DataPedido',
                     'Itm',
                     'Rc',
                     'Doc.vendas',
                     'Denominação',
                     'SP',
                     'ReqC',
                     'Item',
                     'Grp.merc.',
                     'Grp.merc.2',
                     'Material',
                     'Quantidade',
                     'UM',
                     'GCm',
                     'Denominação',
                     'Doc.compra',
                     'Data doc.',
                     'Fornecedor',
                     'Nome 1',
                     'Qtd.pedido',
                     'UMP',
                     'Val.líq.',
                     'Moeda',
                     'Dt.remessa',
                     'Doc.mat.',
                     'Itm',
                     'Dt.lçto.',
                     'Quantidade',
                     'Referência',
                     'Fornmto.',
                     'Itm',
                     'Data doc.',
                     'Quantidade',
                     'UM',
                     'UC',
                     'Marca Contentor',
                     'Localização/nome',
                     'Data ETD',
                     'Data ETA',
                     'Doc.fatur.',
                     'Dt.fatur.',
                     'Val.líq.',
                     'Moeda']
    @parser_data = RubyXL::Parser.parse(args.first, skip_filename_check: true)[0].extract_data
  end

  def parser_data
    @parser_data
  end

  def valid_params
    @valid_params
  end
end


pa = Parser.new( './datasets/dataset_5.xlsx' )
p pa.params
p pa.is_valid?
p pa.failed_validations
p pa.passed_validations
