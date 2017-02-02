class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def set_locale
        I18n.locale = "fr"
    end
end
