# 標準出力に色をつける
class TermColor
  class << self
    # 色を解除
    def reset   ; c 0 ; end 

    # 各色
    def red     ; c 31; end 
    def green   ; c 32; end 
    def yellow  ; c 33; end 
    def blue    ; c 34; end 
    def magenta ; c 35; end 
    def cyan    ; c 36; end 
    def white   ; c 37; end

    # カラーシーケンスを出力する
    def c(num)
      print "\e[#{num.to_s}m"
    end 
  end 
end