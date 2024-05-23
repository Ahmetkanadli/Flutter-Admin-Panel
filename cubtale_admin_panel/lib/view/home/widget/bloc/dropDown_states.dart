class DropDownState{
  bool isPressed;
  String searchType;
  String searchTitle;

  DropDownState({
    this.isPressed = false,
    this.searchTitle = '',
    this.searchType = ''
  });

  DropDownState copyWith({bool? isPressed, String? searchType,String? searchTitle}){
    return DropDownState(
      isPressed: isPressed ?? this.isPressed,
      searchTitle: searchTitle ?? this.searchTitle,
      searchType: searchType ?? this.searchType,
    );
  }
}