import 'dart:io';
import 'package:vania/vania.dart';
import 'create_products.dart';
import 'create_customers.dart';
import 'create_orderitems.dart';
import 'create_orders.dart';
import 'create_vendors.dart';
import 'create_productnotes.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateCustomersTable().up();
		 await CreateVendorsTable().up();
		 await CreateProductsTable().up();
		 await CreateProductnotesTable().up();
		 await CreateOrdersTable().up();
		 await CreateOrderitemsTable().up();
	}

  dropTables() async {
		 await CreateProductnotesTable().down();
		 await CreateVendorsTable().down();
		 await CreateOrdersTable().down();
		 await CreateOrderitemsTable().down();
		 await CreateCustomersTable().down();
		 await CreateProductsTable().down();
	 }
}
