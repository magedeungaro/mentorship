# frozen_string_literal: true

module Identity
  class EmailVerificationsController < ApplicationController
    skip_before_action :authenticate, only: :show

    before_action :set_user, only: :show

    def show
      @user.update! verified: true
      redirect_to root_path, notice: "Thank you for verifying your email address"
    end

    def create
      send_email_verification
      redirect_to root_path, notice: "We sent a verification email to your email address"
    end

    private

    def set_user
      token = EmailVerificationToken.find_signed!(params[:sid])
      @user = token.user
    rescue
      redirect_to edit_identity_email_path, alert: "That email verification link is invalid"
    end

    def send_email_verification
      UserMailer.with(user: Current.user).email_verification.deliver_later
    end
  end
end
