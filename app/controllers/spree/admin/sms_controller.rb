# frozen_string_literal: true

require 'seven_api/client'

module Spree
  module Admin
    class SmsController < Spree::Admin::BaseController
      attr_accessor :user_errors

      def initialize
        super
        @user_errors = []
      end

      def index(user_message = nil)
        @user_message = user_message
        render 'spree/admin/sms'
      end

      def submit
        index(send_sms)
      end

      private

      def build_recipients(as_array = false)
        to = []

        Spree::Address.not_deleted.each { |a|
          Rails.logger.debug a.inspect

          next if !a.deleted_at.nil? && params[:filter_include_deleted_addresses] == '0'
          next if params[:filter_address_country] != '' && params[:filter_address_country] != !a.country_id

          to.push(a.phone)
        }

        if to.empty?
          @user_errors.push(I18n.t 'spree.no_recipients')
        end

        to.uniq!

        as_array ? to : to.join(',')
      end

      def api_key
        if SpreeSeven::Config[:api_key]
          Rails.logger.debug 'ApiKeyFromConfiguration'
          return SpreeSeven::Config[:api_key]
        end
        if ENV['SEVEN_API_KEY_SANDBOX']
          Rails.logger.debug 'SandboxApiKeyFromEnvironment'
          return ENV['SEVEN_API_KEY_SANDBOX']
        end
        if ENV['SEVEN_API_KEY']
          Rails.logger.debug 'ApiKeyFromEnvironment'
          ENV['SEVEN_API_KEY']
        end
      end

      def build_params
        sms_params = params.to_unsafe_h.slice(
          :flash,
          :foreign_id,
          :from,
          :label,
          :no_reload,
          :performance_tracking,
          :text,
        ).merge({ json: true, to: build_recipients })

        Rails.logger.debug sms_params

        sms_params
      end

      def send_sms
        if @user_errors.empty?
          SevenApi::Resources::Sms.new(api_key).retrieve(build_params)
        end
      end
    end
  end
end
