module ApplicationHelper
    include Pagy::Frontend
    def link_to_with_icon(icon_name, text, link)
        link_to content_tag(:i, icon_name, :class => "material-icons"), link
    end
end


# <%= content_tag(:i, "close", class: "material-icons") %>