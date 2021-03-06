module MessageDialog

  # 初期ステータスと現れた敵の表示
  def initial_message(brave:,monster:)

    TermColor.blue
    puts <<~EOS
    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    NAME:#{brave.name}
    HP:#{brave.hp}
    OFFENSE:#{brave.offense}
    DEFENSE:#{brave.defense}
    ITEM1:#{brave.item1}
    ITEM2:#{brave.item2}
    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    EOS
    TermColor.reset

    puts <<~EOS
    #{monster.name}が現れた！

    EOS

  end

  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts ""
    TermColor.yellow
    puts "必殺攻撃" if attack_type == "special_attack"
    TermColor.reset
  end

  def item_attack_message(**params)
    attack_type = params[:attack_type]

    TermColor.yellow
    puts "#{@name}は#{@item2}を使った"
    puts ""
    TermColor.reset
  end

  def item_using_message(**params)
    attack_type = params[:attack_type]

    TermColor.cyan
    puts "#{@name}は#{@item1}を使った"
    puts "#{@name}のHPは#{@hp}に回復した"
    puts ""
    TermColor.reset
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ

    EOS
  end

   # 道具メッセージ
   def item_message(brave:,monster:)

    puts <<~EOS
    アイテム？
    　11:#{brave.item1}
    　12:#{brave.item2}

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

    puts <<~EOS
    #{brave.name}は逃げ出した
    EOS
  end

  # 戦闘終了時のメッセージ
  def end_message(result)
    if result[:brave_win_flag]

      TermColor.magenta
      puts <<~EOS

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS
      TermColor.reset
    else
      TermColor.red
      puts <<~EOS

      勇者はまけた
      目の前が真っ暗になった

      EOS
      TermColor.reset
    end
  end

    # 変身時のメッセージ
  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS
    #{origin_name}は怒っている
    EOS
    TermColor.cyan
    puts <<~EOS
    #{origin_name}は#{transform_name}に変身した
    EOS
    TermColor.reset
  end
end
