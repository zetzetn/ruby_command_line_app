# message_dialog.rbの読み込み
require './message_dialog'

class GamesController
  # MessageDialogモジュールのinclude
  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    # 戦闘開始
    loop do

    # コマンドメッセージ、コマンド追加  
    puts <<~EOS
    コマンド？
    1：攻撃 2：防御　3：逃げる

    EOS

    # コマンド入力 数値でコンソールから入力を受け取る
    command_num = gets.chomp.to_i


    # 条件分岐追加  
       
      if command_num==1 # 攻撃
        @brave.attack(@monster)
        break if battle_end?
        @monster.attack(@brave)
        break if battle_end?
    
      elsif command_num==2 # 防御



      else
        puts "コマンドを入力して下さい"
        puts ""
      end

    end
    battle_judgment
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def brave_win?
      @brave.hp > 0
    end

    def battle_judgment
      result = calculate_of_exp_and_gold

      # end_messageを呼び出す
      end_message(result)
    end

    def calculate_of_exp_and_gold
      if brave_win?
        brave_win_flag = true
        exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
        gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      else
        brave_win_flag = false
        exp = 0
        gold = 0
      end

      {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
    end
end
