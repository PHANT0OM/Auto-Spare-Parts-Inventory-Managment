import 'dart:ffi';

import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:flutter/material.dart';

import '../../newProduct/widget/Textformfield.dart';

class Newsupplier extends StatefulWidget {
  const Newsupplier({super.key});

  @override
  State<Newsupplier> createState() => _NewsupplierState();
}

class _NewsupplierState extends State<Newsupplier> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveSupplier() async {
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final apiService = SupplierApiService();

      final Map<String, dynamic> supplierData = {
        "id": int.parse(_idController.text),
        "name": _nameController.text,
        "phone": _phoneController.text,
      };

      await apiService.createsupplier(supplierData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Supplier Saved Successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.SteelBlue,
        title: CustomText(
          text: 'اضافة مورد',
          color: Colors.white,
          weight: FontWeight.w600,
          size: 25,
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(
                controller: _idController,
                labelText: 'رقم المورد',
                hintText: 'أدخل رقم المورد',
                isNumeric: true,
              ),
              SizedBox(height: 25),
              CustomTextField(
                controller: _nameController,
                labelText: 'اسم المورد',
                hintText: 'أدخل اسم المورد',
              ),
              SizedBox(height: 25),
              CustomTextField(
                controller: _phoneController,
                labelText: 'رقم الهاتف',
                hintText: 'أدخل رقم الهاتف',
                isNumeric: true,
                keyboardType: TextInputType.phone,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(height: 55),
              SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: _saveSupplier,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.SteelBlue,
      foregroundColor: Colors.white,
      elevation: 5,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    child: const CustomText(
      text: 'حفظ',
      color: Colors.white,
      weight: FontWeight.w600,
      size: 18,
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
