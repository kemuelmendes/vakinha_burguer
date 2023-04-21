import 'package:delivery_app/app/core/ui/helpers/loader.dart';
import 'package:delivery_app/app/core/ui/helpers/messages.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:delivery_app/app/pages/home/widgets/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DeliveryProductTile(
                    product: ProductModel(
                        id: 0,
                        name: 'Lanche X',
                        description:
                            'Lanche acompanha pão, hambúguer, mussarela e maionese',
                        price: 15.5,
                        image:
                            'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
                  );
                }),
          )
        ],
      ),
    );
  }
}
