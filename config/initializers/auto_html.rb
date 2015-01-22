AutoHtml.add_filter(:sized_image).with(:width => 400, :height => 400) do |text, options|

  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    width = options[:width]
    height= options[:height]
    %|<img src="#{match}" alt="" width="#{width}" height="#{height}" />|
  end
end