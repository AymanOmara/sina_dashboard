import 'package:domain/features/order/entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:ibn_sina_flutter/core/ui/dimensions.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrderDataGridSource extends DataGridSource {
  List<OrderEntity> orders;
  List<DataGridRow> _dataGridRows = [];
  final void Function(OrderEntity product) onDelete;
  final void Function(OrderEntity product) onUpdate;

  OrderDataGridSource({
    required this.orders,
    required this.onUpdate,
    required this.onDelete,
  }) {
    _buildDataGridRows();
  }

  void _buildDataGridRows() {
    _dataGridRows = orders.map<DataGridRow>((order) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: order.orderId),
        DataGridCell<double>(columnName: 'price', value: order.orderPrice+70),
        DataGridCell<Widget>(
          columnName: 'actions',
          value: _actionButtons(order),
        ),
      ]);
    }).toList();
  }

  Widget _actionButtons(OrderEntity product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            onUpdate(product);
            // Handle update logic
          },
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            onDelete(product);
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
