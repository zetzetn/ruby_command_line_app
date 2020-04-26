class Brave
  # 複数の値を同時に指定することができる
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  # 引数に**を記述：ハッシュしか受け取れなくなる
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# パラメータの値をinitializeに渡す
brave = Brave.new(name:"テリー", hp:500, offense:150, defense:100)


  # ヒアドキュメント
  puts <<~TEXT
  NAME:#{brave.name}
  HP:#{brave.hp}
  OFFENSE:#{brave.offense}
  DEFFENSE:#{brave.defense}
  TEXT

  brave.hp -= 30

  puts "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"
