require 'rubygems'
require 'mechanize'
require 'open-uri'

class Myki
  attr_accessor :username,
                :password

  def initialize(username, password)
    @username = params[:username]
    @password = params[:password]
    @agent = Mechanize.new
    @url = {
      'base'    => 'https://www.mymyki.com.au/NTSWebPortal/',
      'account' => 'Registered/MyMykiAccount.aspx?menu=My+myki+account',
      'login'   => 'Login.aspx'
    }
  end

  def _login
    page = @agent.get( @url['base'] + @url['login'] )
    pp page
  end
end
