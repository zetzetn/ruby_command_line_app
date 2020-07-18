module MessageDialog

  #  # 初期ステータスと現れた敵の表示
  # def initial_message(**params)
  #??@brave = params[:brave]
  #   target = params[:target]

  #   puts "#{target.name}"
  #   # puts terry
  #   # @brave.show
  #   # @monster.show

  # end

  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts ""
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ

    EOS
  end

 # 防御メッセージ
  def deffence_message(**params)
    target = params[:target]


    puts <<~EOS

    #{target.name}は身の守りを固めた

    #{target.name}はダメージを受けない
    EOS
  end

   # にげるメッセージ
   def run_away_message(brave:,monster:)
    # target = params[:target]
    # damage = params[:damage]
    # 逃げ出した

    # @brave = params[:brave]

    puts <<~EOS
    #{brave.name}は逃げ出した
 

    EOS
  end

  # 戦闘終了時のメッセージ
  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS
    else
      puts <<~EOS

      勇者はまけた
      目の前が真っ暗になった

      EOS
    end
  end

    # 変身時のメッセージ
  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS

    #{origin_name}は怒っている
    #{origin_name}は#{transform_name}に変身した

    EOS
  end
end
