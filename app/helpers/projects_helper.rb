module ProjectsHelper

  def approved
    self.approved?
  end


  ##### personalized projects for volunteers #########
  def matched_projects(user_id)
    # set the volunteer by user_id
    profile_user = User.find(user_id)
    if !profile_user.volunteer
      @matched_projects = []
    else
      volunteer = Volunteer.find_by(user_id: user_id)

      # find projects that fit volunteers causes
      matched_cause(volunteer)

      # narrow down based on project required professions
      if @matched_projects.count > 0
        matched_profession(volunteer,@matched_projects)
      end
      
      # narrow down based on project required skills
      if @twenty_five == false
        matched_skills(volunteer,@matched_projects)
      end

      # # locate projects near user location
      if @fifty == false
        nearby_projects(@matched_projects, volunteer.user.latitude, volunteer.user.longitude)
      end
    end

  end

  ######## Volunteer page automatching #####################

  # creates an array of matched projects that are approved based on cause
  def matched_cause(volunteer)
    matched_cause = []
    volunteer.user.causes.each do |volunteer_cause|
      Cause.find_by(id: volunteer_cause.id).projects.where(status: 'approved').each do |project|
          matched_cause << project.id
      end
    end

    if matched_cause.count > 0
      @matched_projects = Project.where(:id => matched_cause)
    else
      @matched_projects = []
    end

  end

  # narrows array of matched projects based on profession
  def matched_profession(volunteer,matched_projects)
    @projects_twentyfive = @matched_projects
    @twenty_five = false
    matched_profession = []
    volunteer.professions.each do |volunteer_profession|
      matched_projects.joins(:professions).where("professions.id = ?", volunteer_profession.id).each do |project|
          matched_profession << project.id
      end
    end
    if matched_profession.count > 0
      @matched_projects = Project.where(:id => matched_profession)
    else 
      @twentyfive = true # 25% match only    
    end
  end 

  # narrows array of matched projects based on skills
  def matched_skills(volunteer,matched_projects)
    @projects_fifty = matched_projects
    # to remove duplicates from array
    @projects_twentyfive = (@projects_fifty - @projects_twentyfive) 
    @fifty = false
    matched_skills = []
    volunteer.skills.each do |volunteer_skill|
      matched_projects.joins(:skills).where("skills.id = ?", volunteer_skill.id).each do |project|
          matched_skills << project.id
      end
    end
    if matched_skills.count > 0
      @matched_projects = Project.where(:id => matched_skills)
    else
      @fifty = true #50% match only
    end
  end

  # narrows projects within a distance from volunteer
  def nearby_projects(projects,latitude,longitude)
    @projects_seventy_five = @matched_projects
    # to remove duplicates from array
    @projects_fifty = @projects_seventy_five - @projects_fifty
    @seventy_five = false
    @hundred = false
    matched_projects = projects.near([latitude, longitude], 50, units: :km)  # within 50 kilometres of user address
    if matched_projects.size > 0
      @matched_projects = matched_projects
      # to remove duplicates from array
      @projects_seventy_five = (@matched_projects - @projects_seventy_five)
      @hundred = true # 100% match
    else
      @seventy_five = true # 75% match
    end
  end

  

######## Project page automatching #####################

  def matched_volunteers(project_id)
    # set the project
    project = Project.find(project_id)

    # find volunteers with same cause
    project_matched_cause(project)

    # narrow down volunteers based on profession
    if @matched_volunteers.count > 0
    project_matched_profession(@matched_volunteers,project)
    end

    # narrow down volunteers based on skills
    if @twenty_five == false
    project_matched_skills(@matched_volunteers,project)
    end
    # find volunteers within distance
    if @fifty == false
    nearby_volunteers(@matched_volunteers,project.latitude,project.longitude)
    end
  end

  # narrows array of matched volunteers based on cause
  def project_matched_cause(project)
    matched_users = []
    matched_cause = []
    #find users with matched causes
    project.causes.each do |project_cause|
      User.joins(:causes).where("causes.id = ?", project_cause.id).each do |user|
        matched_users << user.id
      end
    end

    if matched_users.count > 0
      potentials = User.where(:id => matched_users)
      #narrow to those that are volunteers
      potentials.each do |x|
        if x.volunteer
          matched_cause << x.volunteer.id
        else
          @matched_volunteers = []
        end  
      end
      @matched_volunteers = Volunteer.where(:id => matched_cause)
    else
      @matched_volunteers = []
    end
  end

  # narrows array of matched volunteers based on profession
  def project_matched_profession(matched_volunteers,project)
    @volunteers_twentyfive = @matched_volunteers
    @twenty_five = false
    matched_profession = []

    project.professions.each do |project_profession|
      matched_volunteers.joins(:professions).where("professions.id = ?", project_profession.id).each do |volunteer|
        matched_profession << volunteer.id
      end
    end

    if matched_profession.count > 0
      @matched_volunteers = Volunteer.where(:id => matched_profession)
    else
      @twentyfive = true # 25% match only
    end
  end

  # narrows array of matched volunteers based on skills
  def project_matched_skills(matched_volunteers,project)
    @volunteers_fifty = matched_volunteers
    # to remove duplicates from array
    @volunteers_twentyfive = (@volunteers_fifty - @volunteers_twentyfive) 
    @fifty = false   
    matched_skills = []
    project.skills.each do |project_skill|
        @matched_volunteers.joins(:skills).where("skills.id = ?", project_skill.id).each do |volunteer|
            matched_skills << volunteer.id
        end
    end

    if matched_skills.count > 0 
      @matched_volunteers = Volunteer.where(:id => matched_skills)
    else
      @fifty = true #50% match only
    end
  end

  # narrows volunteers within a distance from project
  def nearby_volunteers(volunteers,latitude, longitude)
    @volunteers_seventy_five = @matched_volunteers
    # to remove duplicates from array
    @volunteers_fifty = @volunteers_seventy_five - @volunteers_fifty
    @seventy_five = false
    @hundred = false    
    users = []
    volunteers.each do |volunteer|
      users << volunteer.user.id
    end
    # finde users geolacation to compare
    users = User.where(:id => users)
    matched_volunteers = users.near([latitude, longitude], 50, units: :km)  # within 50 kilometres of user address

    if matched_volunteers.size > 0
      @matched_volunteers = matched_volunteers
      # to remove duplicates from array
      @volunteers_seventy_five = (@matched_volunteers - @volunteers_seventy_five)
      @hundred = true # 100% match
    else
      @seventy_five = true # 75% match
    end
  end
end




