  module OmniauthAttributesConcern
      extend ActiveSupport::Concern
      module ClassMethods
        #   Add Methods here 
        
            def facebook params
                (params['info']['email'] = "random#{SecureRandom.hex(10)}@email.com") if params['info']['email'].blank?
                (params['info']['username'] = params['info']['name'].split(' ').first) if params['info']['username'].blank?
                attributes = {
                                email: params['info']['email'],
                                first_name: params['info']['name'].split(' ').first,
                                last_name: params['info']['name'].split(' ').last,
                                username: params['info']['username'],
                                avatar: params['info']['image'],
                                password: Devise.friendly_token
                            }
                create(attributes)
            end





      end
  end