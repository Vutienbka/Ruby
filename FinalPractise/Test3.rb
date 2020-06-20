class StringToNumber
  def toString numberString
    result = 0
    count = 0
    $status = 0
    s_num = {"一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6,  "七" => 7, "八"=> 8, "九"=> 9 }
    m_num = { "十" => 10,"百" => 100, "千" => 1000, "万" => 10**4, "億" => 10**8, "兆" => 10**12, "京" => 10**16,
              "垓" => 10**20, "𥝱" => 10**24, "穣" => 10**28, "溝" => 10**32, "澗" => 10**36, "正" => 10**40,
              "載" => 10**44, "極" => 10**48, "恒河沙" => 10**52}
    allowedString = Hash[m_num.to_a.reverse]
    allowedString.each do |key, value|
      if numberString.include? key
        # Lay index cua phan tu
        $status = numberString.index(key)
        tempArray = numberString[0,$status].chars.to_a
        numberString = numberString[$status + 1, numberString.length - 1]
        puts numberString
        if tempArray.length > 0
          tempArray = tempArray.reverse
          subResult = 0
          check = true
          m_num.each do |ke,va|
            if tempArray.include? ke
              check = false
              break
            end
          end
          # neu check = true tuc la tempArray khong chua cac ky tu 百 chang han
          if check
            for index in 0..tempArray.length-1
              s_num.each do |k,v|
                if k == tempArray[index]
                  subResult += v * 10**index
                end
              end
            end
            result += value *  subResult
          else
            tempArray = tempArray.join.reverse
            result += value * (toString tempArray)
          end
        else
          allowedString.each do |k,v|
            result += v if k == key
          end
        end
        count +=1
      end
    end
    if numberString.length > 0
      subString = numberString.chars.to_a
      for index in 0..subString.length-1
        s_num.each do |k,v|
          if k == subString[index]
            result += v * 10**index
          end
        end
      end
    end
    return result
  end
end
numberString = "九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"
stringToNumber = StringToNumber.new
puts stringToNumber.toString(numberString)

s1 = "99999999999999999999"
s2 = "99999999999999999999"
puts s1.eql? s2