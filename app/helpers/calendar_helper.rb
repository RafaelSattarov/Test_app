module CalendarHelper
  
  def month_link(month_date, who)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year, :who => who})
  end

  def month_link3(month_date, who)
    link_to(I18n.localize(month_date, :format => "%Y"), {:month => month_date.month, :year => month_date.year, :who => who})
  end

  def month_link2(month_date, who)
    {:month => month_date.month, :year => month_date.year, :who => who}
  end
  
end
