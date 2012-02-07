module ApplicationHelper
  def text_input(properties)
    properties[:classes] ||= ""
    properties[:hidden] ||= false
    properties[:initial_value] ||= ""
    properties[:validators] ||= ""
    html = ""
    html << "<div class='text-container%{hidden}%{mandatory}'>" % {
                                                                    hidden: properties[:hidden] ? ' none' : '',
                                                                    mandatory: properties[:mandatory] ? ' mandatory-field' : '',
                                                                  }
    html << "<label class='text-input-label' for='%{id}'>%{label}</label>"
    html << "<input type='text' name='%{id}' id='%{id}' class='ui-corner-all text-input %{classes}' value='%{initial_value}' data-validators='%{validators}'/>"
    html << "</div>"

    Rails.logger.debug html % properties

    html % properties
  end
end
