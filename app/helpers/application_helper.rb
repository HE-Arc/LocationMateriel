module ApplicationHelper
	def flash_class(type)
		case type
		when :notice then "alert alert-info"
		when :success then "alert alert-success"
		when :error then "alert alert-error"
		when :alert then "alert alert-success"
			
		end

	end	
end
