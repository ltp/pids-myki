require 'rubygems'
require 'mechanize'
require 'open-uri'

class Myki
  attr_accessor :username,
                :password

  def initialize( params = {} )
    @username = params[:username]
    @password = params[:password]
    @agent = Mechanize.new
    @url = {
      'base'    => 'https://www.mymyki.com.au/NTSWebPortal/',
      'account' => 'Registered/MyMykiAccount.aspx?menu=My+myki+account',
      'login'   => 'Login.aspx'
    }

    _login()
  end

  def _login
    page = @agent.get( @url['base'] + @url['login'] )
    form = page.form('aspnetForm')
    form['ctl00$uxContentPlaceHolder$uxUsername'] = @username
    form['ctl00$uxContentPlaceHolder$uxPassword'] = @password
    submit_button = form.button_with( :value => 'Login' )

    page = @agent.submit(form, submit_button )
    form = page.form('aspnetForm')
    page = @agent.post( @url['base'] + @url['account'],
                        { :__VIEWSTATE            => form['__VIEWSTATE'],
                          :__EVENTVALIDATION      => form['__EVENTVALIDATION'],
                          :__EVENTTARGET          => 'ctl00$uxContentPlaceHolder$uxTimer',
                          :'ctl00$ScriptManager1' => 'ctl00$uxContentPlaceHolder$Panel|ctl00$uxContentPlaceHolder$uxTimer',
                        }
	)

    cards = page.css('#ctl00_uxContentPlaceHolder_uxMyCards td')
    cards_l = page.css('#ctl00_uxContentPlaceHolder_uxMyCards a')

    i = 0
    for j in (0..((cards.length / 4) - 1))
      id = cards[i].text.strip
      puts cards[i].keys
      link = cards_l[j]['href']
      holder = cards[i+1].text.strip
      money = cards[i+2].text.strip
      pass = cards[i+3].text.strip
      puts "id #{id} - link #{link} - holder #{holder} - money #{money} - pass #{pass}"
      i+=4
    end

#    puts "=== page ==="
#    pp page
#    puts "\n"

#    puts "=== body ==="
#    puts page.body
#    puts "\n"

#    puts "=== done ==="

  end

end

