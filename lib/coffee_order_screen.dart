import 'package:flutter/material.dart';
import 'package:state_managment/coffee_order_notifier.dart';

class CoffeeOrderScreen extends StatelessWidget {
  CoffeeOrderScreen({super.key});
  final CoffeeOrderNotifier _coffeeOrderNotifier = CoffeeOrderNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EBE1),
      appBar: AppBar(
        title: const Text('Coffee Order Cart'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selected Quantity',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              ListenableBuilder(
                listenable: _coffeeOrderNotifier,
                builder: (context, child) {
                  return Text(
                    _coffeeOrderNotifier.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListenableBuilder(
                    listenable: _coffeeOrderNotifier,
                    builder: (context, child) {
                      return FloatingActionButton(
                        onPressed: _coffeeOrderNotifier.quantity != 0
                            ? () => _coffeeOrderNotifier.removeQuantity(1)
                            : null,
                        backgroundColor: _coffeeOrderNotifier.quantity != 0
                            ? Color(0xFF2C1E1A)
                            : Colors.grey.shade300,
                        child: const Icon(Icons.remove, color: Colors.white),
                      );
                    },
                  ),
                  const SizedBox(width: 40),
                  ListenableBuilder(
                    listenable: _coffeeOrderNotifier,
                    builder: (context, child) {
                      return FloatingActionButton(
                        onPressed: _coffeeOrderNotifier.quantity != 10
                            ? () => _coffeeOrderNotifier.addQuantity(1)
                            : null,
                        backgroundColor: _coffeeOrderNotifier.quantity != 10
                            ? Colors.brown.shade700
                            : Colors.grey.shade300,
                        child: const Icon(Icons.add, color: Colors.white),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Divider(thickness: 1.5, indent: 40, endIndent: 40),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Price: ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  ListenableBuilder(
                    listenable: _coffeeOrderNotifier,
                    builder: (context, child) {
                      return Text(
                        '\$ ${_coffeeOrderNotifier.totalPrice}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC68B59),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
