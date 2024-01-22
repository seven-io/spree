module Spree
  module Admin
    class SevenSettingsController < ResourceController
      def update
        settings = Spree::SevenSetting.new

        preferences = params&.key?(:preferences) ? params.delete(:preferences) : params
        preferences.each do |name, value|
          next unless settings.has_preference? name
          settings[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t('seven.settings'))

        redirect_to edit_admin_seven_settings_path
      end
    end
  end
end
