module Backoffice
  class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
    end
  end
end