<?php
// Xử lý tìm kiếm
$keyword = isset($_POST['keyword']) ? $_POST['keyword'] : '';
$cate_id = isset($_POST['search_cate']) ? (int)$_POST['search_cate'] : 0;
$currentPage = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$productsPerPage = 5;

// Lấy danh sách sản phẩm từ bảng products
$list_products = $ProductModel->select_list_products($keyword, $cate_id, $currentPage, $productsPerPage);
?>


<!-- LIST PRODUCTS -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Quản lý kho hàng</h6>
            <a href="them-hoa-don" class="btn btn-custom"><i class="fa fa-plus"></i> Thêm hóa đơn</a>
        </div>

        <div class="table-responsive">
            <table class="table text-start align-middle table-bordered table-hover mb-0" id="khohang-list">
                <thead>
                    <tr class="text-dark">
                        <th scope="col">#</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Ngày nhập</th>
                        <th scope="col">Tồn kho</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Giá bán</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $index = 0;
                    $currentPage = isset($_GET['page']) ? (int)$_GET['page'] : 1;
                    $productsPerPage = 5;
                    foreach ($list_products as $value) {
                        $index++;
                        $orderNumber = ($currentPage - 1) * $productsPerPage + $index;
                        $date_formated = $BaseModel->date_format($value['create_date'], '');
                    ?>
                    <tr>
                        <td class="text-dark"><?=$orderNumber?></td>
                        <td class="text-dark" style="min-width: 200px;"><?=$value['name']?></td>
                        <td class="text-dark"><?=$date_formated?></td>
                        <td class="text-dark"><?=$value['quantity']?></td>
                        <td class="text-dark">
                            <?php
                                if ($value['quantity'] == 0) {
                                    echo '<span class="badge bg-danger">Hết hàng</span>';
                                } elseif ($value['quantity'] >= 10) {
                                    echo '<span class="badge bg-success">Còn hàng</span>';
                                } else {
                                    echo '<span class="badge bg-warning">Số lượng còn ít</span>';
                                }
                            ?>
                        </td>
                        <td class="text-dark" style="font-weight: 600;">
                            <?=number_format($value['price'])."₫"?>
                        </td>
                        <td>
                            <a href="index.php?quanli=cap-nhat-san-pham&id=<?=$value['product_id']?>" class="btn btn-primary">Sửa</a>
                            <a href="index.php?quanli=thung-rac-san-pham&xoatam=<?=$value['product_id']?>" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này?')">Xoá tạm</a>
                        </td>
                    </tr>
                    <?php 
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- LIST PRODUCTS END -->
