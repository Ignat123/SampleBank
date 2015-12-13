require 'net/http'
require 'uri'

class CreditAdministrateController < ApplicationController
  before_filter :check_is_manage

  def check_is_manage
    raise() if User.find(session[:user_id]).role_id != 2
  end

  def index
    @applyment_credits = ClientCredit.where(credit_state: 0).page(params[:applyment_credits_page].to_i)
    @opened_credits = ClientCredit.where(credit_state: 1).page(params[:opened_credits_page].to_i)
    @closed_credits = ClientCredit.where(credit_state: 3).page(params[:closed_credits_page].to_i)
    @declined_credits = ClientCredit.where(credit_state: 4).page(params[:declined_credits_page].to_i)
  end

  def applyment
    @client_credit = ClientCredit.find(params[:id])
  end

  def current_credit
    @client_credit = ClientCredit.find(params[:id])
  end

  def close
    ClientCredit.find(params[:id]).update_attributes(credit_state: 3)
    redirect_to credit_administrate_index_path
  end

  def applyment_confirmation
    client_credit = ClientCredit.find(params[:id])
    # client_credit.update_attributes(credit_state: 1, begin_date: Date.today)
    create_account(client_credit)
     redirect_to credit_administrate_index_path
  end

  def applyment_decline
    ClientCredit.find(params[:id]).update_attributes(credit_state: 4)
    redirect_to credit_administrate_index_path
  end

  def create_account(client_credit)
    uri = URI.parse("http://bank.tarnenok.by/api/accounts/open?typeId=1&currencyId=#{client_credit.credit.currency_id}&clientId=#{client_credit.client.id}&sum=#{client_credit.sum}")
    req = Net::HTTP::Post.new(uri.request_uri)
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    account_hash = JSON.parse(res.body)
    account = Account.find(account_hash['id'])
    account.update_attributes(credit_id: client_credit.id)
  end

end

