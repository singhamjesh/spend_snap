import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../models/transaction.dart';
import '../../providers/transaction_provider.dart';

class TransactionForm extends ConsumerStatefulWidget {
  const TransactionForm({super.key});

  @override
  ConsumerState<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends ConsumerState<TransactionForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _addTransaction() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState?.value;
      final title = formData?['title'] ?? '';
      final amount = double.tryParse(formData?['amount'] ?? '0.0') ?? 0.0;
      final date = formData?['date'] ?? DateTime.now();
      final category = formData?['category'] ?? 'Uncategorized';
      final transaction = Transaction(
        title: title,
        amount: amount,
        date: date,
        type: amount >= 0 ? TransactionType.credited : TransactionType.debited,
        descriptions: formData?['descriptions'],
        category: category,
      );

      ref.read(transactionProvider.notifier).addTransaction(transaction);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Text(
                "Add New Transaction",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'title',
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(3),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'amount',
                decoration: InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.min(0.01),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderDateTimePicker(
                name: 'date',
                initialValue: DateTime.now(),
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderDropdown(
                name: 'category',
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'food', child: Text('Food')),
                  DropdownMenuItem(value: 'fair', child: Text('Fair')),
                  DropdownMenuItem(value: 'rent', child: Text('Rent')),
                  DropdownMenuItem(
                      value: 'utilities', child: Text('Utilities')),
                  DropdownMenuItem(
                      value: 'entertainment', child: Text('Entertainment')),
                  DropdownMenuItem(
                      value: 'healthcare', child: Text('Healthcare')),
                  DropdownMenuItem(
                      value: 'transportation', child: Text('Transportation')),
                  DropdownMenuItem(
                      value: 'education', child: Text('Education')),
                  DropdownMenuItem(value: 'clothing', child: Text('Clothing')),
                  DropdownMenuItem(
                      value: 'groceries', child: Text('Groceries')),
                  DropdownMenuItem(
                      value: 'diningOut', child: Text('Dining Out')),
                  DropdownMenuItem(value: 'travel', child: Text('Travel')),
                  DropdownMenuItem(value: 'savings', child: Text('Savings')),
                  DropdownMenuItem(
                      value: 'insurance', child: Text('Insurance')),
                  DropdownMenuItem(value: 'gifts', child: Text('Gifts')),
                  DropdownMenuItem(
                      value: 'donations', child: Text('Donations')),
                  DropdownMenuItem(
                      value: 'personalCare', child: Text('Personal Care')),
                  DropdownMenuItem(
                      value: 'subscriptions', child: Text('Subscriptions')),
                  DropdownMenuItem(
                      value: 'homeMaintenance',
                      child: Text('Home Maintenance')),
                ],
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'descriptions',
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _addTransaction,
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
