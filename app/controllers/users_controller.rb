class UsersController < ApplicationController
    skip_before_action :authenticate

######## CRUD ROUTES  ########
    #index
    # memo to self: Don't delete
    def index
    end

    #show
    def show
        @user = User.find(params[:id])
    end

    #edit
    def edit
        @user = User.find(params[:id])
    end

    #update
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    #destroy
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to sign_up_path
    end

######## Authentication Routes  ########

    def sign_up
    end

    def sign_up!
        @user = User.new(
          username: params[:username],
          password: params[:password],
          password_confirmation: params[:password_confirmation]
        )
        if @user.save
          message = "Your account has been created!"
          redirect_to root_url
          flash[:notice] = message
        else
          message = "Your account couldn't be created. Did you enter a unique username and password?"
          flash.now[:notice] =  message
          render :sign_up
        end
    end

    def sign_in
    end

# This is a really long method! Granted, it's pretty much just taken from what we did in class. Still, I'd suggest seeing if you can keep all your methods to 5 lines or fewer. This is an actual programming methodology used by many.
    def sign_in!
        @user = User.find_by(username: params[:username])
        if !@user
          message = "This user doesn't exist!"
          redirect_to action: :sign_up
        elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
          message = "Your password's wrong!"
          redirect_to action: :sign_in
        else
          message = "You're signed in, #{@user.username}!"
          cookies[:username] = {
              value: @user.username,
# Watch out for the dangling comma here
          }
          session[:user] = @user
          redirect_to articles_path
        end
        flash[:notice] = message
        # redirect_to action: :sign_in
    end

    def sign_out
        reset_session
        redirect_to sign_in_path
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end
