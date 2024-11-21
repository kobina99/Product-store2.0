import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkoutpage.dart';
import 'storepage.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Cart'),
            IconButton(
  icon: Icon(Icons.delete),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Cart'),
        content: Text('Are you sure you want to clear your cart?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cart.clearCart(); 
              Navigator.of(context).pop(); 
            },
            child: Text('Clear'),
          ),
        ],
      ),
    );
  },
),
          ],
        ),
      ),
      body: cart.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100, 
                    color: Colors.grey.shade400, 
                  ),
                  SizedBox(height: 20), 
                  Text(
                    'Your cart is currently empty.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black, 
                    ),
                  ),
                  SizedBox(height: 10), 
                  Text(
                    'Before proceeding to checkout, you must add some products to your shopping cart. You will find a lot of interesting products in our shop page.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey, 
                      fontSize: 16, 
                    ),
                  ),
                  SizedBox(height: 30), 
                  ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StorePage()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), 
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 30, 
      vertical: 12, 
    ),
  ),
  child: Text(
    'RETURN TO STORE',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold, 
      fontSize: 16,
    ),
  ),
),

                ],
              ),
            )
          : ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                var item = cart.cartItems[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('\$${item.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cart.removeItem(item);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total price display
                  Text(
                    'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20, 
                        vertical: 12, 
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), 
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 16, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
