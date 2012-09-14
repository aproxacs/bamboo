module ApplicationHelper
  def show_message_if_exist
    flash_types = [:alert, :notice]

    messages = ((flash_types & flash.keys).collect do |key|
      "Message.#{key}('#{flash[key]}');"
    end.join("\n"))

    if messages.size > 0
      content_tag(:script, :type => "text/javascript") do
        "$(document).ready(function() { #{messages} });".html_safe
      end
    else
      ""
    end
  end

end
