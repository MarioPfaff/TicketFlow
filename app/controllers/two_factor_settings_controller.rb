# method [authenticate_user] they main "variable" that explains that you use the "user class"
# @note  globalvar [current_user] the function from devise that is for the user
class TwoFactorSettingsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!


  # Makes sure the user can't do it twice to
  # 1 make a new 2 step connection
  # 2 is you have it send you to the backup code form

  # @param method [otp_required_for_login] is a function from devise
  # @return send to edit (backup code page)
  # @return generate_two_factor_secret_if_missing! the bang method (!) makes sure that the value is changed at this point from what is gets.
  def new
    if current_user.otp_required_for_login
      flash[:alert] = 'Two Factor Authentication is already enabled.'
      return redirect_to edit_user_registration_path
    end

    current_user.generate_two_factor_secret_if_missing!
  end

  # @param method [valid_password?] is a method from de otp_password check. it check if the password is correct that has been putin
  # @param var [enable_2fa_params] what is it.
  #  password is the password put in the form field password.
  #  code is the code put in the form field code.
  # @param method [validate_and_consume_otp] checks if the code is correct and use it
  # @return render the new page two times
  # @return send to edit (backup code page)
  # @return set enable_two_factor to true

  def create
    unless current_user.valid_password?(enable_2fa_params[:password])
      flash.now[:alert] = 'Incorrect password'
      return render :new
    end

    if current_user.validate_and_consume_otp!(enable_2fa_params[:code])
      current_user.enable_two_factor!

      flash[:notice] = 'Successfully enabled two factor authentication, please make note of your backup codes.'
      redirect_to edit_two_factor_settings_path
    else
      flash.now[:alert] = 'Incorrect Code'
      render :new
    end
  end

  # edit is they page for showing the backup codes. so everything here has to do with the backup code list.



  def edit
    unless current_user.otp_required_for_login
      flash[:alert] = 'Please enable two factor authentication first.'
      return redirect_to new_two_factor_settings_path
    end

    if current_user.two_factor_backup_codes_generated?
      flash[:alert] = 'You have already seen your backup codes.'
      return redirect_to edit_user_registration_path
    end

    @backup_codes = current_user.generate_otp_backup_codes!
    current_user.save!
  end

  def generateFile
    @data = restyle_backup
    send_data @data, filename: "backup_code.txt", type: "text/plain", disposition: 'attachment'
  end

  def destroy
    if current_user.disable_two_factor!
      flash[:notice] = 'Successfully disabled two factor authentication.'
      redirect_to edit_user_registration_path
    else
      flash[:alert] = 'Could not disable two factor authentication.'
      redirect_back fallback_location: root_path
    end
  end

  private

  def enable_2fa_params
    params.require(:two_fa).permit(:code, :password)
  end

  def restyle_backup
    @styleone = params[:backup_codes]
    @styletwo = @styleone.map { |i| "'" + i.to_s + "'" }.join(",")
    @styletwo.delete!("\n")
    @styletwo.delete!("'")
    @styletwo.gsub!(/,/, "\n")
    return @styletwo
  end

end
