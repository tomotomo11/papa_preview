class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!
end
