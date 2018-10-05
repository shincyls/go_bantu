module OrganizersHelper

	def project_volunteers
		interests = []
		organizer = current_user.organizer
		if organizer.projects.any?
			projects = organizer.projects
			projects.each do |project|
				if project.volunteer_project_joins.any? 
					project.volunteer_project_joins.each do |volunteer|
						if volunteer.interested?
							interests << volunteer.id
						end
					end
				end
			end
		end
		
		@volunteers = VolunteerProjectJoin.where(:id => interests)
	end

	def approved_volunteers
		interests = []
		organizer = current_user.organizer
		if organizer.projects.any?
			projects = organizer.projects
			projects.each do |project|
				if project.volunteer_project_joins.any? 
					project.volunteer_project_joins.each do |volunteer|
						if volunteer.approved?
							interests << volunteer.id
						end
					end
				end
			end
		end
		
		@approvals = VolunteerProjectJoin.where(:id => interests)
	end

end