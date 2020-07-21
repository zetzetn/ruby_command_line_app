# message_dialog.rbの読み込み
require './message_dialog'

class GamesController
  # MessageDialogモジュールのinclude
  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    # 初期値を表示
    initial_message(params)

    # 戦闘開始
    loop do

    # コマンドメッセージ、コマンド追加  
    puts <<~EOS
    コマンド？
    1：攻撃 2：道具　3：防御　4：逃げる

    EOS

    # コマンド入力 数値でコンソールから入力を受け取る
    command_num = gets.chomp.to_i

    # 条件分岐 
      if command_num==1 # 攻撃
        @brave.attack(@monster)
        break if battle_end?
        @monster.attack(@brave)
        break if battle_end?
 
      elsif command_num==2 # 道具
        item_message(params)
        # コマンド入力 数値でコンソールから入力を受け取る
          item_num = gets.chomp.to_i
            if item_num==11 # 薬草
            
              # ゆうしゃ　回復メソッド　
              @monster.attack(@brave)
              break if battle_end?

            elsif item_num==12 # 魔道士の杖

                # ゆうしゃ　道具ダメージメソッド
              @monster.attack(@brave)
              break if battle_end?
            else
              puts "コマンドを入力して下さい"
              puts ""
            end

      elsif command_num==3 # 防御

        #会心の一撃2倍に改修予定
        @monster.deffence(@brave)
        break if battle_end?

      elsif command_num==4 # 逃げる
        run_away_message(params)
        run_away_end

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

    # 逃げるメソッド
    def run_away_end
      exit
    end

end
