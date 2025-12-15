import 'package:flutter/material.dart';
import 'package:flutter_nhom2/api.dart';
import 'package:flutter_nhom2/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> allProducts = [];
  String searchText = "";
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = testAPI.getAllProduct();
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 3,
      toolbarHeight: 60,
      title: const Text(
        'Cửa Hàng Mua Sắm',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      actions: [
        Transform.translate(
          offset: const Offset(-30, 0), 
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm sản phẩm...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => searchText = value);
              },
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: futureProducts,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snap.hasError) {
                  return Center(child: Text("Lỗi: ${snap.error}"));
                }

                allProducts = snap.data!;
                List<Product> filtered = searchText.isEmpty
                    ? allProducts
                    : allProducts
                          .where(
                            (p) => p.title.toLowerCase().contains(
                              searchText.toLowerCase(),
                            ),
                          )
                          .toList();

                return myListView(filtered);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget myListView(List<Product> ls) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return myItem(ls[index]);
      },
    );
  }

  Widget myItem(Product p) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetail(product: p)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                p.image,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "\$${p.price}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        p.rate.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "(${p.count})",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildMainInfo(),
            const SizedBox(height: 20),
            _buildDescription(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  AppBar _buildAppBar() => AppBar(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
    title: Text(
      product.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis, 
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    actions: [
      Transform.translate(
        offset: const Offset(-30, 0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _buildImage() => Container(
    padding: const EdgeInsets.all(12),
    color: Colors.white,
    child: Image.network(product.image, height: 280, fit: BoxFit.contain),
  );

  Widget _buildMainInfo() => Container(
    padding: const EdgeInsets.all(14),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFavoriteTag(),
        const SizedBox(height: 10),
        Text(
          "\$${product.price}",
          style: const TextStyle(
            fontSize: 28,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        _buildRating(),
      ],
    ),
  );

  Widget _buildFavoriteTag() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.red.shade100,
      borderRadius: BorderRadius.circular(5),
    ),
    child: const Text(
      "Yêu thích",
      style: TextStyle(
        fontSize: 12,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _buildRating() => Row(
    children: [
      const Icon(Icons.star, color: Colors.orange, size: 20),
      const SizedBox(width: 4),
      Text("${product.rate}/5.0"),
      const SizedBox(width: 12),
      Text(
        "Đã bán ${product.count}",
        style: TextStyle(color: Colors.grey[600]),
      ),
    ],
  );

  Widget _buildDescription() => Container(
    padding: const EdgeInsets.all(14),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mô tả sản phẩm",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: const TextStyle(fontSize: 15, height: 1.4),
        ),
      ],
    ),
  );

  Widget _buildBottomBar() => Container(
    height: 60,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: Colors.black12)),
    ),
    child: Row(
      children: [
        _buildButton("Thêm vào giỏ hàng", Colors.green),
        const SizedBox(width: 10),
        _buildButton("Mua ngay", Colors.deepOrange),
      ],
    ),
  );

  Widget _buildButton(String text, Color color) => Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
