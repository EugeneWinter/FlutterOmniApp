import 'package:flutter/material.dart';

class DetailTeaPage extends StatefulWidget {
  final String heroTag;
  final String title;
  final int price;
  final Color glowColor;

  const DetailTeaPage({
    super.key,
    required this.heroTag,
    required this.title,
    required this.price,
    required this.glowColor,
  });

  @override
  State<DetailTeaPage> createState() => _DetailTeaPageState();
}

class _DetailTeaPageState extends State<DetailTeaPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.price * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            
            Center(
              child: Hero(
                tag: widget.heroTag,
                child: Icon(Icons.local_cafe, size: 250, color: widget.glowColor),
              ),
            ),
            const SizedBox(height: 30),
            
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color(0xFF212325),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Лучший выбор', style: TextStyle(color: Colors.white54, fontSize: 16)),
                    const SizedBox(height: 10),
                    Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, color: Colors.white),
                                onPressed: () {
                                  if (quantity > 1) setState(() => quantity--);
                                },
                              ),
                              Text('$quantity', style: const TextStyle(color: Colors.white, fontSize: 20)),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.white),
                                onPressed: () => setState(() => quantity++),
                              ),
                            ],
                          ),
                        ),
                        Text('$totalPrice ₽', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Этот чай собран на лучших плантациях высоко в горах. Он обладает уникальным ароматом и тонизирующим эффектом. Идеально подходит для утреннего пробуждения.',
                      style: TextStyle(color: Colors.white54, fontSize: 15, height: 1.5),
                    ),
                    const Spacer(),
                    
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.shade700,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Заказать', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.favorite_border, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}