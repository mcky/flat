class ProfilesController < ApplicationController
  def show
    @user = User.find_by_name(params[:id])
    if @user
      @expenses = @user.expenses.all
      @statuses = @user.statuses.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
