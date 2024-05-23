abstract class DropDownEvent{
  const DropDownEvent();
}

class IsPressedEvent extends DropDownEvent{
   bool isPressed;
  IsPressedEvent(this.isPressed);
}

class SearchTypeEvent extends DropDownEvent{
  String searchType;
  SearchTypeEvent(this.searchType);
}

class SearchTitleEvent extends DropDownEvent{
  String searchTitle;
  SearchTitleEvent(this.searchTitle);
}
