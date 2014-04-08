module ApplicationHelper
	def avatar_profile_link(user, image_options={}, html_options={})
		avatar_url = user.avatar? ? user.avatar.url : user.gravatar_url
		link_to(image_tag(avatar_url, image_options), profile_path(user.profile_name), html_options)
	end

	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else
			""
		end
	end
end
