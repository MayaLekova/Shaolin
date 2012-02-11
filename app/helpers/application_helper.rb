module ApplicationHelper
  def text_input(properties)
    properties[:classes] ||= ""
    properties[:hidden] ||= false
    properties[:initial_value] ||= ""
    properties[:validators] ||= ""
    html = ""
    html << "<div class='text-container%{hidden}%{mandatory}'>\n" % {
                                                                    hidden: properties[:hidden] ? ' none' : '',
                                                                    mandatory: properties[:mandatory] ? ' mandatory-field' : '',
                                                                  }
    html << "    <label class='text-input-label' for='%{id}'>%{label}</label>\n"
    html << "    <input type='text' name='%{id}' id='%{id}' class='ui-corner-all text-input %{classes}' value='%{initial_value}' data-validators='%{validators}'/>\n"
    html << "</div>\n"

    Rails.logger.debug html % properties

    html % properties
  end

  def list_resources(resources, fields)
    html = "<ul>\n"
    resources.each do |resource|
      html << "    <li>" 
      html << "        <a href=\"#{resource.id}\"> #{resource.send(fields[0])} </a>"
      fields.slice(1, fields.size - 1).each do |field|
        html << "        <span> - #{resource.send(field)} </span>"
      end
      html << "    </li>"
    end
    html << "</ul>"
  end

  def link_to_new
    html = "   <a href=\"new\" class=\"ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only left add-new-button\">"
    html << "       <span class=\"ui-icon ui-icon-plus left\"></span>"
    html << "       <span class=\"right\">Add new</span>"
    html << "   </a>"

  end
end
