class ApplicationController < ActionController::API
    include ::ActionController::Cookies
        # first seed user is "logged in"
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
end
