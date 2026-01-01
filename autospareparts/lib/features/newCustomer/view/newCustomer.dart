import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:flutter/material.dart';

import '../../newProduct/widget/Textformfield.dart';

class Newcustomer extends StatefulWidget {
  const Newcustomer({super.key});

  @override
  State<Newcustomer> createState() => _NewcustomerState();
}

class _NewcustomerState extends State<Newcustomer> {
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

  Future<void> _savecustomer() async {
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("من فضلك أدخل جميع البيانات"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final apiService = CustomerApiService();

      final Map<String, dynamic> customerData = {
        "id": int.parse(_idController.text),
        "name": _nameController.text,
        "phone": _phoneController.text,
      };

      await apiService.createcustomer(customerData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("تم حفظ العميل بنجاح"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("حدث خطأ: $e"),
            backgroundColor: Colors.red,
          ),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CustomText(
          text: 'عميل جديد',
          color: Colors.white,
          weight: FontWeight.w600,
          size: 25,
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(
                controller: _idController,
                labelText: 'رقم العميل',
                hintText: 'أدخل رقم العميل',
                isNumeric: true,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 25),
        
              CustomTextField(
                controller: _nameController,
                labelText: 'اسم العميل',
                hintText: 'أدخل اسم العميل',
              ),
              const SizedBox(height: 25),
        
              CustomTextField(
                controller: _phoneController,
                labelText: 'رقم الهاتف',
                hintText: 'أدخل رقم الهاتف',
                isNumeric: true,
                keyboardType: TextInputType.phone,
              ),
        
              const SizedBox(height: 45),
        
              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _savecustomer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 14,
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
