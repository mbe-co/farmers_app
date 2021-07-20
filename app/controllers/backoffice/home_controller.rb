module Backoffice
  class HomeController < ApplicationController
    include AdminsOnly

    def index
    end
  end
end