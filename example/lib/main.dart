import 'package:flutter/material.dart';
import 'package:select_filter/select_filter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select Filter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF161f30),
        body: Center(
          child: SelectListBuilder(),
        ),
      ),
    );
  }
}

class SelectListBuilder extends StatefulWidget {
  SelectListBuilder({
    this.selectedKey,
    this.selectedValue,
  });

  final String selectedKey;
  final int selectedValue;

  @override
  _SelectListBuilderState createState() => _SelectListBuilderState();
}

class _SelectListBuilderState extends State<SelectListBuilder> {
  String selectedKey;
  int selectedValue;
  final Color mainColor = Color(0xFFBFFFD5);

  @override
  void initState() {
    super.initState();
    selectedKey = widget.selectedKey;
    selectedValue = widget.selectedValue;
  }

  var selectList = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
    "Option 5",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => SelectFilterBuilder(
              onChange: onChange,
              selectList: selectList,
              selectedIndex: selectedValue ?? 0,
              // activeItemColor: ,
              // activeItemSize: ,
              // activeItemWeight: ,
              // closeItemColor: ,
              // closeItemSize: ,
              // closeItemWeight: ,
              // passiveItemColor: ,
              // passiveItemSize: ,
              // passiveItemWeight: ,
              // bgColor: ,
              // hasBgBlur: ,
              // hasLoop: ,
              // itemHeight: ,
              // itemWidth: ,
              // itemBuilder: ,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            selectedKey ?? "Choose",
            style: TextStyle(
              color: mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  onChange(int key) {
    setState(() {
      selectedKey = selectList[key];
      selectedValue = key;
    });
  }
}
