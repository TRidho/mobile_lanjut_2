import 'package:vania/vania.dart';

class CreateOrderitemsTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('orderitems', () {
      primary('order_item');
      bigIncrements('order_item');
      bigInt('order_num', unsigned: true);
      foreign('order_num', 'orders', 'order_num', constrained: true, onDelete: "CASCADE");
      bigInt('prod_id', unsigned: true);
      foreign('prod_id', 'products', 'prod_id', constrained: true, onDelete: "CASCADE");
      integer('quantity');
      integer('size');
      timeStamps();

    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orderitems');
  }
}
