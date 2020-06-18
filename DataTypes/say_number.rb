class SayNumber
  ichi = "一"
  ni = "二"
  san = "三"
  yon = "四"
  go = "五"
  roku = "六"
  nana = "七"
  hachi= "八"
  kyuu = "九"
  JUU = "十"
  HYAKU = "百"
  SEN = "千"
  MAN = "万"
  OOKU = "億"
  UNIT = ["ZERO", ichi, ni, san, yon, go, roku, nana, hachi, kyuu]

  def sayJuu number
    juu = number / (10)
    juu_zandaka = number % 10
    puts "juu: #{juu}"
    puts "juu_zandaka: #{juu_zandaka}"
    if juu > 0 and juu !=1
      $string += UNIT[juu] + JUU
    elsif juu == 1
      $string += JUU
    else $string += ""
    end
    if juu_zandaka > 0
      $string += UNIT[juu_zandaka]
    elsif juu > 0
      $string += ""
    else $string += "ZERO"
    end
  end
  def sayHyaku number
    hyaku = number / 100
    hyaku_zandaka = number % 100
    puts "hyaku: #{hyaku}"
    puts "hyaku_zandaka: #{hyaku_zandaka}"
    if hyaku > 0 and hyaku != 1
      $string += UNIT[hyaku] + HYAKU
      if hyaku_zandaka > 0
        sayJuu hyaku_zandaka
      else $string += ""
      end
    elsif hyaku == 1
      $string += HYAKU
      if hyaku_zandaka > 0
        sayJuu hyaku_zandaka
      else
        $string += ""
      end
    else
      $string += ""
      sayJuu hyaku_zandaka
    end
  end
  def saySen number
    sen = number / (10**3)
    sen_zandaka = number % (1000)
    puts "sen: #{sen}"
    puts "sen_zandasayHyaku sen_zandakaka: #{sen_zandaka}"
    if sen > 0 and sen != 1
      $string += UNIT[sen] + SEN
      if sen_zandaka > 0
        sayHyaku sen_zandaka
      else $string += ""
      end
    elsif sen == 1
      $string += SEN
      if sen_zandaka > 0
        sayHyaku sen_zandaka
      else $string += ""
      end
    else
      $string += ""
      sayHyaku sen_zandaka
    end
  end

  def sayMan number
    man = number / (10**4)
    man_zandaka = number % (10**4)
    puts "man: #{man}"
    puts "man_zandaka: #{man_zandaka}"
    if man > 0 and man < 10
      $string += UNIT[man] + MAN
      if man_zandaka > 0
        saySen man_zandaka
      else $string += ""
      end
    else
      if man > 0
        saySen man
        $string += MAN
        if man_zandaka > 0
          saySen man_zandaka
        else $string += ""
        end
      else $string += ""
      if man_zandaka > 0
        saySen man_zandaka
      else $string += ""
      end
      end
    end
  end

  def sayNumber number
    if number == 0
      $string += "ZERO"
      return
    end
    oku = number / (10**8)
    oku_zandaka = number % (10**8)
    puts "oku: #{oku}"
    puts "oku_zandaka: #{oku_zandaka}"
    if oku > 0 and oku < 10
      $string += UNIT[oku] + OOKU
      if oku_zandaka > 0
        sayMan oku_zandaka
      else $string += ""
      end
    else
      if oku >= 10
        sayMan oku
        $string += OOKU
        if oku_zandaka > 0
          sayMan oku_zandaka
        else $string += ""
        end
      else $string += ""
      if oku_zandaka > 0
        sayMan oku_zandaka
      else $string += ""
      end
      end
    end
  end
end
$string = ""
say = SayNumber.new
num = 1111111111111110
say.sayNumber num
puts $string
