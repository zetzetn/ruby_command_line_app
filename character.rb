# message_dialogの読み込み
require './message_dialog'

class Character
  # MessageDialogのインクルード
  include MessageDialog

  attr_reader :offense, :defense
  attr_accessor :hp, :name, :item1, :item2

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @item1 = params[:item1]
    @item2 = params[:item2]
  end
end
