
ICHI = "一"
NI = "二"
SAN = "三"
YON = "四"
GO = "五"
ROKU = "六"
NANA = "七"
HACHI = "八"
KYUU = "九"
JUU = "十"
HYAKU = "百"
SEN = "千"
MAN = "万"
OKU = "億"

unit = ["", ICHI, NI, SAN, YON, GO, ROKU, NANA, HACHI, KYUU, JUU]

print "Type the number: "
num = gets.chomp.to_i

  oku = num / (10**8)
  man = (num - oku * 10**8) / (10**4)
  sen = (num - oku * 10**8 - man * 10**4) / 10**3
  hyaku = (num - oku * 10**8 - man * 10**4 - sen * 10**3) / 100
  juu = (num - oku * 10**8 - man * 10**4 - sen * 10**3 - hyaku * 100) / 10
  nanunit = num - oku * 10**8 - man * 10**4 - sen * 10**3 - hyaku*100 - juu * 10

  string = ""
  if oku != 0 and oku < 10
    string += unit[oku] + OKU
  elsif man != 0
    string += unit[man] + MAN
  elsif sen != 0
    string += unit[sen] + SEN
  elsif hyaku != 0
    string += unit[hyaku] + HYAKU
  elsif juu != 0
    string += unit[juu] + JUU
  elsif nanunit != 0
    string += unit[nanunit]
  else string += "ZERO"
  end



