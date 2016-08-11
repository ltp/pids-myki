class Card

  def initialize( params = {} )
    @id = params[:id]
    @link = params[:link]
    @holder = params[:holder]
    @money = params[:money]
    @pass = params[:pass]
  end

end
