class ArduinoController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :new, :create, :update, :destroy]

  def index
  end
end
