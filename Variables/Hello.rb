
  ichi = "一"
  ni = "二"
  san = "三"
  yon = "四"
  go = "五"
  roku = "六"
  nana = "七"
  hachi= "八"
  kyuu = "九"
  juu = "十"
  HYAKU = "百"
  SEN = "千"
  MAN = "万"
  OOKU = "億"
  UNIT = ["", ichi, ni, san, yon, go, roku, nana, hachi, kyuu, juu]
  $string = ""

  def sayNumber (number)
    oku = number / (10**8)
    oku_zandaka = number % (10**8)
    if oku >0 and oku < 10
      $string += UNIT[oku] + OOKU
      sayMan(oku_zandaka)
    end
  end

  def sayMan (number)
    man = number / (10**4)
    man_zandaka = number % (10**4)
    if (man > 0)
      $string += UNIT[man] + MAN
      saySen(man_zandaka)
    end
  end

  def saySen (number)
    sen = number / (10**3)
    sen_zandaka = number % (1000)
    if (sen > 0)
      $string += UNIT[sen] + SEN
      sayHyaku(sen_zandaka)
    end
  end

  def sayHyaku (number)
    hyaku = number / (100)
    hyaku_zandaka = number % (10**3)
    if (hyaku > 0)
      $string += UNIT[hyaku] + HYAKU
      sayJuu(hyaku_zandaka)
    end
  end

  def sayJuu (number)
    juu = number / (10)
    juu_zandaka = number % (10)
    if (man > 0)
      $string += UNIT[juu] + HYAKU
      sayMan(hyaku_zandaka)
    end
    if juu_zandaka > 0
      $string += UNIT[juu_zandaka]
    else
      $string += ""
    end
  end

  puts "Type the number: "
  num = gets.chomp.to_i
puts $string