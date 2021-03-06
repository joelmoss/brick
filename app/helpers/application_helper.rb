module ApplicationHelper

  def page_title(title)
    content_for :page_title, title
  end

  def page_title_for_header
    if content_for?(:page_title)
      strip_tags "#{content_for(:page_title)} &ndash; Brick"
    else
      'Brick'
    end
  end

  def flash_type_for(flash_type)
    case flash_type.to_sym
      when :alert
        "negative"
      when :notice
        "positive"
      else
        flash_type.to_s
    end
  end

  def icon(*names)
    options = names.extract_options!
    content_tag :i, nil, options.merge(class: names.map{|name| "#{name.to_s.gsub('_','-')}" } << 'icon')
  end

end
