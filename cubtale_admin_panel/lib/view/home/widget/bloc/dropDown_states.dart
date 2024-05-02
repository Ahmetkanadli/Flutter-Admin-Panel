class DropDownState{
  bool isPressed;

  DropDownState({this.isPressed = false});

  DropDownState copyWith({required bool isPressed}){
    return DropDownState(
      isPressed: isPressed,
    );
  }
}