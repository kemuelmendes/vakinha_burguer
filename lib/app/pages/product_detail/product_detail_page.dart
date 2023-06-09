import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_increment_decrement.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'X-Burguer',
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                  child: Text(
                      'Lanche acompanha pão, hambúrguer, mussarela e maionse')),
            ),
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(
                width: context.percentWitdh(.5),
                child: const DeliveryIncrementDecrement(),
              ),
              Container(
                width: context.percentWitdh(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adicionar',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          r'R$70,00',
                          maxFontSize: 13,
                          minFontSize: 5,
                          maxLines: 1,
                          style: context.textStyles.textExtraBold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
