#TODO: implement
print "Type the number: "
num = gets.chomp()
thousand = num / 1000
hundred = (num - thousand * 1000) / 100
tensDigit = (num - thousand * 1000 - hundred * 100) / 10
unit = num - thousand * 1000 - hundred * 100 - tensDigit * 10
# Dung hash de luu tru key, value
# Nhu key: ONE thi value la 1
ONE = 1
TWO = 2
THREE = 3
FOUR = 4
FiVE = 5
SIX = 6
SEVEN = 7
EIGHT = 8
NINE = 9


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


case thousand
when ONE
  thousandRead = ICHI
when TWO
  thousandRead = NI
when THREE
  thousandRead = SAN
when FOUR
  thousandRead = YON
when FIVE
  thousandRead = GO
when SIX
  thousandRead = ROKU
when SEVEN
  thousandRead = NANA
when EIGHT
  thousandRead = HACHI
when NINE
  thousandRead = KYUU
else
  thousandRead = ""
end
case hundred
when ONE
  hundredRead = ICHI
when TWO
  hundredRead = NI
when THREE
  hundredRead = SAN
when FOUR
  hundredRead = YON
when FIVE
  hundredRead = GO
when SIX
  hundredRead = ROKU
when SEVEN
  hundredRead = NANA
when EIGHT
  hundredRead = HACHI
when NINE
  hundredRead = KYUU
else
  thousandRead = ""
end

case unit
when ONE
  unitRead = ICHI
when TWO
  unitRead = NI
when THREE
  unitRead = SAN
when FOUR
  unitRead = YON
when FIVE
  unitRead = GO
when SIX
  unitRead = ROKU
when SEVEN
  unitRead = NANA
when EIGHT
  unitRead = HACHI
when NINE
  unitRead = KYUU
else
  unitRead = ""
end

tensDigitRead
case tensDigit
when ONE
  tensDigitRead = "十"
when TWO
  tensDigitRead = "二十"
when THREE
  tensDigitRead = "三十"
when FOUR
  tensDigitRead = "四十"
when FiVE
  tensDigitRead = "五十"
when SIX
  tensDigitRead = "六十"
when SEVEN
  tensDigitRead = "七十"
when EIGHT
  tensDigitRead = "八十"
when NINE
  tensDigitRead = "九十"
else
  tensDigitRead = ""
end


