import 'package:flutter/material.dart';
import 'package:taskk/models/employee_model.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _fullNameController = TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;

  final List<EmployeeModel> _lstEmployees = [];

  // Gender Dropdown
  final List<DropdownMenuItem<String>> _genders = [
    const DropdownMenuItem(value: "Male", child: Text("Male")),
    const DropdownMenuItem(value: "Female", child: Text("Female")),
    const DropdownMenuItem(value: "Other", child: Text("Other")),
  ];

  // Department Dropdown
  final List<DropdownMenuItem<String>> _departments = [
    const DropdownMenuItem(value: "HR", child: Text("HR")),
    const DropdownMenuItem(value: "IT", child: Text("IT")),
    const DropdownMenuItem(value: "Finance", child: Text("Finance")),
    const DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
  ];

  @override
  void dispose() {
    _idController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  void _addEmployee() {
    if (_formKey.currentState!.validate()) {
      EmployeeModel employee = EmployeeModel(
        id: _idController.text,
        fullName: _fullNameController.text,
        gender: _selectedGender!,
        department: _selectedDepartment!,
      );

      setState(() {
        _lstEmployees.add(employee);
      });

      // Clear fields
      _idController.clear();
      _fullNameController.clear();

      _selectedGender = null;
      _selectedDepartment = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Employee ID
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: "Employee ID",
                  hintText: "Enter employee ID",
                  prefixIcon: const Icon(Icons.badge),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter employee ID";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Full Name
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Enter full name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter full name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Gender Dropdown
              DropdownButtonFormField(
                value: _selectedGender,
                items: _genders,

                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },

                decoration: InputDecoration(
                  labelText: "Gender",
                  prefixIcon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select gender";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Department Dropdown
              DropdownButtonFormField(
                value: _selectedDepartment,
                items: _departments,

                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                },

                decoration: InputDecoration(
                  labelText: "Department",
                  prefixIcon: const Icon(Icons.apartment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select department";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Add Button
              ElevatedButton.icon(
                onPressed: _addEmployee,

                icon: const Icon(Icons.add),

                label: const Text("Add Employee"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Employee List
              _lstEmployees.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _lstEmployees.length,

                      itemBuilder: (context, index) {
                        final employee = _lstEmployees[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),

                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Text(
                                employee.fullName[0].toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),

                            title: Text(employee.fullName),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID: ${employee.id}"),
                                Text("Gender: ${employee.gender}"),
                                Text("Department: ${employee.department}"),
                              ],
                            ),

                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  _lstEmployees.removeAt(index);
                                });
                              },

                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    )
                  : Text(
                      "No Employee Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey.shade400,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
