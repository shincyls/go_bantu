class DonorsController < ApplicationController
    def create
        @donor = Donor.new
    end
end
