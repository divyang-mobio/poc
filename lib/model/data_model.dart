class SafeModel {
  String? title;
  String? description;
  String? type;
  String? screenId;
  bool? isSafe;
  String? color;
  List<Properties>? properties;
  List<Buttons>? buttons;

  SafeModel(
      {this.title,
      this.description,
      this.type,
      this.screenId,
      this.isSafe,
      this.color,
      this.properties,
      this.buttons});

  SafeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    type = json['type'];
    screenId = json['screenId'];
    isSafe = json['isSafe'];
    color = json['color'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    if (json['buttons'] != null) {
      buttons = <Buttons>[];
      json['buttons'].forEach((v) {
        buttons!.add(Buttons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['screenId'] = screenId;
    data['isSafe'] = isSafe;
    data['color'] = color;
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    if (buttons != null) {
      data['buttons'] = buttons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  String? type;
  String? title;
  String? selectedOption;
  String? id;
  String? hint;
  String? isRequired;
  bool? isSafe;
  List<Options>? options;
  bool? isSelected;

  Properties(
      {this.type,
      this.title,
      this.selectedOption,
      this.id,
      this.hint,
      this.isRequired,
      this.isSafe,
      this.options,
      this.isSelected});

  Properties.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    selectedOption = json['selectedOption'];
    id = json['id'];
    hint = json['hint'];
    isRequired = json['IsRequired'];
    isSafe = json['isSafe'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    isSelected = json['IsSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['selectedOption'] = selectedOption;
    data['id'] = id;
    data['hint'] = hint;
    data['IsRequired'] = isRequired;
    data['isSafe'] = isSafe;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['IsSelected'] = isSelected;
    return data;
  }
}

class Options {
  String? title;
  String? isVisibleForOptions;
  String? id;
  String? iconUrl;
  bool? hasEmptyValue;

  Options(
      {this.title,
      this.isVisibleForOptions,
      this.id,
      this.iconUrl,
      this.hasEmptyValue});

  Options.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isVisibleForOptions = json['isVisibleForOptions'];
    id = json['id'];
    iconUrl = json['iconUrl'];
    hasEmptyValue = json['hasEmptyValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isVisibleForOptions'] = isVisibleForOptions;
    data['id'] = id;
    data['iconUrl'] = iconUrl;
    data['hasEmptyValue'] = hasEmptyValue;
    return data;
  }
}

class Buttons {
  String? title;
  String? color;
  String? action;

  Buttons({this.title, this.color, this.action});

  Buttons.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    color = json['color'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['color'] = color;
    data['action'] = action;
    return data;
  }
}
