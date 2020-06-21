class StringToNumber
  def toString numberString
    result = 0
    flag = 0
    $indexOfCurrentMnum = 0
    s_num = {"零" => 0, "一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6,  "七" => 7, "八"=> 8, "九"=> 9 }
    m_num = { "十" => 10,"百" => 100, "千" => 1000, "万" => 10**4, "億" => 10**8, "兆" => 10**12, "京" => 10**16,
              "垓" => 10**20, "𥝱" => 10**24, "穣" => 10**28, "溝" => 10**32, "澗" => 10**36, "正" => 10**40, "載" => 10**44,
              "極" => 10**48, "恒河沙" => 10**52, "阿僧祇" => 10**56, "那由他" => 10**60, "不可思議" => 10**64, "無量大数" => 10**68}
    allowedString = Hash[m_num.to_a.reverse]
    allowedString.each do |key, value|
      if numberString.include? key
        # Lay index cua phan tu m_num hien tai
        if key.length == 1
          $indexOfCurrentMnum = numberString.index(key)
        elsif key.length == 3
          $indexOfCurrentMnum = numberString.index(key) + 2
        else $indexOfCurrentMnum = numberString.index(key) + 3
        end
        # Cat chuoi dung truoc phan tu m_num luu vao mang ky tu tempArray
        if key.length == 1
        tempArray = numberString[0,$indexOfCurrentMnum].chars.to_a
        elsif key.length == 3
          tempArray = numberString[0,$indexOfCurrentMnum-2].chars.to_a
        else tempArray = numberString[0,$indexOfCurrentMnum-3].chars.to_a
        end
        # Cap nhat lai chuoi numberString sau khi cat chuoi phia truoc phan tu m_num
        numberString = numberString[$indexOfCurrentMnum + 1, numberString.length - 1]
        # chuoi tempArray se co hai truong hop xay ra hoac la Rong hoac khong Rong
        if tempArray.length > 0
          # Dao nguoc chuoi de tinh toan gia tri cua chuoi
          tempArray = tempArray.reverse
          subResult = 0
          check = false
          m_num.each do |ke,va|
            if tempArray.include? ke
              check = true
              break
            end
          end
          # Neu check = false tuc la tempArray khong chua cac ky tu m_num 百 chang han
          # tuc la temArray chi chua cac k tu s_num
          # Ta co the tinh toan nhu so 1230 = 1*10^3 + 2*10^2 + 3*10^1 + 0+10^0
          if !check
            for index in 0..tempArray.length-1
              s_num.each do |k,v|
                subResult += v * 10**index if k == tempArray[index]
              end
            end
            result += value *  subResult
            # Neu tempArray chua phan tu m_num thi ta se goi de quy ham "toString tempArray" cho den khi temArray chi chua cac phan tu s_num
          else
            tempArray = tempArray.join.reverse
            result += value * (toString tempArray)
          end
        else
          allowedString.each do |k,v|
            result += v if k == key
          end
        end
      end
    end
    # Ta se tinh toan chuoi sau phan tu m_num cuoi cung trong mang numberString
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
# numberString = "一恒河沙"
# 478128479123723803458
numberString = "九千九百九十九万九千九百九十九"
stringToNumber = StringToNumber.new
puts stringToNumber.toString(numberString)
# 999999999999999999999999999999999999999999999999999999999999999999999999
s1 = "99999999"
s2 = "99999999"
puts s1.eql? s2