module ProjectsHelper
  ##### personalized projects for volunteers #########
  def matched_projects(user_id)
    # set the volunteer by user_id
    volunteer = Volunteer.find_by(user_id: user_id)

    # find projects that fit volunteers causes
    matched_cause(volunteer)

    # narrow down based on project required professions
    matched_profession(volunteer,@matched_projects)

    # narrow down based on project required skills
    matched_skills(volunteer,@matched_projects)

    # locate projects near user location
    nearby_projects(@matched_projects, volunteer.user.latitude, volunteer.user.longitude)

    # volunteers personilzed matched projects
    personlized_projects = @matched_projects
  end

  ######## Volunteer page automatching #####################

  def matched_cause(volunteer)
    matched_cause = []
    volunteer.user.causes.each do |volunteer_cause|
      Cause.find_by(id: volunteer_cause.id).projects.each do |project|
          matched_cause << project.id
      end
    end
    if matched_cause.count > 0
      @matched_projects = Project.where(:id => matched_cause)
    else
      return "No Projects currently match your criteria."
    end
  end

  def matched_profession(volunteer,matched_projects)
    matched_profession = []
    volunteer.professions.each do |volunteer_profession|
      matched_projects.joins(:professions).where("professions.id = ?", volunteer_profession.id).each do |project|
          matched_profession << project.id
      end
    end
    if matched_profession.count > 0
      @matched_projects = Project.where(:id => matched_profession)
    else 
      return @matched_projects # 25% match only    
    end
  end 

  def matched_skills(volunteer,matched_projects) 
    matched_skills = []
    volunteer.skills.each do |volunteer_skill|
      matched_projects.joins(:skills).where("skills.id = ?", volunteer_skill.id).each do |project|
          matched_skills << project.id
      end
    end
    if matched_skills.count > 0
      @matched_projects = Project.where(:id => matched_skills)
    else
      return @matched_projects # 50% match only
    end
  end

  # find projects withing distance from volunteer
  def nearby_projects(projects,latitude,longitude)
    matched_projects = projects.near([latitude, longitude], 50, units: :km)  # within 50 kilometres of user address
    if matched_projects.count > 0
      @matched_projects = matched_projects # 100% match
    else
      return @matched_projects # 75% match
    end
  end

  ######## Project page automatching #####################

  def matched_volunteers(project_id)
    # set the project
    project = Project.find(project_id)

    # find volunteers with same cause
    project_matched_cause(project)

    # narrow down volunteers based on profession
    project_matched_profession(@matched_volunteers,project)

    # narrow down volunteers based on skills
    project_matched_skills(@matched_volunteers,project)

    # find volunteers within distance
    nearby_volunteers(@matched_volunteers,lat,long)
  end

  def project_matched_cause(project)
    matched_users = []
    matched_cause = []

    project.causes.each do |project_cause|
      User.joins(:causes).where("causes.id = ?", project_cause.id).each do |user|
        matched_users << user.id
      end
    end

    if matched_user.count > 0
      potentials = User.where(:id => matched_users)
    else
      return "No Volunteers currently match your criteria."
    end

    potentials.each do |x|
      if x.volunteer
        matched_cause << x.volunteer.id
      else
        return "No Volunteers currently match your criteria."
      end  
    end
    @matched_volunteers = Volunteer.where(:id => matched_cause)
  end

  def project_matched_profession(matched_volunteers,project)
    matched_profession = []

    project.professions.each do |project_profession|
      matched_volunteers.joins(:professions).where("professions.id = ?", project_profession.id).each do |volunteer|
        matched_profession << volunteer.id
      end
    end

    if matched_profession.count > 0
      @matched_volunteers = Volunteer.where(:id => matched_profession)
    else
      return @matched_volunteers # 25% match only
    end
  end

  def project_matched_skills(matched_volunteers,project)
    matched_skills = []
    project.skills.each do |project_skill|
        @matched_volunteers.joins(:skills).where("skills.id = ?", project_skill.id).each do |volunteer|
            matched_skills << volunteer.id
        end
    end

    if matched_skills.count > 0 
      @matched_volunteers = Volunteer.where(:id => matched_skills)
    else
      return @matched_volunteers # 50% match only
    end
  end

  
  def nearby_volunteers(volunteers,latitude, longitude)
    users = []
    volunteers.each do |volunteer|
      users << volunteer.user.id
    end
    users = User.where(:id => users)
    matched_volunteers = users.near([latitude, longitude], 50, units: :km)  # within 50 kilometres of user address

    if matched_volunteers.count > 0
      @matched_volunteers = matched_volunteers # 100% match
    else
      return @matched_volunteers # 75% match
    end
  end

end




