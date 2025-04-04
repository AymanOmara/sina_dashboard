import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/dimensions.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductDataGridSource extends DataGridSource {
  List<ProductEntity> products;
  List<DataGridRow> _dataGridRows = [];
  final void Function(ProductEntity product) onDelete;
  final void Function(ProductEntity product) onUpdate;

  ProductDataGridSource({
    required this.products,
    required this.onUpdate,
    required this.onDelete,
  }) {
    _buildDataGridRows();
  }

  void _buildDataGridRows() {
    _dataGridRows = products.map<DataGridRow>((product) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: product.productId),
        DataGridCell<String>(columnName: 'name', value: product.productName),
        DataGridCell<double>(columnName: 'price', value: product.price),
        DataGridCell<String>(columnName: 'category', value: product.type.toLowerCase().tr),
        DataGridCell<Widget>(
          columnName: 'actions',
          value: _actionButtons(product),
        ),
      ]);
    }).toList();
  }

  Widget _actionButtons(ProductEntity product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            onUpdate(product);
            // Handle update logic
            print("Update ${product.productName}");
          },
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            onDelete(product);
            // Handle delete logic
            print("Delete ${product.productName}");
          },
        ),
      ],
    );
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'actions') {
          return dataGridCell.value as Widget;
        }
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.gridRowPadding,
          ),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
