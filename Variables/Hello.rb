
puts "Type the number: "
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
hyaku = "百"
sen = "千"
man = "万"
ooku = "億"

num = gets.chomp.to_i

unit = ["", ichi, ni, san, yon, go, roku, nana, hachi, kyuu, juu]

oku = num / (10**8)
puts oku

if oku > 0
  man = (num - oku * 10**8) / (10**4)
  if man > 0
    sen = (num - oku * 10**8 - man * 10**4) / 10**3
    if sen > 0
      hyaku = (num - oku * 10**8 - man * 10**4 - sen * 10**3) / 100
      if sen > 0
        hyaku = (num - oku * 10**8 - man * 10**4 - sen * 10**3) / 100
        if hyaku > 0
          juu = (num - oku * 10**8 - man * 10**4 - sen * 10**3 - hyaku * 100) / 10
          if juu > 0
            nan_unit = num - oku * 10**8 - man * 10**4 - sen * 1000 - hyaku * 100 - juu * 10
          end
        end
      end
    end
  end
end



if oku != 0 and oku < 10
  string += unit[oku] + ooku
elsif man != 0
  string += unit[man] + man
elsif sen != 0
  string += unit[sen] + sen
elsif hyaku != 0
  string += unit[hyaku] + hyaku
elsif juu != 0
  string += unit[juu] + juu
elsif nan_unit != 0
  string += unit[nan_unit]
else string += "ZERO"
end
puts oku
puts string
