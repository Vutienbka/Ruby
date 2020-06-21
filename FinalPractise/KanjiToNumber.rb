require 'test/unit'
class StringToNumber
  def toNumber numberString
    result = 0
    $indexOfCurrentMnum = 0
    s_num = {"零" => 0, "一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6,  "七" => 7, "八"=> 8, "九"=> 9 }
    m_num = { "十" => 10,"百" => 100, "千" => 1000, "万" => 10**4, "億" => 10**8, "兆" => 10**12, "京" => 10**16,
              "垓" => 10**20, "𥝱" => 10**24, "穣" => 10**28, "溝" => 10**32, "澗" => 10**36, "正" => 10**40, "載" => 10**44,
              "極" => 10**48, "恒河沙" => 10**52, "阿僧祇" => 10**56, "那由他" => 10**60, "不可思議" => 10**64, "無量大数" => 10**68}
    allowedString = Hash[m_num.to_a.reverse]
    allowedString.each do |key, value|
      if numberString.include? key
        key.length == 1 ? $indexOfCurrentMnum = numberString.index(key): (key.length == 3 ? $indexOfCurrentMnum = numberString.index(key) + 2 : $indexOfCurrentMnum = numberString.index(key) + 3)
        key.length == 1 ? tempArray = numberString[0,$indexOfCurrentMnum].chars.to_a : (key.length == 3 ? tempArray = numberString[0,$indexOfCurrentMnum-2].chars.to_a : tempArray = numberString[0,$indexOfCurrentMnum-3].chars.to_a)
        numberString = numberString[$indexOfCurrentMnum + 1, numberString.length - 1]
        if tempArray.length > 0
          tempArray = tempArray.reverse
          subResult = 0
          check = false
          m_num.each_key do |ke|
            if tempArray.include? ke
              check = true
              break
            end
          end
          if !check
            for index in 0..tempArray.length-1
              s_num.each do |k,v|
                subResult += v * 10**index if k == tempArray[index]
              end
            end
            result += value *  subResult
          else
            tempArray = tempArray.join.reverse
            result += value * (toNumber tempArray)
          end
        else
          allowedString.each do |k,v|
            result += v if k == key
          end
        end
      end
    end
    if numberString.length > 0
      subString = numberString.chars.to_a
      for index in 0..subString.length-1
        s_num.each do |k,v|
          result += v * 10**index if k == subString[index]
        end
      end
    end
    return result
  end
end

numberString = "九千九百九十九万九千九百九十九"
stringToNumber = StringToNumber.new
puts stringToNumber.toNumber(numberString)
s1 = "99999999"
s2 = "99999999"
puts s1.eql? s2