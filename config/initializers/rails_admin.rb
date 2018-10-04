RailsAdmin.config do |config|


  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  # uncomment this section
  config.parent_controller = "::ApplicationController"

  config.authorize_with do |controller|
    unless current_user && current_user.admin?
      redirect_to(
        main_app.root_path,
        flash: {alert: "You are not permitted to view this page"}
      )
    end
  end



  ## == Will Paginate ==
  if defined?(WillPaginate)
    ActiveSupport.on_load :active_record do
      module WillPaginate
        module ActiveRecord
          module RelationMethods
            alias_method :per, :per_page
            alias_method :num_pages, :total_pages
          end
        end
      end
    end
  end



  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    ####### modify action in admin panel #########
    show_in_app 

  end

    ######## remove models from navigation pane #######
  exclusions = ['ProjectCauseJoin','ProjectProfessionJoin','ProjectSkillJoin','OrganizerProjectJoin','VolunteerSkillJoin','VolunteerProjectJoin','VolunteerProfessionJoin','VolunteerCauseJoin','ProjectCategoryJoin']  
  exclusions.each do |x|
  config.excluded_models << x
  end

  ####### config User model ##########
  config.model User do
    navigation_label 'User Section'
    object_label_method do
      :custom_label
    end
    update do
      exclude_fields :password, :password_confirmation
    end

    
  end
  ####### config Organizer model ##########
  config.model Organizer do
    navigation_label 'User Section'
    object_label_method do
      :custom_label
    end
  end

  ####### config Volunteer model ##########
  config.model Volunteer do
    navigation_label 'User Section'
    object_label_method do
      :custom_label
    end
  end

  ####### config Donor model ##########
  config.model Donor do
    navigation_label 'User Section'
    object_label_method do
      :custom_label
    end
  end

  ####### config Project model ##########
  config.model Project do
    navigation_label 'User Section'
    object_label_method do
      :custom_label
    end
  end


  # --------- TAGS GROUP -----------------
   ######## config Cause model ##########
  config.model Cause do
    navigation_label 'Tags'
    object_label_method do
      :custom_label
    end
  end
   ######## config Skill model ##########
  config.model Skill do
    navigation_label 'Tags'
    object_label_method do
      :custom_label
    end
  end
   ######## config Category model ##########
  config.model Category do
    navigation_label 'Tags'
    object_label_method do
      :custom_label
    end
  end
   ######## config Profession model ##########
  config.model Profession do
    navigation_label 'Tags'
    object_label_method do
      :custom_label
    end
  end




end




  #---------- JOINS TABLES -------------------------
  ######## config donation model ##########
  # config.model Donation do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config organizer_project_join model ##########
  # config.model OrganizerProjectJoin do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config project_category_join model ##########
  # config.model ProjectCategoryJoin do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config volunteer_cause_join model ##########
  # config.model VolunteerCauseJoin do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config volunteer_profession_join model ##########
  # config.model VolunteerProfessionJoin do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config volunteer_project_join model ##########
  # config.model VolunteerProjectJoin do
  #   navigation_label 'Joins Tables'
  # end
  #   ######## config volunteer_skill_join model ##########
  # config.model VolunteerSkillJoin do
  #   navigation_label 'Joins Tables'
  # end
  #---------- !JOINS TABLES -------------------------
