import 'package:vania/vania.dart';

class CreateOrdersTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('orders', () {
      primary('order_num');
      bigIncrements('order_num');
      bigInt('cust_id', unsigned: true);
      foreign('cust_id', 'customers', 'cust_id', constrained: true, onDelete: "CASCADE");
      dateTime('order_date');
      timeStamps();
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orders');
  }
}
