module VolunteersHelper

    def url_protocol
        unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
        self.url = "https://#{self.url}"
        end
    end

end