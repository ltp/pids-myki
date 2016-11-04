class Card

  attr_reader :id, :link, :holder, :money, :pass

  def initialize( params = {} )
    @id = params[:id]
    @link = params[:link]
    @holder = params[:holder]
    @money = params[:money]
    @pass = params[:pass]
  end

end
