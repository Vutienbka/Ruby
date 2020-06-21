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
        if key.length == 1
          $indexOfCurrentMnum = numberString.index(key)
        elsif key.length == 3
          $indexOfCurrentMnum = numberString.index(key) + 2
        else $indexOfCurrentMnum = numberString.index(key) + 3
        end
        if key.length == 1
          tempArray = numberString[0,$indexOfCurrentMnum].chars.to_a
        elsif key.length == 3
          tempArray = numberString[0,$indexOfCurrentMnum-2].chars.to_a
        else tempArray = numberString[0,$indexOfCurrentMnum-3].chars.to_a
        end
        numberString = numberString[$indexOfCurrentMnum + 1, numberString.length - 1]
        if tempArray.length > 0
          tempArray = tempArray.reverse
          subResult = 0
          check = false
          m_num.each do |ke|
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

# test = StringToNumber.new
# numberString = "四垓七千八百十二京八千四百七十九兆一千二百三十七億二千三百八十万三千四百五十八" # 478128479123723803458
# puts test.toNumber(numberString)

class TestCase < Test::Unit::TestCase
  def test_basic
    assert_equal StringToNumber.new.toNumber("零"),0
    assert_equal StringToNumber.new.toNumber("一"),1
    assert_equal StringToNumber.new.toNumber("二"),2
    assert_equal StringToNumber.new.toNumber("三"), 3
    assert_equal StringToNumber.new.toNumber("四"), 4
    assert_equal StringToNumber.new.toNumber("五"), 5
    assert_equal StringToNumber.new.toNumber("十"), 10
    assert_equal StringToNumber.new.toNumber("十一"), 11
    assert_equal StringToNumber.new.toNumber("十二"), 12
    assert_equal StringToNumber.new.toNumber("十九"), 19
    assert_equal StringToNumber.new.toNumber("二十"), 20
    assert_equal StringToNumber.new.toNumber("二十一"), 21
    assert_equal StringToNumber.new.toNumber("九十九"), 99
    assert_equal StringToNumber.new.toNumber("百"), 100
    assert_equal StringToNumber.new.toNumber("九百九十九"), 999
    assert_equal StringToNumber.new.toNumber("千"), 1000
    assert_equal StringToNumber.new.toNumber("九千九百九十九"), 9999
    assert_equal StringToNumber.new.toNumber("一万"), 10000
    assert_equal StringToNumber.new.toNumber("九十万"), 900000
    assert_equal StringToNumber.new.toNumber("千百十一万千百十一"), 11111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九万九千九百九十九"), 99999999
    assert_equal StringToNumber.new.toNumber("一億"), 100000000
    assert_equal StringToNumber.new.toNumber("九十億"), 9000000000
    assert_equal StringToNumber.new.toNumber("千百十一億千百十一万千百十一"), 111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999
    assert_equal StringToNumber.new.toNumber("一兆"), 1000000000000
    assert_equal StringToNumber.new.toNumber("九十兆"), 90000000000000
    assert_equal StringToNumber.new.toNumber("千百十一兆千百十一億千百十一万千百十一"), 1111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 9999999999999999
    assert_equal StringToNumber.new.toNumber("一京"), 10000000000000000
    assert_equal StringToNumber.new.toNumber("九十京"), 900000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一京千百十一兆千百十一億千百十一万千百十一"), 11111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 99999999999999999999
    assert_equal StringToNumber.new.toNumber("一垓"),100000000000000000000
    assert_equal StringToNumber.new.toNumber("九十垓"), 9000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一𥝱"), 1000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十𥝱"), 90000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 1111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 9999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一穣"), 10000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十穣"),900000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 11111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 99999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一溝"), 100000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十溝"), 9000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一澗"), 1000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十澗"), 90000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 1111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 9999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一正"),10000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十正"), 900000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 11111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 99999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一載"), 100000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十載"), 9000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一極"), 1000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十極"), 90000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 1111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 9999999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一恒河沙"), 10000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十恒河沙"),900000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 11111111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"),99999999999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一阿僧祇"), 100000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十阿僧祇"), 9000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 111111111111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一那由他"),1000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十那由他"), 90000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"),1111111111111111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"),9999999999999999999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一不可思議"), 10000000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十不可思議"), 900000000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一不可思議千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"),11111111111111111111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九不可思議九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 99999999999999999999999999999999999999999999999999999999999999999999
    assert_equal StringToNumber.new.toNumber("一無量大数"), 100000000000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("九十無量大数"),9000000000000000000000000000000000000000000000000000000000000000000000
    assert_equal StringToNumber.new.toNumber("千百十一無量大数千百十一不可思議千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一"), 111111111111111111111111111111111111111111111111111111111111111111111111
    assert_equal StringToNumber.new.toNumber("九千九百九十九無量大数九千九百九十九不可思議九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九"), 999999999999999999999999999999999999999999999999999999999999999999999999
  end
end