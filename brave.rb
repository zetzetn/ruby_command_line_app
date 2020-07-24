require './character'

class Brave < Character

  SPECIAL_ATTACK_CONSTANT = 1.5
  ITEM_ATTACK_CONSTANT = 3.0

  # 攻撃コマンド
  def attack(monster)
    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    # attack_typeを引数に渡す
    attack_message(attack_type: attack_type)
    damage_message(target: monster, damage: damage)
  end

    # 回復アイテム使用
    def use_healing_item(brave)
      attack_type = "use_healing_item" #攻撃タイプを選択
      damage = calculate_item_healing(target: brave, attack_type: attack_type)
      cause_damage(target: brave, damage: damage)
      item_using_message(attack_type: attack_type)

  end

    # アイテム攻撃
  def item_attack(monster)
      attack_type = "item_attack" #攻撃タイプを選択
      damage = calculate_item_damage(target: monster, attack_type: attack_type)
      cause_damage(target: monster, damage: damage)
  
      # attack_typeを引数に渡す
      item_attack_message(attack_type: attack_type)
      damage_message(target: monster, damage: damage)
  end

  private
    def decision_attack_type
      attack_num = rand(4)

      if attack_num == 0
        # "必殺攻撃"
        "special_attack"
      else
        # "通常攻撃"
        "normal_attack"
      end
    end

    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
    end

    def calculate_item_healing(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      return -(250)
      # if attack_type == "use_healing_item"
      #   @hp+300
      # else
      #   @hp+300
      # end
    end

    def calculate_item_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "item_attack"
        calculate_item_attack - target.defense
      else
        @offense - target.defense
      end
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
    end

    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
    end

    # アイテム攻撃計算
    def calculate_item_attack
      @offense * ITEM_ATTACK_CONSTANT
    end
end
