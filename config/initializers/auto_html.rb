AutoHtml.add_filter(:sized_imagee).with(:width => 250, :height => 200) do |text, options|

  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    width = options[:width]
    height= options[:height]
    %|<img src="#{match}" alt="" style="width: 100%; max-width="#{width}" width="#{width}" />|
  end
end