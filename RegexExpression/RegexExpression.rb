# Trong Ruby để tạo ra regex với cú pháp /example/ hoặc %r{example} hoặc Regex.new
puts /lorem/.match("lorem isum it")
# ^[a-z0-9\.@#\$%&]+$/ : Bao gồm các kí tự a-z, chữ số 0-9, và các kí tự đặc biệt @#$%&

# ^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$ Ít nhất 8 kí tự trong đó có ít nhất 1 chữ cái và 1 số

# / ^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/
# Ít nhất 8 kí tự trong đó có ít nhất 1 chữ cái in hoa, 1 chữ cái in thường, 1 số và 1 kí tự đặc biệt

# / ^[a-zA-Z0-9\s]{7,16}$/: ÍT nhất 7 kí tự và nhiều nhất 16 kí tự cho phép 0-9, a-z
#

string = "5345d"
puts string.match(/[^abc]+/)
# 1	.	Khớp (match) với bất kỳ ký tự nào
# 2	^regex	Biểu thức chính quy phải  khớp tại điểm bắt đầu
# 3	regex$	Biểu thức chính quy phải khớp ở cuối dòng.
# 4	[abc]	Thiết lập định nghĩa, có thể khớp với a hoặc b hoặc c.
# 5	[abc][vz]	Thiết lập định nghĩa, có thể khớp với a hoặc b hoặc c theo sau là v hay z.
# 6	[^abc]	Khi dấu ^ xuất hiện như là nhân vật đầu tiên trong dấu ngoặc vuông, nó phủ nhận mô hình. Điều này có thể khớp với bất kỳ ký tự nào ngoại trừ a hoặc b hoặc c.
# 7	[a-d1-7]	Phạm vi: phù hợp với một chuỗi giữa a và điểm d và con số từ 1 đến 7.
# 8	X|Z	Tìm X hoặc Z.
# 9	XZ	Tìm X và theo sau là Z.
# 10	$	Kiểm tra kết thúc dòng.
#
# 11	\d	Số bất kỳ, viết ngắn gọn cho [0-9]
# 12	\D	Ký tự không phải là số, viết ngắn gon cho [^0-9]
# 13	\s	Ký tự khoảng trắng, viết ngắn gọn cho [ \t\n\x0b\r\f]
# 14	\S	Ký tự không phải khoản trắng, viết ngắn gọn cho [^\s]
# 15	\w	Ký tự chữ, viết ngắn gọn cho [a-zA-Z_0-9]
# 16	\W	Ký tự không phải chữ, viết ngắn gọn cho [^\w]
# 17	\S+	Một số ký tự không phải khoảng trắng (Một hoặc nhiều)
# 18	\b	Ký tự thuộc a-z hoặc A-Z hoặc 0-9 hoặc _, viết ngắn gọn cho [a-zA-Z0-9_].
#
# 19	*	Xuất hiện 0 hoặc nhiều lần, viết ngắn gọn cho {0,}
# 20	+	Xuất hiện 1 hoặc nhiều lần, viết ngắn gọn cho {1,}
# 21	?	Xuất hiện 0 hoặc 1 lần, ? viết ngắn gọn cho {0,1}.
# 22	{X}	Xuất hiện X lần, {}
# 23	{X,Y}	Xuất hiện trong khoảng X tới Y lần.
# 24	*?	* có nghĩa là xuất hiện 0 hoặc nhiều lần, thêm ? phía sau nghĩa là tìm kiếm khớp nhỏ nhất.
#
# KY TU DAC BIET   \.[{(*+?^$|
#
# [...]	trả về một ký tự phù hợp
# [abc]	a, b, hoặc c
# [^abc]	Bất kỳ ký tự nào ngoại trừ a, b, hoặc c
# [a-zA-Z]	a tới z hoặc A tới Z
# [a-d[m-p]]	a tới d, hoặc m tới p: [a-dm-p]
# [a-z&&[def]]	d, e, hoặc f
# [a-z&&[^bc]]	a tới z, ngoại trừ b và c: [ad-z]
# [a-z&&[^m-p]]	a tới z, ngoại trừ m tới p: [a-lq-z]
# [0-9]	0 tới 9