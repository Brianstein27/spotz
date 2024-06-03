module ApplicationHelper

  def category_color_class(category)
    case category
    when "Food'n'Drinks"
      'bg-customColorFood'
    when 'Culture'
      'bg-customColorCulture'
    when 'Nightlife'
      'bg-customColorNightlife'
    when 'Nature'
      'bg-customColorNature'
    when 'Activity'
      'bg-customColorActivity'
    when 'Hangout'
      'bg-customColorHangout'

    else
      'bg-bg-neutral-400'
    end
  end

end
