class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy ]

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
