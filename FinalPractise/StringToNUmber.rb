class StringToNumber

  def toString numberString
    result = 0
    flag = 0
    count = 0
    $status = 0
    s_num = {"一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6,  "七" => 7, "八"=> 8, "九"=> 9 }
    m_num = { "十" => 10,"百" => 100, "千" => 1000, "万" => 10**4, "億" => 10**8 }
    l_num = {}
    allowedString = Hash[m_num.to_a.reverse]
    splitString = numberString.chars.to_a

    allowedString.each do |key, value|
      tempArray = []
      if numberString.include? key
        # Lay index cua phan tu
        temp = $status
        $status = numberString.index(key)
        if count != 0
          flag = temp + 1
        end
        for index in flag..splitString.length-1
          if key != splitString[index]
            tempArray.push(splitString[index])
          else
            break
          end
        end
        if tempArray.length > 0
          tempArray = tempArray.reverse
          subResult = 0
          for index in 0..tempArray.length-1
            s_num.each do |k,v|
              subResult += v * 10**index if k == tempArray[index]
            end
          end
          result += value *  subResult
        else
          allowedString.each do |k,v|
            result += v if k == key
          end
        end
        count +=1
      end
    end

    return result
  end

end

numberString = "七百八十"

stringToNumber = StringToNumber.new
puts stringToNumber.toString(numberString)

