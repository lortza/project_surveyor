module StylesHelper

  def button_classes(style = 'primary')
    "btn btn-sm btn-#{style}"
  end

  def table_classes
    "table table-striped table-hover table-sm table-bordered"
  end

end
