class EventDecorator < ApplicationDecorator
  delegate_all

  def get_start_date
    helpers.content_tag :span, class: 'time' do
      object.start_date.strftime("%a %d.%m.%y. %H:%M")
    end
  end

  def get_finish_date
    helpers.content_tag :span, class: 'time' do
      object.finish_date.strftime("%a %d.%m.%y. %H:%M")
    end
  end

  def get_start_time
    helpers.content_tag :span, class: 'time' do
      object.start_date.strftime("%H:%M")
    end
  end

  def get_finish_time
    helpers.content_tag :span, class: 'time' do
      object.start_date.strftime("%H:%M")
    end
  end

  def truncated_description
    h.truncate(object.description, length: 45)
  end
end
