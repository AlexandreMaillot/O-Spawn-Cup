import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/shared/widgets/custom_background_around_field.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/models/server_type.dart";
typedef onChangeCallback = void Function(BuildContext context, Object? data);

class CustomDropdown extends StatefulWidget {
  String hintText;
  List<DropdownMenuItem<Object>>? listItem;
  FocusNode? typeFocus;
  Object? dropdownValue;
  onChangeCallback? onChanged;
  CustomDropdown({Key? key, required this.hintText,required this.listItem,this.typeFocus,this.onChanged}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BackgroundAroundField(
      screenSize: screenSize,
      child: Center(
        child: DropdownButton(
          focusNode: widget.typeFocus,
          value: widget.dropdownValue,
          isExpanded: true,
          hint: Text(widget.hintText,
            style: TextStyle(
              color: colorHintTextTheme.withOpacity(0.43),
              fontFamily: "o_spawn_cup_font",
              fontSize: 14,
            ),
          ),
          icon: widget.dropdownValue == null
              ? IconButton(splashColor: Colors.transparent,highlightColor: Colors.transparent,onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/downArrow.svg",
                    height: 10,
                    width: 15,
                  ))
              : IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(Icons.clear,),
                  padding: const EdgeInsets.only(bottom: 0),
                  onPressed: () => setState(() {

                    widget.dropdownValue = null;
                    widget.onChanged!(context,null);
                      })),
          elevation: 16,
          style: TextStyle(color: colorBackgroundTheme),
          underline: const SizedBox(),
          onChanged: (newValue) {
            setState(() {

              widget.dropdownValue = newValue!;
              widget.onChanged!(context,newValue);
            });
          },
          items: widget.listItem,
        ),
      ),
    );
  }
}
