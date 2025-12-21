import 'package:auto_space/features/all_products/data/product_repo.dart';
import 'package:auto_space/features/all_warehouses/data/warehouse_models.dart';
import 'package:auto_space/features/all_warehouses/data/warehouse_repo.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/core/constants/app_color.dart';

import '../widget/Textformfield.dart';
import '../widget/dropDowmField.dart';

import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:auto_space/features/all_categories/data/category_repo.dart';

import 'package:auto_space/features/all_suppliers/data/supplier_models.dart';
import 'package:auto_space/features/all_suppliers/data/supplier_repo.dart';
import 'package:auto_space/features/all_products/data/product_models.dart';
import 'package:auto_space/core/network/api_services.dart';

class Managestockview extends StatefulWidget {
  const Managestockview({super.key});

  @override
  State<Managestockview> createState() => _ManagestocktViewState();
}

class _ManagestocktViewState extends State<Managestockview> {
  final TextEditingController _productidontroller = TextEditingController();
  final TextEditingController _warehouseidController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Product> _products = [];
  List<WarehouseModels> _warehouses = [];
  int? _selectedProductId;
  int? _selectedWarehouseId;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final productRepo = ProductRepositoryImpl(
        apiServices: ProductApiService(),
      );
      final warehouseRepo = WarehouseRepositoryImpl(
        apiService: WarehouseApiService(),
      );

      final results = await Future.wait([
        productRepo.fetchProducts(),
        warehouseRepo.fetchwarehouses(),
      ]);

      setState(() {
        _products = results[0] as List<Product>;
        _warehouses = results[1] as List<WarehouseModels>;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading data: $e");
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error loading lists: $e")));
      }
    }
  }

  Future<void> _saveStock() async {
    if (_selectedProductId == null ||
        _selectedWarehouseId == null ||
        _quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    try {
      final stockApi = StockApiService();

      final stockData = {
        "product_id": _selectedProductId,
        "warehouse_id": _selectedWarehouseId,
        "quantity": int.tryParse(_quantityController.text) ?? 0,
      };

      await stockApi.createstock(stockData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Product adeed to stock Successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error saving: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.DeepDarkBlue,
        title: const CustomText(
          text: "Stock Manager",
          color: Colors.white,
          weight: FontWeight.w800,
          size: 25,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  CustomDropdownField<int>(
                    labelText: 'Product',
                    value: _selectedProductId,
                    items: _products.map((prod) {
                      return DropdownMenuItem<int>(
                        value: prod.id,
                        child: Text(prod.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProductId = value;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  CustomDropdownField<int>(
                    labelText: 'Warehouse',
                    value: _selectedWarehouseId,
                    items: _warehouses.map((war) {
                      return DropdownMenuItem<int>(
                        value: war.id,
                        child: Text(war.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedWarehouseId = value;
                      });
                    },
                  ),
                  const SizedBox(height: 22),

                  // 4. ADDED: Quantity Field UI
                  CustomTextField(
                    labelText: "Quantity",
                    controller: _quantityController,
                    hintText: "Enter Quantity",
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 55),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.SteelBlue,
                      ),
                      onPressed: _saveStock,
                      child: const CustomText(
                        text: "Save",
                        color: Colors.white,
                        weight: FontWeight.w700,
                        size: 21,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
