
require 'test/unit'
class NumberToString
  def to_Kansuji number
    unit = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九"]
    m_num = {:juu => "十", :hyaku => "百", :sen => "千", :man => "万", :ooku => "億", :chou => "兆", :kei => "京", :gai => "垓", :jo => "𥝱", :joo => "穣", :koo => "溝",
             :kan => "澗", :sei => "正", :sai => "載", :goku => "極", :googasha => "恒河沙", :asoogi => "阿僧祇", :nayuta => "那由他", :fukashigi => "不可思議", :muryootaisuu => "無量大数"}
    if number > 0
      if number < 20
        return unit[number]
      elsif number < 100
        return to_Kansuji(number / 10) + m_num[:juu] + to_Kansuji(number % 10)
      elsif number < 200
        return m_num[:hyaku] + to_Kansuji(number % 100)
      elsif number < 1000
        return to_Kansuji(number / 100) + m_num[:hyaku] + to_Kansuji(number % 100)
      elsif number < 2000
        return m_num[:sen] + to_Kansuji(number % 1000)
      elsif number < 10**4
        return to_Kansuji(number / 1000) + m_num[:sen] + to_Kansuji(number % 1000)
      elsif number < 10**8
        return to_Kansuji(number / 10**4) + m_num[:man] + to_Kansuji(number % 10**4)
      elsif number < 10**12
        return to_Kansuji(number / 10**8) + m_num[:ooku] + to_Kansuji(number % 10**8)
      elsif number < 10**16
        return to_Kansuji(number / 10**12) + m_num[:chou] + to_Kansuji(number % 10**12)
      elsif number < 10**20
        return to_Kansuji(number / 10**16) + m_num[:kei] + to_Kansuji(number % 10**16)
      elsif number < 10**24
        return to_Kansuji(number / 10**20) + m_num[:gai] + to_Kansuji(number % 10**20)
      elsif number < 10**28
        return to_Kansuji(number / 10**24) + m_num[:jo] + to_Kansuji(number % 10**24)
      elsif number < 10**32
        return to_Kansuji(number / 10**28) + m_num[:joo] + to_Kansuji(number % 10**28)
      elsif number < 10**36
        return to_Kansuji(number / 10**32) + m_num[:koo] + to_Kansuji(number % 10**32)
      elsif number < 10**40
        return to_Kansuji(number / 10**36) + m_num[:kan] + to_Kansuji(number % 10**36)
      elsif number < 10**44
        return to_Kansuji(number / 10**40) + m_num[:sei] + to_Kansuji(number % 10**40)
      elsif number < 10**48
        return to_Kansuji(number / 10**44) + m_num[:sai] + to_Kansuji(number % 10**44)
      elsif number < 10**52
        return to_Kansuji(number / 10**48) + m_num[:goku] + to_Kansuji(number % 10**48)
      elsif number < 10**56
        return to_Kansuji(number / 10**52) + m_num[:googasha] + to_Kansuji(number % 10**52)
      elsif number < 10**60
        return to_Kansuji(number / 10**56) + m_num[:asoogi] + to_Kansuji(number % 10**56)
      elsif number < 10**64
        return to_Kansuji(number / 10**60) + m_num[:nayuta] + to_Kansuji(number % 10**60)
      elsif number < 10**68
        return to_Kansuji(number / 10**64) + m_num[:fukashigi] + to_Kansuji(number % 10**64)
      elsif number < 10**88
        return to_Kansuji(number / 10**68) + m_num[:muryootaisuu] + to_Kansuji(number % 10**68)
      else
        return m_num[:muryootaisuu]
      end
    else return ""
    end
  end
end

test = NumberToString.new
puts test.to_Kansuji 30

