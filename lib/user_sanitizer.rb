class User::ParameterSanitizer &lt; Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:first_name, :profile_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end