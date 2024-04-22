class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # skip_after_action :verify_policy_scoped
  # before_action :skip_pundit?

  def home
    skip_authorization
  end

  # def index
  # end

end
