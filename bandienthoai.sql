-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 01:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bandienthoai`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`) VALUES
(17, 15, 'Khê thượng, Sơn Đà, Ba vì, Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(225, 32, 19, 'Tai nghe Bluetooth Soundpeats TrueFree Plus', 999000, 1, 'tainghe1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'Điện thoại', 'iphone3.jpg', 1),
(4, 'Máy tính bảng\r\n', 'maytinhbang.jpg', 1),
(6, 'Laptop', 'laptop.jpg', 1),
(16, 'Tai nghe', 'tainghe.jpg', 1),
(17, 'Sạc dự phòng', 'sacduphong.jpg', 1),
(19, 'Đồng hồ thông minh', 'donghothongminh.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(13, 'Sản phẩm này dùng rất ok nha', '2025-06-03 11:57:41', 1, 19, 32);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(121, 62, 31, 1, 350000),
(122, 63, 27, 1, 14490000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(62, 19, '2025-06-03 11:45:21', 350000, 'Ba Vì - Hà Nội', '0967676103', 'Giao nhanh giúp mình nha', 4),
(63, 19, '2025-06-03 13:30:15', 14490000, 'Ba Vì - Hà Nội', '0967676103', 'Giao trước 17h', 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'Top 5+ những cuốn sách hay nên đọc 1 lần trong đời', 'top-sach.jpg', 'Admin', '<p><strong>Ngày nay, bạn có thể tìm thấy hàng triệu cuốn sách trên thế giới thuộc vô số chủ đề độc đáo. Tuy nhiên, có những cuốn sách tâm đắc nhất mà bạn không thể bỏ lỡ và nhất định nên đọc một lần. Hãy cùng Sforum điểm qua top 22+ những cuốn sách hay 2023 nên đọc trong đời ngay bây giờ nhé. Đừng quên chọn cho mình cuốn sách ưng ý nhất để đem về tủ sách nhà mình!</strong></p><h4><strong>Nhà giả kim</strong></h4><p>“Nhà giả kim” là một trong những cuốn sách hay của tác giả Paulo Coelho, kể về cuộc hành trình theo đuổi giấc mơ của Santiago, một chàng chăn cừu người Tây Ban Nha. Cuốn sách truyền đạt thông điệp về việc tìm kiếm quy luật của vũ trụ và ý nghĩa thực sự của cuộc đời. Và đây không chỉ là một câu chuyện phiêu lưu mà còn là một hành trình tìm kiếm bản thân, khám phá niềm tin và theo đuổi đam mê.</p><h4><strong>Đắc nhân tâm</strong></h4><p>“Đắc nhân tâm” do Dale Carnegie viết là một trong những cuốn sách hay bán chạy nhất mọi thời đại. Cuốn sách này chứa đựng những bài học về kỹ năng giao tiếp, làm thế nào để thu hút và ảnh hưởng đến người khác. Không chỉ dừng lại ở việc truyền đạt những kỹ năng mềm, cuốn sách còn giúp người đọc hiểu rõ hơn về tâm lý con người và cách xây dựng mối quan hệ.</p><h4><strong>Cà phê cùng Tony</strong></h4><p>“Cà phê cùng Tony” là sách hay nên đọc cho giới trẻ của tác giả Tony Buổi Sáng chứa đựng những suy nghĩ, bài học về cuộc sống, công việc và tình yêu dưới góc nhìn của Tony - một người trẻ tuổi đầy nhiệt huyết. Thông qua những câu chuyện ngắn gọn, dễ hiểu, Tony giúp người đọc nhìn lại và định hình lại quan điểm về nhiều vấn đề trong cuộc sống. Cuốn sách còn một người bạn đồng hành, giúp bạn tìm thấy niềm vui, hạnh phúc và ý nghĩa trong từng khoảnh khắc của cuộc đời.</p><h4><strong>Người giàu có nhất thành Babylon</strong></h4><p>George S. Clason thông qua “Người giàu có nhất thành Babylon” đã trình bày những bài học tài chính quý báu dưới dạng các câu chuyện huyền bí từ Babylon cổ đại, nơi được coi là nền kinh tế phồn thịnh nhất từng tồn tại. Đây là cuốn sách hay 2023 cực kỳ hot mà nhắc tới chắc hẳn ai cũng từng nghe qua một lần.</p><p>Cuốn sách cung cấp cho người đọc những nguyên tắc quản lý tài chính cá nhân, tiết kiệm và đầu tư một cách thông minh. Mỗi chương đều mang đến một bài học riêng biệt, giúp người đọc hiểu biết về việc làm giàu không chỉ dựa vào thu nhập, mà còn cần sự khôn ngoan, kỷ luật và hiểu biết về tiền bạc.</p><h4><strong>Cách nghĩ để thành công (Think &amp; Grow Rich)</strong></h4><p>“Think &amp; Grow Rich” thuộc top những cuốn sách hay nên đọc và là một tác phẩm kinh điển của Napoleon Hill, được viết dựa trên nghiên cứu của ông về hàng trăm người thành đạt nhất thế kỷ 20. Cuốn sách không chỉ giới thiệu về việc kiếm tiền mà còn về việc xây dựng tư duy thành công. Hill trình bày 13 bước để đạt đến sự giàu có và thành công, bắt đầu từ ý thức định hướng, lòng tin và sức mạnh của việc tạo lập mục tiêu cụ thể.</p>', 0, 1, '2023-11-29 17:13:09', '2023-12-04 21:31:51'),
(5, 2, 'Những tác giả có sức ảnh hưởng nhất trong làng sách Việt Nam năm 2015', 'tac-gia.jpg', 'Admin', '<p><strong>Năm 2015, bên cạnh những tác giả đã quá đỗi quen thuộc thì thị trường xuất bản còn đón nhận nhiều gương mặt trẻ. Họ đã thổi một làn gió mới tới những người yêu sách, đem đến tinh thần mua sách và đọc sách ở thế hệ 9x, 10x.&nbsp;</strong></p><p>Cùng LĐTĐ điểm tên 10 nhà văn, tác giả tạo được tiếng vang nhất trong làng sách Việt Nam trong năm qua.</p><h4><strong>Nguyễn Nhật Ánh</strong></h4><p>Năm 2015 có thể coi là một năm “đại thắng” đối với nhà văn Nguyễn Nhật Anh. “Tôi thấy hoa vàng trên cỏ xanh” thu nhận thành công trên mức tưởng tượng khi được chuyển thể thành phim nhựa giới thiệu tới khán giả trong và ngoài nước. Bên cạnh sự phủ sóng mạnh mẽ của “Tôi thấy hoa vàng trên cỏ xanh”, những cuốn sách khác của nhà văn Nguyễn Nhật Ánh như: “Bảy bước tới mùa hè”, “Cô gái đến từ hôm qua”… cũng nhanh chóng trở thành “best-seller” ngay từ khi mới ra mắt.</p><p>Thành công của những tác phẩm do Nguyễn Nhật Ánh sáng tác đến từ sự dung dị, đời thường, gắn liền với những kỷ niệm tươi đẹp của tuổi thơ. Mỗi cuốn sách như một bức tranh mở ra trước mắt người đọc những khung cảnh chân phương, đầy ắp tiếng cười.</p><h4><strong>Nguyễn Phong Việt</strong></h4><p>“Đi qua thương nhớ”, “Sinh ra là để cô đơn” hay mới đây nhất là “Sống một cuộc đời bình thường” đều là những cuốn sách được yêu mến của Nguyễn Phong Việt.</p><p>Được mệnh danh là nhà thơ “ăn khách” nhất, Nguyễn Phong Việt chia sẻ: “Tôi may mắn khi mình có rất nhiều cảm xúc. Ngay từ tập thơ đầu, tôi là người làm thơ không câu nệ câu chữ. Mình nghĩ câu đó cần 20 từ thì viết 20 từ chứ không phải vì để cho ngắn gọn, cho người đọc dễ chịu thì viết ngắn hơn. Mình viết mình cảm nhận được trước đã, rồi độc giả mới hiểu. Sau này, tôi có sự thỏa hiệp nho nhỏ, thay đổi vài từ để cảm xúc của câu chữ không bị bóp nghẹt trong đau đớn”.</p><h4><strong>Anh Khang</strong></h4><p>Sớm định hình phong cách riêng trong dòng văn học trẻ sôi động, Anh Khang - tác giả sinh năm 1987 được độc giả trẻ đón nhận qua những tựa sách “hot” như “Ngày trôi về phía cũ”, “Đường hai ngả người thương thành lạ” hay “Buồn làm sao buông”.</p><p>Văn của Anh Khang không tìm đến sự nổi loạn hay phá cách trong con chữ mà tạo ra dấu ấn riêng nhờ sự nhạy cảm trong lối suy nghĩ thấu đáo, truyền tải đúng tâm tình của người trẻ hiện đại. Anh Khang là một trong những tác giả trẻ sở hữu số lượng fans đông đảo nhất hiện nay trên mạng xã hội cũng như ngoài đời thực.</p>', 0, 1, '2023-11-29 17:25:47', '2023-12-03 13:21:05'),
(8, 9, 'Top cuốn sách tâm lý làm chủ chính mình hay nhất hiện nay', 'top-sach-tam-li.jpg', 'Admin', '<p><i>Tâm lý học là một ngành học thú vị và hấp dẫn, bởi vì nó giúp chúng ta hiểu được tâm lý con người, một thứ rất phức tạp và biến đổi. Nhiều người muốn nâng cao kiến thức về tâm lý học và tìm đọc những cuốn sách chất lượng và hữu ích về ngành học này. Trong bài viết này, sẽ giới thiệu cho bạn top cuốn sách tâm lý nổi tiếng hiện nay.</i></p><h4><strong>Tư duy nhanh và chậm – Daniel Kahneman</strong></h4><p>Tư Duy Nhanh Và Chậm là một cuốn sách nổi tiếng của Daniel Kahneman, một nhà tâm lý học xuất sắc. Sách giải thích rằng tâm trí con người có hai hệ thống hoạt động khác nhau: Hệ thống 1 hoạt động nhanh chóng, trực giác và không cần suy nghĩ nhiều; Hệ thống 2 hoạt động chậm rãi, cẩn thận và cần nhiều sự chú ý. Tác giả cũng cho thấy rằng con người thường mắc phải những sai lầm trong việc ra quyết định, do bị ảnh hưởng bởi những cảm xúc, định kiến và thiếu nhất quán. Cuốn sách này sẽ giúp bạn đọc hiểu được nhiều điều thú vị và sâu sắc về tâm lý con người và nhận ra rằng “Chúng ta không giỏi như chúng ta nghĩ”.</p><h4><a href=\"https://tiki.vn/search?q=phi%20l%C3%BD%20tr%C3%AD\"><strong>Phi lý trí</strong></a><strong> – Dan Ariely</strong></h4><p>Phi Lý Trí là một tác phẩm trong top cuốn sách tâm lý của Dan Ariely, một giáo sư tâm lý học và kinh tế học hành vi, trong đó ông đã trình bày những nghiên cứu và thí nghiệm của mình về sự thiếu hợp lý của con người trong việc ra quyết định và tiết lộ những hiện tượng tâm lý mới lạ và thú vị. Ông đã khẳng định rằng: chúng ta thường bị ảnh hưởng bởi một “hệ thống” phi lý trí vô hình.&nbsp;</p><p>Ông đã kết hợp những nghiên cứu khoa học với những ví dụ thực tế để giúp chúng ta nhận ra những “điểm mù” trong cách suy nghĩ hàng ngày. Phi Lý Trí của Dan Ariely là một cuốn sách tâm lý học rất cuốn hút bởi ông đã sử dụng ngôn ngữ dễ hiểu nhưng vẫn khiến người đọc phải suy ngẫm về những hành vi và những sai lầm của bản thân để có thể sống một cách hợp lý và tốt đẹp hơn.</p><h4><strong>Im lặng – Sức mạnh của người hướng nội</strong></h4><p>Trong cuốn sách này, Susan Cain đã nói về sự khác biệt giữa người hướng ngoại và người hướng nội, và những ưu điểm của người có tính cách nhạy cảm. Tác giả đã chỉ ra rằng người hướng nội có thể tận dụng tính cách của mình để chọn lựa công việc, lĩnh vực phù hợp với mình trong xã hội.&nbsp;</p><p>Cuốn sách này sẽ rất hữu ích cho bạn nếu bạn là người hướng nội muốn tìm đường đi cho bản thân, hoặc nếu bạn muốn hiểu thêm về người hướng nội để có thể quản lý, giao tiếp và hợp tác tốt hơn với họ.</p><h4><strong>Tâm Lý Học Đám Đông – Gustave Le Bon</strong></h4><p>Tác giả Gustave Le Bon, một nhà tâm lý học Pháp nổi tiếng, đã viết cuốn sách Tâm lý học đám đông để nghiên cứu về sự ảnh hưởng của đám đông đến lý trí và cảm xúc của con người. Tác giả đã dựa trên nhiều nghiên cứu về tinh thần và tính cách của các dân tộc, chủng tộc khác nhau trên thế giới. Tác giả đã cho rằng, con người bị chi phối bởi những yếu tố sinh học và tâm lý học. Chủng tộc là một thực thể ẩn sâu trong mỗi cá nhân và có ảnh hưởng đến mọi hành động, ham muốn, xung năng của họ. Tác giả cũng đã trải qua nhiều biến động lịch sử của Pháp, như Công Xã Paris, cách mạng Pháp 1789 và 1848. Những trải nghiệm này đã giúp tác giả có những quan sát và phân tích từ thực tiễn được thể hiện rõ nét trong cuốn sách Tâm lý học đám đông.</p>', 0, 1, '2023-12-03 13:45:32', '2023-12-03 13:45:32'),
(9, 9, 'Top những chiếc điện thoại 2025 | Mà bạn không thể bỏ qua', 'baiviet1.jpg', 'Admin', '<h2><strong>Những chiếc điện thoại đáng sở hữu nhất năm 2025 – Hiệu năng vượt trội, thiết kế đẳng cấp</strong></h2> <p><strong>Nếu bạn đang băn khoăn lựa chọn một chiếc smartphone phù hợp với nhu cầu học tập, làm việc hay giải trí thì bài viết này sẽ giúp bạn tìm ra sự lựa chọn xứng đáng. Dưới đây là những chiếc điện thoại nổi bật nhất đầu năm 2025, với thiết kế ấn tượng, cấu hình mạnh mẽ và nhiều công nghệ tiên tiến đáng chú ý.</strong></p> <h4><strong>iPhone 14 Trắng 1TB – Thiết kế sang trọng, hiệu năng vượt trội</strong></h4> <p>Chiếc iPhone 14 phiên bản màu trắng với dung lượng khủng 1TB không chỉ là biểu tượng của sự đẳng cấp mà còn là lựa chọn tối ưu cho những ai yêu thích lưu trữ hình ảnh, video chất lượng cao. Sở hữu chip A15 Bionic mạnh mẽ cùng màn hình Super Retina XDR sống động, iPhone 14 mang lại trải nghiệm mượt mà trên mọi tác vụ, từ chơi game, chỉnh sửa video đến xử lý công việc văn phòng.</p> <p>Với camera kép cải tiến và khả năng quay video chuẩn điện ảnh, iPhone 14 xứng đáng là bạn đồng hành cho những người yêu công nghệ và sáng tạo nội dung.</p> <h4><strong>Samsung Galaxy S23 FE 128GB – Sức mạnh cân mọi tác vụ</strong></h4> <p>Phiên bản Fan Edition của dòng Galaxy S năm nay tiếp tục chinh phục người dùng với hiệu năng ấn tượng từ chip Snapdragon 8 Gen 1 và màn hình AMOLED 120Hz siêu mượt. Dung lượng 128GB đủ dùng cho nhu cầu phổ thông, trong khi thiết kế mỏng nhẹ, hiện đại khiến Galaxy S23 FE trở thành chiếc máy đa năng phù hợp cho cả học sinh, sinh viên lẫn dân văn phòng.</p> <p>Máy còn hỗ trợ sạc nhanh và khả năng chống nước IP68, phù hợp với nhịp sống năng động hiện nay.</p> <h4><strong>Xiaomi 15 Ultra 512GB – Camera đỉnh cao, lưu trữ thoải mái</strong></h4> <p>Xiaomi tiếp tục thể hiện năng lực công nghệ đột phá của mình với Xiaomi 15 Ultra. Chiếc flagship này sở hữu hệ thống 4 camera sau với cảm biến chính có khả năng quay video 8K cùng thuật toán xử lý AI nâng cao. Dung lượng lưu trữ lên đến 512GB cho phép bạn thoải mái ghi lại mọi khoảnh khắc mà không lo hết bộ nhớ.</p> <p>Với màn hình LTPO AMOLED 120Hz cùng pin dung lượng lớn hỗ trợ sạc siêu nhanh, Xiaomi 15 Ultra là lựa chọn đáng giá trong phân khúc cao cấp.</p> <h4><strong>Realme C51 4GB|128GB – Giá rẻ nhưng hiệu quả</strong></h4> <p>Realme C51 là lựa chọn hoàn hảo cho người dùng phổ thông cần một thiết bị ổn định, giá tốt. Với RAM 4GB và bộ nhớ trong 128GB, máy đáp ứng tốt các tác vụ cơ bản như duyệt web, xem phim, học online. Thiết kế trẻ trung, pin 5000mAh bền bỉ là điểm cộng lớn cho phân khúc học sinh, sinh viên.</p> <p>Camera AI kép cùng giao diện Realme UI trực quan giúp trải nghiệm mượt mà hơn hẳn so với các đối thủ cùng tầm giá.</p> <h4><strong>OPPO A58 8GB/128GB – Sang trọng trong tầm tay</strong></h4> <p>Mang trong mình thiết kế thời thượng cùng hiệu năng ổn định từ chip Helio G85, OPPO A58 là chiếc điện thoại đáng cân nhắc trong phân khúc tầm trung. Với 8GB RAM, bạn có thể đa nhiệm tốt, chơi game nhẹ nhàng, lướt mạng xã hội liên tục mà không bị giật lag.</p> <p>Máy còn sở hữu loa kép cho âm thanh sống động, sạc nhanh 33W và hệ điều hành ColorOS dễ sử dụng, mang lại trải nghiệm toàn diện trong mức giá hợp lý.</p>', 10, 1, '2025-05-09 17:41:06', '2025-05-09 17:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'So sánh sản phẩm'),
(2, 'Khuyến mãi'),
(9, 'Tin công nghệ'),
(15, 'Đánh giá sản phẩm');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 2, 'Điện thoại Redmi 12 8GB/128GB', 'redmi.jpg', 30, 0, 3500000, 3190000, '2025-05-08 08:22:03', 5, '<p><strong>Nếu bạn vẫn luôn nghĩ rằng một chiếc điện thoại giá rẻ không thể mang lại trải nghiệm tốt thì nhất định bạn phải xem qua Redmi 12 8GB/128GB.</strong></p>\r\n<p>Có thể bạn chưa biết, **Redmi 12** là một trong những smartphone nổi bật nhất trong phân khúc tầm trung của Xiaomi trong năm 2024, nhờ thiết kế tinh tế, màn hình lớn và hiệu năng vượt mong đợi. Không chỉ vậy, mẫu điện thoại này cũng được nhiều reviewer công nghệ đánh giá là “sự lựa chọn hoàn hảo cho học sinh – sinh viên” với cấu hình RAM 8GB, bộ nhớ trong 128GB cùng vi xử lý MediaTek Helio G88. Và đây cũng chính là mẫu điện thoại mà anh <strong>Hoàng N.Trung</strong> (Section Manager - VEU) đã “highly recommend” trong buổi chia sẻ về “Smartphone dưới 4 triệu đáng mua” ngày 28/4, bởi theo anh đây là <i><strong>“một chiếc máy quá ổn trong tầm giá, đủ dùng cho học tập, giải trí, và thậm chí cả chơi game nhẹ.” </strong></i>Giờ cùng khám phá chi tiết chiếc điện thoại này nhé!</p>\r\n', '<p>Hãng sản xuất: <strong>Xiaomi</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Redmi 12 8GB/128GB</strong></p>\r\n', 1),
(2, 2, 'IPhone 14 Trắng 1TB', 'iphone3.jpg', 40, 0, 22500000, 20190000, '2025-04-08 10:15:54', 9, '<p><strong>Nếu bạn nghĩ rằng iPhone chỉ dành cho những ai muốn \"khoe mẽ\" thì có thể bạn chưa thật sự hiểu được đẳng cấp của iPhone 14 phiên bản Trắng 1TB.</strong></p>\r\n<p>Có thể bạn chưa biết, <strong>iPhone 14</strong> không chỉ là một bản nâng cấp về phần cứng mà còn là bước tiến mạnh mẽ về trải nghiệm người dùng. Với phiên bản bộ nhớ 1TB, người dùng hoàn toàn có thể lưu trữ hàng ngàn bức ảnh chất lượng cao, video 4K dài hàng giờ đồng hồ mà không cần lo hết dung lượng. Không chỉ vậy, thiết kế mặt lưng kính cường lực cùng khung viền nhôm cao cấp tạo nên vẻ ngoài tinh tế, đẳng cấp – đặc biệt là với phiên bản màu Trắng thanh lịch.</p>\r\n<p>Chiếc máy này cũng là sự lựa chọn của anh <strong>Hoàng N.Trung</strong> (Section Manager - VEU), người từng chia sẻ trong buổi Talk về \"Thiết bị tối ưu cho công việc sáng tạo\" ngày 28/4 rằng đây là <i><strong>\"chiếc điện thoại giúp tôi quay dựng video chất lượng cao, xử lý nhanh mà không cần dùng đến laptop khi di chuyển\".</strong></i> Với chip A15 Bionic mạnh mẽ, camera cải tiến và dung lượng khủng, iPhone 14 Trắng 1TB thực sự là công cụ lý tưởng cho người dùng chuyên nghiệp. Cùng khám phá thêm chi tiết bên dưới nhé!</p>\r\n', '<p>Hãng sản xuất: <strong>Apple</strong> &nbsp; &nbsp; &nbsp;Model: <strong>iPhone 14</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Trắng</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>1TB</strong></p>\r\n', 1),
(6, 2, 'Samsung Galaxy M54 8GB/256GB Màu Bạc', 'samsung1.jpg', 35, 0, 8990000, 5990000, '2025-05-08 22:23:49', 2, '<p><strong>Nếu bạn cho rằng chỉ dòng flagship mới sở hữu hiệu năng mạnh và pin “trâu” thì có lẽ bạn chưa từng trải nghiệm Galaxy M54 5G.</strong></p>\r\n<p>Có thể bạn chưa biết, <strong>Samsung Galaxy M54 5G</strong> là một trong những chiếc smartphone nổi bật trong phân khúc tầm trung cao cấp của Samsung năm 2024, gây ấn tượng nhờ hiệu năng mạnh mẽ với Exynos 1380, RAM 8GB cùng bộ nhớ trong 256GB – tha hồ lưu trữ phim, ảnh và ứng dụng. Không chỉ vậy, viên pin khủng 6000mAh kết hợp sạc nhanh 25W giúp máy hoạt động bền bỉ suốt ngày dài mà không lo gián đoạn.</p>\r\n<p>Đây cũng là chiếc điện thoại mà anh <strong>Hoàng N.Trung</strong> (Section Manager - VEU) đã giới thiệu trong buổi chia sẻ về “Smartphone hiệu năng cao cho công việc lẫn giải trí” ngày 28/4, với nhận định: <i><strong>“Chiếc M54 này là một lựa chọn rất cân bằng – cấu hình tốt, pin khỏe, màn hình đẹp, giá lại mềm.”</strong></i> Hãy cùng khám phá thêm lý do vì sao Galaxy M54 5G lại được yêu thích đến vậy!</p>\r\n', '<p>Hãng sản xuất: <strong>Samsung</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Galaxy M54 5G</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Sliver (Bạc)</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>8GB/256GB</strong></p>\r\n', 1),
(14, 17, 'Pin sạc dự phòng Polymer 10.000 mAh 12W AVA+ PJ JP192', 'sacduphong1.jpeg', 10, 0, 380000, 150000, '2025-05-08 22:54:49', 0, '<p><strong>Nếu bạn đang tìm kiếm một pin sạc dự phòng mỏng nhẹ, an toàn và tiện lợi thì AVA+ PJ JP192 là một lựa chọn sáng giá.</strong></p>\r\n<p>Với dung lượng 10.000mAh cùng công nghệ sạc 12W ổn định, sản phẩm này phù hợp cho hầu hết các dòng điện thoại thông minh hiện nay. Thiết kế nhỏ gọn, vỏ ngoài nhám giúp cầm chắc tay, dễ mang theo bên mình. Dòng sạc ra ổn định giúp bảo vệ thiết bị không bị quá nhiệt hay quá dòng.</p>\r\n<p>Theo đánh giá từ anh <strong>Hoàng N.Trung</strong> trong buổi tư vấn \"Chọn sạc dự phòng an toàn – giá tốt\", thì: <i><strong>“AVA+ PJ JP192 là lựa chọn rất hợp lý cho học sinh – sinh viên hoặc người dùng phổ thông, vừa túi tiền mà vẫn an tâm về chất lượng.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>AVA</strong> &nbsp; &nbsp; &nbsp;Model: <strong>PJ JP192</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>10.000 mAh</strong> &nbsp; &nbsp; &nbsp;Công suất: <strong>12W</strong></p>\r\n', 1),
(15, 17, 'Pin sạc dự phòng HePu MP912 10.000mAh', 'sacduphong2.jpg', 20, 0, 350000, 280000, '2025-05-08 23:05:47', 1, '<p><strong>HePu MP912 là mẫu sạc dự phòng thiết kế tối giản nhưng đầy hiệu quả, đáp ứng tốt nhu cầu sử dụng cơ bản hàng ngày.</strong></p>\r\n<p>Sở hữu dung lượng 10.000mAh, MP912 đủ sức sạc đầy 1-2 lần cho hầu hết các smartphone hiện nay. Vỏ nhựa ABS bền bỉ, thiết kế bo tròn dễ cầm, tích hợp 2 cổng ra USB tiện lợi để sạc cùng lúc nhiều thiết bị.</p>\r\n<p>Chia sẻ trong chuyên đề “Đánh giá pin dự phòng phổ thông”, anh <strong>Bùi Quang Dũng</strong> đánh giá: <i><strong>“MP912 có hiệu năng ổn định, ít nóng, dùng tốt cho cả người lớn tuổi hoặc học sinh cần thiết bị dễ dùng.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>HePu</strong> &nbsp; &nbsp; &nbsp;Model: <strong>MP912</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>10.000 mAh</strong></p>\r\n', 1),
(16, 17, 'Sạc dự phòng Pisen Mini Power 10000mAh', 'sacduphong3.jpg', 30, 0, 880000, 680000, '2025-05-08 23:09:13', 10, '<p><strong>Nếu bạn cần một chiếc sạc dự phòng nhỏ gọn, đẹp mắt và có thương hiệu uy tín thì Pisen Mini Power là lựa chọn không thể bỏ qua.</strong></p>\r\n<p>Sản phẩm có thiết kế siêu nhỏ gọn, trọng lượng nhẹ nhưng vẫn đảm bảo dung lượng sạc lên đến 10.000mAh, dễ dàng mang theo trong túi xách, balo. Tích hợp các công nghệ bảo vệ thông minh như chống quá nhiệt, chống đoản mạch giúp an toàn cho cả người dùng và thiết bị.</p>\r\n<p>Trong buổi giới thiệu “Phụ kiện đáng mua dịp lễ”, anh <strong>Hoàng N.Trung</strong> chia sẻ: <i><strong>“Pisen Mini Power rất tiện, nhỏ nhưng đủ dùng. Một thương hiệu lâu đời nên rất yên tâm về chất lượng.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Pisen</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Mini Power</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>10.000 mAh</strong></p>\r\n', 1),
(17, 17, 'Sạc Dự Phòng Không Dây MagSafe 10.000Mah', 'sacduphong4.jpg', 120, 0, 269000, 359000, '2025-05-08 23:12:48', 10, '<p><strong>Dành riêng cho iPhone và người dùng yêu thích sự gọn gàng – sạc dự phòng MagSafe 10.000mAh là sự lựa chọn cực kỳ thông minh.</strong></p>\r\n<p>Với công nghệ sạc không dây chuẩn MagSafe, thiết bị có thể hít chặt vào mặt lưng iPhone dòng 12 trở lên mà không cần cáp. Thiết kế nhỏ gọn, hiện đại và dung lượng 10.000mAh giúp người dùng thoải mái sử dụng cả ngày dài. Ngoài sạc không dây, còn hỗ trợ sạc nhanh có dây qua cổng Type-C.</p>\r\n<p>Chuyên gia công nghệ <strong>Hoàng N.Trung</strong> chia sẻ: <i><strong>“Sạc không dây MagSafe là phụ kiện phải có cho ai dùng iPhone – gọn nhẹ, tiện lợi và rất thời trang.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Khác</strong> &nbsp; &nbsp; &nbsp;Loại: <strong>Sạc không dây MagSafe</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>10.000 mAh</strong></p>\r\n', 1),
(18, 6, 'Laptop MSI Modern 15 B13M-438VN', 'laptop4.jpg', 40, 0, 19670000, 15990000, '2025-05-08 23:20:33', 20, '<p><strong>MSI Modern 15 B13M-438VN là mẫu laptop mỏng nhẹ dành cho người dùng văn phòng, sinh viên cần hiệu suất ổn định và thiết kế hiện đại.</strong></p>\r\n<p>Trang bị vi xử lý Intel Core i5-1335U thế hệ mới, RAM 8GB và SSD 512GB giúp máy khởi động nhanh, đa nhiệm tốt. Máy có trọng lượng nhẹ, chỉ khoảng 1.7kg – phù hợp cho người thường xuyên di chuyển. Giao diện Windows 11 thân thiện và bàn phím thoải mái hỗ trợ làm việc cả ngày.</p>\r\n', '<p>Hãng sản xuất: <strong>MSI</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Modern 15 B13M-438VN</strong> &nbsp; &nbsp; &nbsp;CPU: <strong>Intel Core i5-1335U</strong></p>\r\n', 1),
(20, 16, 'Tai Bluetooth Remax W33', 'tainghe4.jpg', 45, 0, 212000, 212000, '2025-05-08 23:31:04', 30, '<p><strong>Remax W33 gây ấn tượng mạnh nhờ thiết kế độc đáo như chiếc máy ảnh mini cùng chất âm ổn định – là món phụ kiện thời trang thú vị.</strong></p>\r\n<p>W33 mang kiểu dáng sáng tạo, hộp sạc trông như một chiếc máy chụp hình nhỏ xinh, cực kỳ bắt mắt. Kết nối Bluetooth mượt mà, âm thanh rõ ràng, mic đàm thoại tốt. Đây là sự lựa chọn lý tưởng cho những ai yêu thích phụ kiện cá tính và khác biệt.</p>\r\n<p>Theo đánh giá của anh <strong>Vũ Công Minh</strong>: <i><strong>“W33 không chỉ là tai nghe mà còn là món đồ cá nhân đầy phong cách – phù hợp giới trẻ thích độc lạ.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Remax</strong> &nbsp; &nbsp; &nbsp;Model: <strong>W33</strong> &nbsp; &nbsp; &nbsp;Thiết kế: <strong>Hình máy chụp hình</strong></p>\r\n', 1),
(21, 6, 'Laptop Dell Inspiron 15 7501', 'laptop3.jpg', 20, 0, 17500000, 16500000, '2025-05-08 09:54:06', 30, '<p><strong>Dell Inspiron 15 7501 là chiếc laptop văn phòng cao cấp với thiết kế sang trọng, cấu hình ổn định và thời lượng pin dài.</strong></p>\r\n<p>Chiếc máy này nổi bật với vỏ kim loại chắc chắn, mỏng nhẹ nhưng vẫn trang bị màn hình lớn 15.6 inch Full HD sắc nét. Với bộ xử lý Intel thế hệ mới, ổ SSD tốc độ cao và pin bền, Dell Inspiron 7501 phục vụ tốt cho công việc văn phòng, học tập, chỉnh sửa ảnh nhẹ và giải trí cơ bản.</p>\r\n', '<p>Hãng sản xuất: <strong>Dell</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Inspiron 15 7501</strong> &nbsp; &nbsp; &nbsp;Màn hình: <strong>15.6 inch</strong></p>\r\n', 1),
(23, 6, 'Laptop Lenovo Legion Pro 5 Y9000P (Core i9-14900HX)', 'laptop2.jpeg', 30, 0, 39500000, 37500000, '2025-05-08 12:19:16', 10, '<p><strong>Lenovo Legion Pro 5 Y9000P là cỗ máy chiến game cực mạnh với CPU Intel Core i9 đời 14, phù hợp cho game thủ và người làm đồ họa chuyên nghiệp.</strong></p>\r\n<p>Với chip Core i9-14900HX, dòng chip cao cấp nhất trong dòng laptop hiệu năng cao của Intel, sản phẩm xử lý mượt các tác vụ nặng như render video 4K, chơi game AAA, lập trình AI,… Cùng hệ thống tản nhiệt ColdFront 5.0 tối ưu, bàn phím RGB bắt mắt và màn hình chuẩn gaming giúp trải nghiệm cực kỳ chuyên nghiệp.</p>\r\n', '<p>Hãng sản xuất: <strong>Lenovo</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Legion Pro 5 Y9000P</strong> &nbsp; &nbsp; &nbsp;CPU: <strong>Intel Core i9-14900HX</strong></p>\r\n', 1),
(24, 6, 'Laptop HP Gaming Victus 16-d1193TX 7C138P (i5/8GB/16\'\'/W11)', 'laptop1.jpg', 20, 0, 25000000, 22400000, '2025-05-08 12:20:16', 20, '<p><strong>HP Victus 16-d1193TX là mẫu laptop gaming tầm trung có thiết kế cứng cáp, cấu hình mạnh mẽ đáp ứng tốt cả chơi game và làm việc sáng tạo.</strong></p>\r\n<p>Máy trang bị chip Intel Core i5 thế hệ 11, RAM 8GB, card đồ họa rời NVIDIA GeForce GTX cho trải nghiệm mượt mà trong các tựa game phổ biến như Valorant, CS:GO, LOL,… Màn hình lớn 16 inch Full HD cho không gian hiển thị rộng rãi, tần số quét cao giúp hiển thị hình ảnh mượt. Hệ thống tản nhiệt hiện đại giúp máy luôn ổn định khi xử lý tác vụ nặng.</p>\r\n', '<p>Hãng sản xuất: <strong>HP</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Victus 16-d1193TX</strong> &nbsp; &nbsp; &nbsp;CPU: <strong>Intel Core i5</strong> &nbsp; &nbsp; &nbsp;Màn hình: <strong>16 inch</strong></p>\r\n', 1),
(25, 16, 'Tai nghe Bluetooth Itel IEB-33 Đen', 'tainghe3.jpg', 50, 0, 299000, 199000, '2025-05-08 16:21:03', 6, '<p><strong>Itel IEB-33 là lựa chọn lý tưởng cho người dùng phổ thông cần một chiếc tai nghe Bluetooth giá rẻ nhưng đầy đủ tính năng cơ bản.</strong></p>\r\n<p>Sản phẩm có thiết kế gọn nhẹ, màu đen hiện đại, phù hợp với nhiều đối tượng người dùng. Kết nối Bluetooth ổn định, điều khiển cảm ứng dễ sử dụng, thời lượng pin khoảng 3-4 giờ cho mỗi lần sạc và có hộp sạc kèm theo.</p>\r\n<p>Trong buổi chia sẻ “Chọn tai nghe cho học sinh – sinh viên”, anh <strong>Hoàng N.Trung</strong> nhận xét: <i><strong>“Itel IEB-33 không nổi bật nhưng rất phù hợp cho nhu cầu nghe nhạc cơ bản, học online hay gọi video.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Itel</strong> &nbsp; &nbsp; &nbsp;Model: <strong>IEB-33</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Đen</strong></p>\r\n', 1),
(26, 2, 'OPPO A60 8GB|128GB', 'oppo2.png', 40, 0, 5690000, 4790000, '2025-05-08 16:23:55', 16, '<p><strong>Nếu bạn cần một chiếc điện thoại bền bỉ, thiết kế trẻ trung và hiệu năng ổn định thì OPPO A60 chính là sự lựa chọn lý tưởng.</strong></p>\r\n<p>OPPO A60 sở hữu bộ nhớ 8GB RAM cùng 128GB ROM, giúp thao tác đa nhiệm mượt mà và lưu trữ thoải mái. Máy được trang bị màn hình 6.67 inch siêu sáng 950 nits, cùng chuẩn độ bền quân đội Mỹ (MIL-STD-810H) chống va đập cực tốt. Thêm vào đó là viên pin lớn 5.000mAh cùng sạc nhanh SUPERVOOC 45W, cho trải nghiệm sử dụng suốt cả ngày dài.</p>\r\n<p>Trong buổi đánh giá “Smartphone cho sinh viên và người đi làm”, anh <strong>Nguyễn Thế Anh</strong> chia sẻ: <i><strong>“OPPO A60 là chiếc máy đáng tiền ở phân khúc tầm trung – đẹp, bền, pin khỏe, rất phù hợp cho ai cần dùng điện thoại bền bỉ và hiệu quả.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>OPPO</strong> &nbsp; &nbsp; &nbsp;Model: <strong>A60</strong> &nbsp; &nbsp; &nbsp;Dung lượng RAM/Bộ nhớ: <strong>8GB/128GB</strong></p>\r\n', 1),
(27, 2, 'Samsung Galaxy S23 FE 128GB', 'samsung3.jpg', 28, 2, 15990000, 14490000, '2025-05-08 20:31:17', 3, '<p><strong>Nếu bạn yêu thích dòng Galaxy S cao cấp nhưng lại muốn tiết kiệm ngân sách thì Galaxy S23 FE chính là lựa chọn lý tưởng.</strong></p>\r\n<p>Với thiết kế hiện đại và chất liệu cao cấp, Galaxy S23 FE mang trong mình sức mạnh của chip Exynos 2200 cùng bộ nhớ 128GB, màn hình AMOLED 120Hz và hệ thống camera được kế thừa từ dòng S23. Mọi trải nghiệm đều mượt mà, từ chơi game đến chụp ảnh hay quay video.</p>\r\n<p>Trong một buổi chia sẻ về “Smartphone Android cân bằng nhất trong tầm giá 10 triệu”, anh <strong>Hoàng N.Trung</strong> cho biết: <i><strong>“Galaxy S23 FE chính là bản rút gọn không thỏa hiệp của dòng S. Đây là chiếc máy giúp người dùng tiếp cận dòng cao cấp mà không cần bỏ ra quá nhiều tiền.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Samsung</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Galaxy S23 FE</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Mint/Graphite/Tím</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>128GB</strong></p>\r\n', 1),
(28, 2, 'OPPO A58 8GB/128GB', 'oppo1.jpg', 60, 1, 5490000, 4590000, '2025-05-08 20:36:43', 13, '<p><strong>Nếu bạn đang tìm một chiếc điện thoại vừa có thiết kế đẹp, vừa hoạt động ổn định thì OPPO A58 là cái tên không thể bỏ qua.</strong></p>\r\n<p>OPPO A58 sở hữu màn hình lớn 6.72 inch FHD+, thiết kế mỏng nhẹ cùng vi xử lý Helio G85 kết hợp với 8GB RAM và bộ nhớ 128GB, giúp máy hoạt động mượt mà ở cả các tác vụ học tập, làm việc và giải trí. Camera 50MP mang lại khả năng chụp ảnh sắc nét trong nhiều điều kiện ánh sáng.</p>\r\n<p>Trong chia sẻ tại buổi “Chọn điện thoại dưới 5 triệu đáng mua nhất 2024”, anh <strong>Hoàng N.Trung</strong> nhận định: <i><strong>“A58 là một lựa chọn tốt cả về ngoại hình lẫn hiệu năng. Nếu bạn là người yêu thích thương hiệu OPPO thì đây là một lựa chọn rất đáng cân nhắc.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>OPPO</strong> &nbsp; &nbsp; &nbsp;Model: <strong>A58</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Đen/Xanh</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>8GB/128GB</strong></p>\r\n', 1),
(29, 2, 'Realme C51 4GB|128GB', 'realmi.jpg', 30, 0, 3490000, 2890000, '2025-05-08 20:54:53', 13, '<p><strong>Nếu bạn nghĩ rằng smartphone giá rẻ sẽ luôn thiếu thốn tính năng thì có lẽ bạn nên nhìn lại với Realme C51.</strong></p>\r\n<p>Có thể bạn chưa biết, <strong>Realme C51</strong> là một trong những mẫu điện thoại phổ thông hiếm hoi có thiết kế hiện đại, màn hình lớn 6.7 inch, tần số quét 90Hz cùng viên pin 5000mAh tích hợp sạc nhanh 33W. Với RAM 4GB và bộ nhớ trong 128GB, thiết bị đáp ứng tốt nhu cầu học tập, giải trí và sử dụng hằng ngày.</p>\r\n<p>Anh <strong>Hoàng N.Trung</strong> (Section Manager - VEU) từng chia sẻ trong buổi nói chuyện “Smartphone giá rẻ đáng mua 2024” rằng: <i><strong>“C51 là chiếc máy cực kỳ hợp lý với học sinh – sinh viên, ai cần dùng app học tập, lướt web, xem video thì rất ổn.”</strong></i> Một lựa chọn tiết kiệm nhưng vẫn đầy đủ tiện ích đáng cân nhắc!</p>\r\n', '<p>Hãng sản xuất: <strong>Realme</strong> &nbsp; &nbsp; &nbsp;Model: <strong>C51</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Xanh/Đen</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>4GB/128GB</strong></p>\r\n', 1),
(30, 2, 'Xiaomi 15 Ultra 512GB', 'xiaomi.jpg', 45, 0, 34990000, 32990000, '2025-05-08 20:56:21', 16, '<p><strong>Nếu bạn nghĩ chỉ iPhone hoặc Samsung mới có thể đứng ở đỉnh cao công nghệ thì Xiaomi 15 Ultra sẽ khiến bạn phải suy nghĩ lại.</strong></p>\r\n<p>Xiaomi 15 Ultra là siêu phẩm flagship mới nhất của Xiaomi, nổi bật với camera hàng đầu sử dụng cảm biến Sony LYT-900, màn hình AMOLED 2K 120Hz siêu sắc nét, chip Snapdragon 8 Gen 3 cùng bộ nhớ khủng 512GB. Thiết kế kim loại kết hợp mặt lưng cao cấp mang đến cảm giác sang trọng và chắc chắn.</p>\r\n<p>Trong buổi chia sẻ về “Flagship Android dẫn đầu công nghệ 2024”, anh <strong>Hoàng N.Trung</strong> nhận xét: <i><strong>“Xiaomi 15 Ultra là một siêu phẩm thực thụ – camera vượt trội, hiệu năng cực mạnh và trải nghiệm phần mềm đã được hoàn thiện rõ rệt.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Xiaomi</strong> &nbsp; &nbsp; &nbsp;Model: <strong>15 Ultra</strong> &nbsp; &nbsp; &nbsp;Màu sắc: <strong>Đen/Trắng</strong> &nbsp; &nbsp; &nbsp;Dung lượng: <strong>512GB</strong></p>\r\n', 1),
(31, 16, 'Tai Nghe Bluetooth JBL', 'tainghe2.jpg', 29, 1, 420000, 350000, '2025-05-08 20:59:06', 26, '<p><strong>JBL luôn là thương hiệu được tin tưởng về chất lượng âm thanh và độ bền, đặc biệt trong phân khúc tai nghe không dây.</strong></p>\r\n<p>Với công nghệ âm thanh đặc trưng JBL Pure Bass, sản phẩm mang lại âm thanh sống động và đầy nội lực. Bluetooth thế hệ mới cho kết nối nhanh, ổn định. Thiết kế thể thao, pin dùng 4-6 giờ liên tục cùng hộp sạc tiện lợi.</p>\r\n<p>Chuyên gia âm thanh <strong>Nguyễn Văn Quý</strong> chia sẻ: <i><strong>“Dù là model nào, tai nghe JBL đều mang đến sự ổn định và trải nghiệm nghe nhạc tốt trong phân khúc giá.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>JBL</strong> &nbsp; &nbsp; &nbsp;Model: <strong>Không xác định</strong> &nbsp; &nbsp; &nbsp;Loại: <strong>Tai nghe Bluetooth</strong></p>\r\n', 1),
(32, 16, 'Tai nghe Bluetooth Soundpeats TrueFree Plus', 'tainghe1.jpg', 20, 0, 1290000, 999000, '2025-05-08 21:00:48', 58, '<p><strong>Soundpeats TrueFree Plus là mẫu tai nghe không dây chất lượng với âm thanh mạnh mẽ và thời lượng pin ấn tượng trong tầm giá.</strong></p>\r\n<p>Sản phẩm sở hữu công nghệ Bluetooth 5.0 cho kết nối ổn định, độ trễ thấp. Chất âm cân bằng, bass tốt, thời lượng pin lên tới 35 giờ khi dùng kèm hộp sạc. Thiết kế nhỏ gọn, vừa tai, dễ sử dụng cho cả luyện tập thể thao hay đàm thoại.</p>\r\n<p>Trong buổi trải nghiệm sản phẩm, anh <strong>Hoàng N.Trung</strong> nhận xét: <i><strong>“TrueFree Plus phù hợp với người dùng phổ thông muốn có tai nghe ổn định, pin lâu mà không cần chi quá nhiều.”</strong></i></p>\r\n', '<p>Hãng sản xuất: <strong>Soundpeats</strong> &nbsp; &nbsp; &nbsp;Model: <strong>TrueFree Plus</strong> &nbsp; &nbsp; &nbsp;Loại: <strong>Tai nghe Bluetooth True Wireless</strong></p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(19, 'buiquangdung', '$2y$10$gwhWzxifQVp0s5Z3mcFk9usYHAwiHgWtPFLQ4rcI74V1BXfPb2xbG', 'Dũng', 'user-default.png', 'buiquangdung6677@gmail.com', '0967676103', 'Ba Vì - Hà Nội', 0, 1),
(20, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'user-default.png', 'buiquangdung6677@gmail.com', '0967676103', 'Hà Nội', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `price`, `quantity`, `sell`, `created_at`) VALUES
(1, 'Nhập môn lập trình', 150000, 560, 0, '2024-04-21 22:26:33'),
(2, 'Hành trình về phương đông', 200000, 0, 0, '2024-04-21 22:25:58'),
(3, 'Tâm Lý Học Thành Công', 199000, 2000, 0, '2024-04-21 22:30:02'),
(7, 'Chưa kịp lớn', 150000, 50, 0, '2024-04-21 22:41:03'),
(8, 'Học cách làm giàu', 75000, 65, 0, '2024-04-21 22:41:18'),
(9, 'Thao túng tâm lý', 160000, 90, 0, '2024-04-21 22:41:36'),
(10, 'Ngàn hoa rực rỡ', 90000, 8, 0, '2024-04-21 22:41:57'),
(11, 'SẢN PHÂM 1', 123555, 10, 0, '2024-09-05 21:05:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
