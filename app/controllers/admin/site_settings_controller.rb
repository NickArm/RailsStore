module Admin
    class SiteSettingsController < ApplicationController
      before_action :authenticate_admin
  
      def index
        @settings = {
          logo: Setting.find_by(key: 'logo_image')&.logo_image&.attached? ? url_for(Setting.find_by(key: 'logo_image').logo_image) : 'default_logo_url',
          name: Setting.find_by(key: 'site_name')&.value || 'Default Site Name',
          description: Setting.find_by(key: 'site_description')&.value || 'Default Site Description',
          admin_email: Setting.find_by(key: 'admin_contact_email')&.value || 'admin@example.com'
        }
      end
  
      def update
        if params[:logo].present?
          logo_setting = Setting.find_or_initialize_by(key: 'logo_image')
          logo_setting.logo_image.attach(params[:logo])
          logo_setting.save
        end
  
        update_setting('site_name', params[:name])
        update_setting('site_description', params[:description])
        update_setting('admin_contact_email', params[:admin_email])
  
        redirect_to admin_site_settings_path, notice: 'Settings updated successfully.'
      end
  
      private
  
      def update_setting(key, value)
        return if value.blank?
  
        setting = Setting.find_or_initialize_by(key: key)
        setting.update(value: value)
      end
    end
  end
  