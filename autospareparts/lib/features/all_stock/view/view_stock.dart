import 'package:auto_space/features/all_stock/data/stock_models.dart';
import 'package:auto_space/features/all_stock/data/stock_repo.dart';
import 'package:auto_space/features/all_stock/widget/StockCard.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/core/network/api_services.dart';

class AllStockView extends StatefulWidget {
  const AllStockView({super.key});

  @override
  State<AllStockView> createState() => _AllStockViewState();
}

class _AllStockViewState extends State<AllStockView> {
  List<StockModels> _allStock = [];
  List<StockModels> _filteredStock = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchStock();
  }

  // 2. Fetch Data Function
  Future<void> _fetchStock() async {
    try {
      final apiService = StockApiService();
      final repo = StockRepositoryImpl(apiService: apiService);

      final stock = await repo.fetchstock();

      setState(() {
        _allStock = stock;
        _filteredStock = stock;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  // 3. Search Logic
  void _runFilter(String enteredKeyword) {
    List<StockModels> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, show all categories
      results = _allStock;
    } else {
      // Filter: Check if name contains the keyword (case insensitive)
      results = _allStock
          .where(
            (stock) => stock.productName.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    // Update the UI
    setState(() {
      _filteredStock = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "المخزون الكامل",
          color: Colors.white,
          weight: FontWeight.w600,
          size: 28,
        ),
        centerTitle: true,
        backgroundColor: AppColors.SteelBlue,
        elevation: 0,
      ),
      body: Column(
        children: [
          /// ================= SEARCH BAR =================
          Padding(
            
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            
            child: TextField(
              
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'البحث في المخزون...',
                prefixIcon: Icon(Icons.search, color: AppColors.SteelBlue),
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
              ),
            ),
          ),

          /// ================= LIST VIEW =================
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                ? Center(child: Text(_errorMessage))
                // FIX 1: Check _filteredStock.isEmpty so "No Stock" shows during search too
                : _filteredStock.isEmpty
                ? const Center(child: Text("لا يوجد مخزون"))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    // FIX 2: Use _filteredStock.length, NOT _allStock.length
                    itemCount: _filteredStock.length,
                    itemBuilder: (context, index) {
                      return Stockcard(stock: _filteredStock[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
