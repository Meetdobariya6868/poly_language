import 'package:flutter/material.dart';
import 'package:poly_language/screens/constant.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor, // Set primary color as blue
        scaffoldBackgroundColor: Colors.white, // Set scaffold background color as grey
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white, // Set text field background color as white
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Pop the current route to go back to the previous route
            },
          ),
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String? selectedOption = 'General'; // Initialize with 'General'

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatarWithEdit(),
            SizedBox(height: 20),
            Text('John Doe', style: TextStyle(fontSize: 20)),
            Text('Role: User', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            OptionRow(
              options: ['General', 'Security', 'Financial', 'Localization'],
              onOptionTap: (option) {
                setState(() {
                  selectedOption = option;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: selectedOption != null ? buildOptionContent(selectedOption!) : Placeholder(),
            ),
            SizedBox(height: 20),
            RoundedButton(
              text: 'Save',
              onPressed: () {
                // Handle save button tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionContent(String option) {
    switch (option) {
      case 'General':
        return GeneralOptionContent();
      case 'Security':
        return SecurityOptionContent();
      case 'Financial':
        return FinancialOptionContent();
      case 'Localization':
        return LocalizationOptionContent();
      default:
        return Placeholder(); // Placeholder for unknown option
    }
  }
}

class CircleAvatarWithEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.jpg'), // Placeholder image
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit icon tap
            },
          ),
        ),
      ],
    );
  }
}

class OptionRow extends StatelessWidget {
  final List<String> options;
  final Function(String) onOptionTap;

  const OptionRow({
    required this.options,
    required this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options
          .map((option) => GestureDetector(
        onTap: () => onOptionTap(option),
        child: Text(option),
      ))
          .toList(),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor, // Use primary color from the theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class BorderedTextFormField extends StatelessWidget {
  final String labelText;

  const BorderedTextFormField({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
          borderSide: BorderSide(color: Colors.grey), // Set the border color here

        ),
        labelText: labelText,
      ),
    );
  }
}

class GeneralOptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BorderedTextFormField(labelText: 'Email'),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'Name'),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Language'),
            items: ['English', 'Spanish', 'French'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle language selection
            },
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text('Some text')),
              Switch(value: true, onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class SecurityOptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BorderedTextFormField(labelText: 'Current Password'),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'New Password'),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'Retype New Password'),
        ],
      ),
    );
  }
}

class FinancialOptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Account Type'),
            items: ['Savings', 'Checking', 'Investment'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle account type selection
            },
          ),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'IBAN'),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'Account ID'),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Select option:'),
              SizedBox(width: 10),
              TextButton(onPressed: () {}, child: Text('Camera')),
              TextButton(onPressed: () {}, child: Text('Upload Photo')),
            ],
          ),
          SizedBox(height: 10),
          TextButton(onPressed: () {}, child: Text('Upload')),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'Address'),
        ],
      ),
    );
  }
}

class LocalizationOptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Time Zone'),
            items: ['GMT', 'CET', 'PST'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle time zone selection
            },
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Country'),
            items: ['USA', 'Canada', 'UK'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle country selection
            },
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Province'),
            items: ['Province 1', 'Province 2', 'Province 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle province selection
            },
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'City'),
            items: ['City 1', 'City 2', 'City 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle city selection
            },
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'District'),
            items: ['District 1', 'District 2', 'District 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle district selection
            },
          ),
          SizedBox(height: 10),
          BorderedTextFormField(labelText: 'Address'),
        ],
      ),
    );
  }
}
