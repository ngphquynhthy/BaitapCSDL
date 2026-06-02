# 📚 EBOOK Database Management System (SQL Server)

Dự án thiết kế và triển khai Hệ thống Cơ sở dữ liệu cho ứng dụng/nền tảng báo điện tử **EBOOK**. Hệ thống quản lý toàn diện các thực thể cấu thành một trang báo điện tử bao gồm: Danh mục, Bài báo, Người dùng (Phóng viên, Biên tập viên, Độc giả), phân quyền vai trò và các mối quan hệ logic chặt chẽ.

---

## 🗺️ Sơ đồ Kiến trúc Dữ liệu (Database Schema)

Hệ thống được thiết kế theo mô hình quan hệ chuyên biệt, phân tách người dùng tổng quát và các nhóm vai trò cụ thể nhằm tối ưu hóa tính toàn vẹn dữ liệu:

* **Bảng cốt lõi:** `NguoiDung`, `DanhMuc`, `BaiBao`
* **Bảng mở rộng vai trò (Sub-types):** `PhongVien`, `BienTapVien`, `DocGia` (Mỗi thực thể liên kết chặt chẽ với bảng `NguoiDung` thông qua ràng buộc Khóa ngoại ứng với Khóa chính `ID`).

---

## 🛠️ Hướng dẫn Khởi tạo & Cài đặt

Để chạy file script `BTN CSDL.sql` trên môi trường **SQL Server Management Studio (SSMS)**, bạn thực hiện theo các bước sau:

1. Mở phần mềm SSMS và kết nối vào Database Engine của bạn.
2. Mở file `BTN CSDL.sql` hoặc sao chép toàn bộ nội dung script vào một cửa sổ **New Query**.
3. Thực thi (Nhấn **F5** hoặc nút **Execute**) toàn bộ script để tự động khởi tạo cơ sở dữ liệu `EBOOK`, thiết lập hệ thống bảng, ràng buộc và nạp dữ liệu mẫu.

> ⚠️ **Lưu ý quan trọng:** Script sử dụng thiết lập cấu hình định dạng thời gian `SET DATEFORMAT dmy` trước khi thêm mới bản ghi. Hãy đảm bảo giữ nguyên câu lệnh này để tránh gặp lỗi sai định dạng ngày tháng (`DateTime`) khi nạp dữ liệu.

---

## 🔍 Tổng hợp Các Tính năng & Kỹ thuật Truy vấn

File mã nguồn đã cấu hình sẵn 10 nghiệp vụ truy vấn từ cơ bản đến chuyên sâu để kiểm tra hiệu năng dữ liệu:

| STT | Loại Truy vấn / Kỹ thuật | Mục tiêu Nghiệp vụ / Mô tả chi tiết |
| :--- | :--- | :--- |
| **1** | `SELECT *` | Kiểm tra tính chính xác của dữ liệu mẫu sau khi nạp vào hệ thống bảng. |
| **2** | `ORDER BY ... DESC` | Sắp xếp và hiển thị danh sách các bài báo đã được duyệt theo thứ tự mới nhất (Mã bài báo giảm dần). |
| **3** | Toán tử `LIKE 'G%'` | Lọc tìm kiếm các bài viết thuộc danh mục bắt đầu bằng ký tự 'G' (Ví dụ: *Giáo Dục*). |
| **4** | Hàm thời gian (`YEAR`, `GETDATE`) | Tính toán tuổi thọ hiện tại của Phóng viên và lọc danh sách nhân sự trẻ (Dưới hoặc bằng 35 tuổi). |
| **5** | `INNER JOIN` | Liên kết nhiều bảng nhằm trích xuất thông tin liên hệ (Email, SĐT) của Biên tập viên chịu trách nhiệm nội dung cho từng bài báo cụ thể. |
| **6** | `FULL OUTER JOIN` & `SELF JOIN` | Truy vấn mở rộng và đối chiếu mối quan hệ giữa Phóng viên tác nghiệp và các bài báo được xuất bản. |
| **7** | Subquery (Truy vấn con với `IN`) | Tìm kiếm và hiển thị toàn bộ thông tin các bài viết có tương tác cao (Lượt xem vượt ngưỡng 3,000). |
| **8** | Common Table Expression (`WITH`) | Khởi tạo bảng tạm thời tính tổng lượt xem, sử dụng mệnh đề `CASE WHEN` phân loại độ thịnh hành của bài viết (Đạt nhãn *Bai Bao Viral* nếu lượt xem $\ge 1000$). |
| **9** | `GROUP BY` & `HAVING` | Thống kê số lượng bài viết của từng phóng viên và lọc ra những nhân sự có hiệu suất cao (Viết nhiều hơn 1 bài). |
| **10**| `CREATE FUNCTION` | Hàm lập trình nội tại (Scalar Function) nhận tham số `@MaDanhMuc` để trả về tổng số lượng bài báo thuộc danh mục đó. |

---

## 📝 Quy tắc Ràng buộc Toàn vẹn (Constraints)

* **Ràng buộc miền giá trị (Check Constraint):** Các bảng `PhongVien`, `BienTapVien`, `DocGia` bắt buộc thuộc tính `[Gioi Tinh]` chỉ nhận một trong ba giá trị quy chuẩn: `M` (Nam), `F` (Nữ), `N` (Khác).
* **Ràng buộc toàn vẹn thực thể:** Hệ thống khóa ngoại (`FK`) kiểm soát nghiêm ngặt logic: Bài báo phải thuộc danh mục tồn tại; Phóng viên, Độc giả, Biên tập viên phải có danh tính định danh hợp lệ trong danh sách Người dùng hệ thống.
