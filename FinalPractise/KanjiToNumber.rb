class StringToNumber
  def toString numberString
    result = 0
    count = 0
    $status = 0
    s_num = {"一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6,  "七" => 7, "八"=> 8, "九"=> 9 }
    m_num = { "十" => 10,"百" => 100, "千" => 1000, "万" => 10**4, "億" => 10**8 }
    l_num = {}
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
numberString = "一億一千百十一万一千百十一"
stringToNumber = StringToNumber.new
puts stringToNumber.toString(numberString)

