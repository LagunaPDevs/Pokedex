class RouterPageModel {
  RouterPageModel({
    this.handled,
    required this.key,
    this.isActive = true,
  });

  String key;
  bool isActive;
  Function? handled;

  factory RouterPageModel.fromNoData() => RouterPageModel(
        key: "",
        handled: null,
        isActive: false,
      );
}
