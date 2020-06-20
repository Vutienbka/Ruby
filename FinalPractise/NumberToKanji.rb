
def to_Kansuji number
  unit = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九"]
  juu = "十"
  hyaku = "百"
  sen = "千"
  man = "万"
  ooku = "億"
  chou = "兆"
  kei = "京"
  gai = "垓"
  jo = "𥝱"
  joo = "穣"
  koo = "溝"
  kan = "澗"
  sei = "正"
  sai = "載"
  goku = "極"
  googasha = "恒河沙"
  asoogi = "阿僧祇"
  nayuta = "那由他"
  fukashigi = "不可思議"
  muryootaisuu = "無量大数"
  if number <= 0
    return "〇"
    elsif number < 20
    return unit[number]
  elsif number < 100
    return to_Kansuji(number / 10) + juu + to_Kansuji(number % 10)
  elsif number < 200
    return hyaku + to_Kansuji(number % 100)
  elsif number < 1000
    return to_Kansuji(number / 100) + hyaku + to_Kansuji(number % 100)
  elsif number < 2000
    return sen + to_Kansuji(number % 1000)
  elsif number < 10**4
    return to_Kansuji(number / 1000) + sen + to_Kansuji(number % 1000)
  elsif number < 10**8
    return to_Kansuji(number / 10**4) + man + to_Kansuji(number % 10**4)
  elsif number < 10**12
    return to_Kansuji(number / 10**8) + ooku + to_Kansuji(number % 10**8)
  elsif number < 10**16
    return to_Kansuji(number / 10**12) + chou + to_Kansuji(number % 10**12)
  elsif number < 10**20
    return to_Kansuji(number / 10**16) + kei + to_Kansuji(number % 10**16)
  elsif number < 10**24
    return to_Kansuji(number / 10**20) + gai + to_Kansuji(number % 10**20)
  elsif number < 10**28
    return to_Kansuji(number / 10**24) + jo + to_Kansuji(number % 10**24)
  elsif number < 10**32
    return to_Kansuji(number / 10**28) + joo + to_Kansuji(number % 10**28)
  elsif number < 10**36
    return to_Kansuji(number / 10**32) + koo + to_Kansuji(number % 10**32)
  elsif number < 10**40
    return to_Kansuji(number / 10**36) + kan + to_Kansuji(number % 10**36)
  elsif number < 10**44
    return to_Kansuji(number / 10**40) + sei + to_Kansuji(number % 10**40)
  elsif number < 10**48
    return to_Kansuji(number / 10**44) + sai + to_Kansuji(number % 10**44)
  elsif number < 10**52
    return to_Kansuji(number / 10**48) + goku + to_Kansuji(number % 10**48)
  elsif number < 10**56
    return to_Kansuji(number / 10**52) + googasha + to_Kansuji(number % 10**52)
  elsif number < 10**60
    return to_Kansuji(number / 10**56) + asoogi + to_Kansuji(number % 10**56)
  elsif number < 10**64
    return to_Kansuji(number / 10**60) + nayuta + to_Kansuji(number % 10**60)
  elsif number < 10**68
    return to_Kansuji(number / 10**64) + fukashigi + to_Kansuji(number % 10**64)
  else
    return muryootaisuu
  end
end
puts to_Kansuji 99999999999999999999999999999999999999999999999999999999999999999999