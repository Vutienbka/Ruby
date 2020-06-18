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
UNIT = ["", ichi, ni, san, yon, go, roku, nana, hachi, kyuu]


def sayNumber number
  n = number / 100
  sodu = number % 100

  puts n
  puts sodu
  if n > 0
    $string += UNIT[n] + HYAKU

    sayChuc(sodu)
  else
    sayChuc(sodu)
  end

end

def sayChuc(number)
  n = number / 10
  if n > 0
    $string += UNIT[n] + JUU
  end
  $string += UNIT[number%10]
end


number = 156
$string = ""
sayNumber number
puts $string


