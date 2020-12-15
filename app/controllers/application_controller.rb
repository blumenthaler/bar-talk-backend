class ApplicationController < ActionController::API
        # first seed user is "logged in"
    def current_user
        User.first
    end

    def logged_in?
        !!current_user
    end
end
