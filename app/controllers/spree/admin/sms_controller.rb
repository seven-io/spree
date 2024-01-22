# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module Spree
  module Admin
    class SmsController < Spree::Admin::BaseController
      attr_accessor :user_errors

      def initialize
        super
        @user_errors = []
      end

      def index
        render 'spree/admin/sms/index'
      end

      def submit
        @user_message = send_sms
        render json: {'response': @user_message}
      end

      private

      def build_recipients(as_array = false)
        if params[:to] != ''
          return as_array ? [params[:to]] : params[:to]
        end

        to = []

        Spree::Address.not_deleted.each { |a|
          Rails.logger.info a.inspect

          next if !a.deleted_at.nil? && params[:filter_include_deleted_addresses] == '0'
          next if params[:filter_address_country] != '' && params[:filter_address_country] != !a.country_id

          to.push(a.phone)
        }

        if to.empty?
          @user_errors.push(I18n.t 'spree.seven.no_recipients')
        end

        to.uniq!

        as_array ? to : to.join(',')
      end

      def api_key
        source = nil
        value = nil

        if Spree::Seven::Config[:api_key]
          source = 'Configuration'
          value = Spree::Seven::Config[:api_key]
        elsif ENV['SEVEN_API_KEY_SANDBOX']
          source = 'Environment (Sandbox)'
          value = ENV['SEVEN_API_KEY_SANDBOX']
        elsif ENV['SEVEN_API_KEY']
          source = 'Environment (Live)'
          value = ENV['SEVEN_API_KEY']
        end

        Rails.logger.info "seven api_key: #{value} from #{source}"

        value
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
        ).merge({ to: build_recipients })

        Rails.logger.info sms_params

        sms_params
      end

      def send_sms
        if @user_errors.empty?
          uri = URI('https://gateway.seven.io/api/sms')

          res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
            req = Net::HTTP::Post.new(uri)
            req['Accept'] = 'application/json'
            req['Content-Type'] = 'application/json'
            req['X-Api-Key'] = api_key
            req.body = build_params.to_json

            http.request req
          end

          Rails.logger.info res.body

          # flash[:success] = res.body

          res.body
        else
          Rails.logger.info 'FoundUserErrors'
        end
      end
    end
  end
end
