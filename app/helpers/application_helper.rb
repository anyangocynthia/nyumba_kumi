module ApplicationHelper
	def time_formatter timestamp
		if timestamp.today?
			timestamp.localtime.strftime('%l:%M %p')
		else
			if Time.now.year == timestamp.year
				timestamp.localtime.strftime('%d %b %l:%M %p')
			else
				timestamp.localtime.strftime('%d %b %Y %l:%M %p')
			end	
		end
	end

	def human_boolean(boolean)
	  boolean ? 'Yes' : 'No'
	end
end
