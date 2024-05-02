abstract class DropDownEvent{
  const DropDownEvent();
}

class IsPressedEvent extends DropDownEvent{
   bool isPressed;
  IsPressedEvent(this.isPressed);
}
