def toString string
  unit = { "一" => "1", "二" => "2", "三" => "3", "四" => "4", "五" => "5", "六" => "6", "七" => "7", "八"=> "8", "九"=> "9", "一" => "1", "二" => "2", "三" => "3", "四" => "4", "五" => "5", "六" => "6", "七" => "7", "八"=> "8", "九"=> "9"}
  juu = "十"
  hyaku = "百"
  sen = "千"
  man = "万"
  ooku = "億"
  if string.length <= 3
  end
  splitString = string.split("")
  numberString = ""
  splitString.each do |e|
    unit.each do |key, value|
      if e==key
        numberString+= unit.fetch(key)
      end
    end
  end
  return numberString
end

string = "十二"

puts toString string