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

class NewproductView extends StatefulWidget {
  const NewproductView({super.key});

  @override
  State<NewproductView> createState() => _NewproductViewState();
}

class _NewproductViewState extends State<NewproductView> {
  final TextEditingController _idController =
      TextEditingController(); // <--- ADDED ID CONTROLLER
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _originController = TextEditingController();

  List<CategoryModels> _categories = [];
  List<SupplierModels> _suppliers = [];

  int? _selectedCategoryId;
  int? _selectedSupplierId;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final categoryRepo = CategoryRepositoryImpl(
        apiService: CategoryApiService(),
      );
      final supplierRepo = SupplierRepositoryImpl(
        apiService: SupplierApiService(),
      );

      final results = await Future.wait([
        categoryRepo.fetchCategories(),
        supplierRepo.fetchSuppliers(),
      ]);

      setState(() {
        _categories = results[0] as List<CategoryModels>;
        _suppliers = results[1] as List<SupplierModels>;
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

  Future<void> _saveProduct() async {
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _selectedCategoryId == null ||
        _selectedSupplierId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    try {
      final productApi = ProductApiService();

      final productData = {
        "id": int.tryParse(_idController.text) ?? 0,
        "name": _nameController.text,
        "price": double.tryParse(_priceController.text) ?? 0.0,
        "cost": double.tryParse(_costController.text) ?? 0.0,
        "origin": _originController.text.isEmpty
            ? "Unknown"
            : _originController.text,
        "category_id": _selectedCategoryId,
        "supplier_id": _selectedSupplierId,
      };

      await productApi.createProduct(productData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Product Saved Successfully!"),
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
          text: "Add New Product",
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

                  CustomTextField(
                    controller: _idController,
                    labelText: 'Product ID',
                    hintText: 'Enter ID (e.g. 0)',
                    keyboardType: TextInputType.number,
                    isNumeric: true,
                  ),

                  const SizedBox(height: 22),

                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Product name',
                    hintText: 'Enter product name',
                  ),

                  const SizedBox(height: 22),

                  CustomDropdownField<int>(
                    labelText: 'Category',
                    value: _selectedCategoryId,
                    items: _categories.map((cat) {
                      return DropdownMenuItem<int>(
                        value: cat.id,
                        child: Text(cat.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategoryId = value;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  CustomTextField(
                    controller: _priceController,
                    labelText: 'Price',
                    keyboardType: TextInputType.number,
                    isNumeric: true,
                    hintText: 'Enter product price',
                  ),

                  const SizedBox(height: 22),

                  CustomTextField(
                    controller: _costController,
                    labelText: 'Cost',
                    keyboardType: TextInputType.number,
                    isNumeric: true,
                    hintText: 'Enter product cost',
                  ),

                  const SizedBox(height: 22),

                  CustomTextField(
                    controller: _originController,
                    labelText: 'Origin',
                    hintText: 'Enter origin (e.g. Germany)',
                  ),

                  const SizedBox(height: 22),

                  CustomDropdownField<int>(
                    labelText: 'Supplier',
                    value: _selectedSupplierId,
                    items: _suppliers.map((sup) {
                      return DropdownMenuItem<int>(
                        value: sup.id,
                        child: Text(sup.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSupplierId = value;
                      });
                    },
                  ),

                  const SizedBox(height: 55),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.SteelBlue,
                      ),
                      onPressed: _saveProduct,
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
