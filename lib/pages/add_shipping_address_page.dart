import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:city_pickers/city_pickers.dart';
import '../widgets/common_app_bar.dart';

@RoutePage()
class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({
    super.key,
    @QueryParam('name') this.name,
    @QueryParam('phone') this.phone,
    @QueryParam('address') this.address,
    @QueryParam('isDefault') this.isDefault,
    @QueryParam('editIndex') this.editIndex,
  });

  final String? name;
  final String? phone;
  final String? address;
  final String? isDefault;
  final String? editIndex;

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _detailAddressController = TextEditingController();
  String _province = '';
  String _city = '';
  String _area = '';
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name ?? '';
    _phoneController.text = widget.phone ?? '';
    if (widget.address != null) {
      final addressParts = widget.address!.split(' ');
      if (addressParts.length >= 4) {
        _province = addressParts[0];
        _city = addressParts[1];
        _area = addressParts[2];
        _detailAddressController.text = addressParts.sublist(3).join(' ');
      } else {
        _detailAddressController.text = widget.address!;
      }
    }
    _isDefault = widget.isDefault == 'true';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _detailAddressController.dispose();
    super.dispose();
  }

  Future<void> _showCityPicker() async {
    final result = await CityPickers.showCityPicker(
      context: context,
      cancelWidget: Text(
        '取消',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      confirmWidget: Text(
        '确定',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );

    if (result != null) {
      setState(() {
        _province = result.provinceName ?? '';
        _city = result.cityName ?? '';
        _area = result.areaName ?? '';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_province.isEmpty || _city.isEmpty || _area.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('请选择省市区')),
        );
        return;
      }

      final fullAddress =
          '$_province $_city $_area ${_detailAddressController.text}';
      final addressData = {
        'name': _nameController.text,
        'phone': _phoneController.text,
        'address': fullAddress.trim(),
        'isDefault': _isDefault.toString(),
      };

      context.router.pop(addressData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: widget.name != null ? '编辑收货地址' : '新增收货地址',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: '收货人姓名',
                      hintText: '请输入姓名',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入收货人姓名';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: '手机号码',
                      hintText: '请输入手机号码',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入手机号码';
                      }
                      if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value)) {
                        return '请输入正确的手机号码';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: _showCityPicker,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: '所在地区',
                        hintText: '请选择省市区',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _province.isEmpty && _city.isEmpty && _area.isEmpty
                                ? '请选择省市区'
                                : '$_province $_city $_area',
                            style: TextStyle(
                              color: _province.isEmpty
                                  ? Colors.black38
                                  : Colors.black87,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _detailAddressController,
                    decoration: const InputDecoration(
                      labelText: '详细地址',
                      hintText: '请输入街道门牌号等详细信息',
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入详细地址';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('设为默认地址'),
                      const Spacer(),
                      Switch(
                        value: _isDefault,
                        onChanged: (value) {
                          setState(() {
                            _isDefault = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text(
                '保存',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
