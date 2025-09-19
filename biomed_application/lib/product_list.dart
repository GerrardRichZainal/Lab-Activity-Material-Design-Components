import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'cart_item.dart';

class ProductListPage extends StatelessWidget {
  final void Function(CartItem) onAddToCart;

  const ProductListPage({super.key, required this.onAddToCart});

  final List<Map<String, dynamic>> products = const [
    {
      "title": "Paracetamol",
      "description": "Obat pereda nyeri dan penurun demam.",
      "image": "assets/images/paracetamol.jpeg",
      "price": 15000,
    },
    {
      "title": "Dextromethorphan",
      "description": "Obat batuk kering, tidak untuk anak < 6 tahun.",
      "image": "assets/images/dextromethorphan.jpeg",
      "price": 25000,
    },
    {
      "title": "Ambroxol",
      "description": "Pelancar dahak, mempermudah pengeluaran lendir.",
      "image": "assets/images/ambroxol.jpeg",
      "price": 30000,
    },
    {
      "title": "Guaifenesin",
      "description": "Ekspektoran untuk batuk berdahak.",
      "image": "assets/images/guaifenesin.jpeg",
      "price": 28000,
    },
    {
      "title": "Vitamin C",
      "description": "Suplemen daya tahan tubuh.",
      "image": "assets/images/vitamin_c.jpeg",
      "price": 20000,
    },
    {
      "title": "Zinc",
      "description": "Membantu metabolisme tubuh.",
      "image": "assets/images/zinc.jpeg",
      "price": 18000,
    },
    {
      "title": "Loratadine",
      "description": "Obat alergi antihistamin.",
      "image": "assets/images/loratadine.jpeg",
      "price": 35000,
    },
    {
      "title": "Cetirizine",
      "description": "Obat alergi gatal dan bersin.",
      "image": "assets/images/cetirizine.jpeg",
      "price": 32000,
    },
    {
      "title": "Omeprazole",
      "description": "Obat maag dan asam lambung.",
      "image": "assets/images/omeprazole.jpeg",
      "price": 40000,
    },
    {
      "title": "ORS",
      "description": "Larutan rehidrasi untuk diare.",
      "image": "assets/images/ors.jpeg",
      "price": 10000,
    },
  
    {
      "title": "Strepsils",
      "description": "Permen pelega tenggorokan untuk meredakan sakit tenggorokan.",
      "image": "assets/images/strepsils.jpeg",
      "price": 15000,
    },
    {
      "title": "Panadol",
      "description": "Pereda nyeri dan penurun panas.",
      "image": "assets/images/panadol.jpeg",
      "price": 18000,
    },
    {
      "title": "Bodrex",
      "description": "Obat sakit kepala dan pereda nyeri.",
      "image": "assets/images/bodrex.jpeg",
      "price": 12000,
    },
    {
      "title": "Antangin",
      "description": "Herbal untuk masuk angin dan daya tahan tubuh.",
      "image": "assets/images/antangin.jpeg",
      "price": 10000,
    },
    {
      "title": "Promag",
      "description": "Obat maag dan pereda asam lambung.",
      "image": "assets/images/promag.jpeg",
      "price": 15000,
    },
    {
      "title": "Polysilane",
      "description": "Obat kembung, maag, dan nyeri ulu hati.",
      "image": "assets/images/polysilane.jpeg",
      "price": 20000,
    },
    {
      "title": "Diapet",
      "description": "Obat herbal untuk diare.",
      "image": "assets/images/diapet.jpeg",
      "price": 12000,
    },
    {
      "title": "Entrostop",
      "description": "Obat diare praktis dan cepat.",
      "image": "assets/images/entrostop.jpeg",
      "price": 13000,
    },
    {
      "title": "Paramex",
      "description": "Obat sakit kepala, migren, dan nyeri ringan.",
      "image": "assets/images/paramex.jpeg",
      "price": 14000,
    },
    {
      "title": "Neozep Forte",
      "description": "Obat flu dan pilek dengan hidung tersumbat.",
      "image": "assets/images/neozep_forte.jpeg",
      "price": 16000,
    },
    {
      "title": "Decolgen",
      "description": "Obat flu dengan gejala hidung tersumbat dan sakit kepala.",
      "image": "assets/images/decolgen.jpeg",
      "price": 17000,
    },
    {
      "title": "Mixagrip",
      "description": "Obat flu untuk demam, pilek, dan sakit kepala.",
      "image": "assets/images/mixagrip.jpeg",
      "price": 15000,
    },
    {
      "title": "Counterpain",
      "description": "Krim pereda nyeri otot dan sendi.",
      "image": "assets/images/counterpain.jpeg",
      "price": 35000,
    },
    {
      "title": "FreshCare",
      "description": "Minyak aromaterapi roll-on untuk pusing dan masuk angin.",
      "image": "assets/images/freshcare.jpeg",
      "price": 20000,
    },
    {
      "title": "Minyak Kayu Putih",
      "description": "Minyak tradisional untuk masuk angin dan kehangatan tubuh.",
      "image": "assets/images/minyak_kayu_putih.jpeg",
      "price": 25000,
    },
    {
      "title": "Minyak Telon",
      "description": "Minyak hangat bayi untuk mencegah masuk angin.",
      "image": "assets/images/minyak_telon.jpeg",
      "price": 22000,
    },
    {
      "title": "OBH Combi",
      "description": "Obat batuk hitam herbal untuk batuk berdahak.",
      "image": "assets/images/obh_combi.jpeg",
      "price": 18000,
    },
    {
      "title": "Konidin",
      "description": "Obat batuk kering dan berdahak.",
      "image": "assets/images/konidin.jpeg",
      "price": 17000,
    },
    {
      "title": "Siladex",
      "description": "Obat batuk sirup tanpa alkohol.",
      "image": "assets/images/siladex.jpeg",
      "price": 16000,
    },
    {
      "title": "Lactacyd",
      "description": "Cairan pembersih antiseptik kulit.",
      "image": "assets/images/lactacyd.jpeg",
      "price": 30000,
    },
    {
      "title": "Betadine",
      "description": "Antiseptik untuk luka luar.",
      "image": "assets/images/betadine.jpeg",
      "price": 25000,
    },
    {
      "title": "Hansaplast",
      "description": "Plester luka anti air dan elastis.",
      "image": "assets/images/hansaplast.jpeg",
      "price": 8000,
    },
    {
      "title": "Theraflu",
      "description": "Obat flu serbuk yang diseduh.",
      "image": "assets/images/theraflu.jpeg",
      "price": 12000,
    },
    {
      "title": "You C1000",
      "description": "Minuman vitamin C botol untuk daya tahan tubuh.",
      "image": "assets/images/youc1000.jpeg",
      "price": 10000,
    },
    {
      "title": "Hemaviton",
      "description": "Suplemen energi dan vitamin.",
      "image": "assets/images/hemaviton.jpeg",
      "price": 28000,
    },
    {
      "title": "Enervon-C",
      "description": "Vitamin C + B kompleks untuk stamina.",
      "image": "assets/images/enervon_c.jpeg",
      "price": 27000,
    },
    {
      "title": "Imboost",
      "description": "Suplemen peningkat imun tubuh.",
      "image": "assets/images/imboost.jpeg",
      "price": 45000,
    },
    {
      "title": "Fatigon",
      "description": "Suplemen vitamin untuk mengatasi kelelahan.",
      "image": "assets/images/fatigon.jpeg",
      "price": 22000,
    },
    {
      "title": "Neurobion",
      "description": "Vitamin saraf B1, B6, B12 untuk kesehatan saraf.",
      "image": "assets/images/neurobion.jpeg",
      "price": 30000,
    },
    {
      "title": "Curcuma Plus",
      "description": "Suplemen anak untuk nafsu makan.",
      "image": "assets/images/curcuma_plus.jpeg",
      "price": 25000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Produk")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(
                    title: product["title"],
                    description: product["description"],
                    image: product["image"],
                    price: product["price"],
                    onAddToCart: onAddToCart,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        product["image"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      product["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Rp ${product["price"]}"),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