class MyTest < Test::Unit::TestCase
  def test_basic
    # assert_equal"〇", NumberToString.new.to_Kansuji(0)
    assert_equal"一", NumberToString.new.to_Kansuji(1)
    assert_equal"二", NumberToString.new.to_Kansuji(2)
    assert_equal"三", NumberToString.new.to_Kansuji(3)
    assert_equal"四", NumberToString.new.to_Kansuji(4)
    assert_equal"五", NumberToString.new.to_Kansuji(5)
    assert_equal"十", NumberToString.new.to_Kansuji(10)
    assert_equal"十一", NumberToString.new.to_Kansuji(11)
    assert_equal"十二", NumberToString.new.to_Kansuji(12)
    assert_equal"十九", NumberToString.new.to_Kansuji(19)
    assert_equal"二十", NumberToString.new.to_Kansuji(20)
    assert_equal"二十一", NumberToString.new.to_Kansuji(21)
    assert_equal"九十九", NumberToString.new.to_Kansuji(99)
    assert_equal"百", NumberToString.new.to_Kansuji(100)
    assert_equal"九百九十九", NumberToString.new.to_Kansuji(999)
    assert_equal"千", NumberToString.new.to_Kansuji(1000)
    assert_equal"九千九百九十九", NumberToString.new.to_Kansuji(9999)
    assert_equal"一万", NumberToString.new.to_Kansuji(10000)
    assert_equal"九十万", NumberToString.new.to_Kansuji(900000)
    assert_equal"千百十一万千百十一", NumberToString.new.to_Kansuji(11111111)
    assert_equal"九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999)
    assert_equal"一億", NumberToString.new.to_Kansuji(100000000)
    assert_equal"九十億", NumberToString.new.to_Kansuji(9000000000)
    assert_equal"千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111)
    assert_equal"九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999)
    assert_equal"一兆", NumberToString.new.to_Kansuji(1000000000000)
    assert_equal"九十兆", NumberToString.new.to_Kansuji(90000000000000)
    assert_equal"千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(1111111111111111)
    assert_equal"九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(9999999999999999)
    assert_equal"一京", NumberToString.new.to_Kansuji(10000000000000000)
    assert_equal"九十京", NumberToString.new.to_Kansuji(900000000000000000)
    assert_equal"千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(11111111111111111111)
    assert_equal"九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999999999999999)
    assert_equal"一垓", NumberToString.new.to_Kansuji(100000000000000000000)
    assert_equal"九十垓", NumberToString.new.to_Kansuji(9000000000000000000000)
    assert_equal"千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111111111111111)
    assert_equal"九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999999999999999)
    assert_equal"一𥝱", NumberToString.new.to_Kansuji(1000000000000000000000000)
    assert_equal"九十𥝱", NumberToString.new.to_Kansuji(90000000000000000000000000)
    assert_equal"千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(1111111111111111111111111111)
    assert_equal"九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(9999999999999999999999999999)
    assert_equal"一穣", NumberToString.new.to_Kansuji(10000000000000000000000000000)
    assert_equal"九十穣", NumberToString.new.to_Kansuji(900000000000000000000000000000)
    assert_equal"千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(11111111111111111111111111111111)
    assert_equal"九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999999999999999999999999999)
    assert_equal"一溝", NumberToString.new.to_Kansuji(100000000000000000000000000000000)
    assert_equal"九十溝", NumberToString.new.to_Kansuji(9000000000000000000000000000000000)
    assert_equal"千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111111111111111111111111111)
    assert_equal"九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999999999999999999999999999)
    assert_equal"一澗", NumberToString.new.to_Kansuji(1000000000000000000000000000000000000)
    assert_equal"九十澗", NumberToString.new.to_Kansuji(90000000000000000000000000000000000000)
    assert_equal"千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(1111111111111111111111111111111111111111)
    assert_equal"九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(9999999999999999999999999999999999999999)
    assert_equal"一正", NumberToString.new.to_Kansuji(10000000000000000000000000000000000000000)
    assert_equal"九十正", NumberToString.new.to_Kansuji(900000000000000000000000000000000000000000)
    assert_equal"千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(11111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999999999999999999999999999999999999999)
    assert_equal"一載", NumberToString.new.to_Kansuji(100000000000000000000000000000000000000000000)
    assert_equal"九十載", NumberToString.new.to_Kansuji(9000000000000000000000000000000000000000000000)
    assert_equal"千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999999999999999999999999999999999999999)
    assert_equal"一極", NumberToString.new.to_Kansuji(1000000000000000000000000000000000000000000000000)
    assert_equal"九十極", NumberToString.new.to_Kansuji(90000000000000000000000000000000000000000000000000)
    assert_equal"千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(1111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(9999999999999999999999999999999999999999999999999999)
    assert_equal"一恒河沙", NumberToString.new.to_Kansuji(10000000000000000000000000000000000000000000000000000)
    assert_equal"九十恒河沙", NumberToString.new.to_Kansuji(900000000000000000000000000000000000000000000000000000)
    assert_equal"千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(11111111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999999999999999999999999999999999999999999999999999)
    assert_equal"一阿僧祇", NumberToString.new.to_Kansuji(100000000000000000000000000000000000000000000000000000000)
    assert_equal"九十阿僧祇", NumberToString.new.to_Kansuji(9000000000000000000000000000000000000000000000000000000000)
    assert_equal"千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999999999999999999999999999999999999999999999999999)
    assert_equal"一那由他", NumberToString.new.to_Kansuji(1000000000000000000000000000000000000000000000000000000000000)
    assert_equal"九十那由他", NumberToString.new.to_Kansuji(90000000000000000000000000000000000000000000000000000000000000)
    assert_equal"千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(1111111111111111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(9999999999999999999999999999999999999999999999999999999999999999)
    assert_equal"一不可思議", NumberToString.new.to_Kansuji(10000000000000000000000000000000000000000000000000000000000000000)
    assert_equal"九十不可思議", NumberToString.new.to_Kansuji(900000000000000000000000000000000000000000000000000000000000000000)
    assert_equal"千百十一不可思議千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(11111111111111111111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九不可思議九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(99999999999999999999999999999999999999999999999999999999999999999999)
    assert_equal"一無量大数", NumberToString.new.to_Kansuji(100000000000000000000000000000000000000000000000000000000000000000000)
    assert_equal"九十無量大数", NumberToString.new.to_Kansuji(9000000000000000000000000000000000000000000000000000000000000000000000)
    assert_equal"千百十一無量大数千百十一不可思議千百十一那由他千百十一阿僧祇千百十一恒河沙千百十一極千百十一載千百十一正千百十一澗千百十一溝千百十一穣千百十一𥝱千百十一垓千百十一京千百十一兆千百十一億千百十一万千百十一", NumberToString.new.to_Kansuji(111111111111111111111111111111111111111111111111111111111111111111111111)
    assert_equal"九千九百九十九無量大数九千九百九十九不可思議九千九百九十九那由他九千九百九十九阿僧祇九千九百九十九恒河沙九千九百九十九極九千九百九十九載九千九百九十九正九千九百九十九澗九千九百九十九溝九千九百九十九穣九千九百九十九𥝱九千九百九十九垓九千九百九十九京九千九百九十九兆九千九百九十九億九千九百九十九万九千九百九十九", NumberToString.new.to_Kansuji(999999999999999999999999999999999999999999999999999999999999999999999999)
  end
end

