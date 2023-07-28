
import '../../helpers/api_constant.dart';

class ScreenDataResponseModel {
  List<Screens>? screens;
  ApiStatus loadingStatus;

  ScreenDataResponseModel({this.screens,this.loadingStatus = ApiStatus.idle});

  ScreenDataResponseModel.fromJson(Map<String, dynamic> json,{this.loadingStatus = ApiStatus.idle}) {
    if (json['screens'] != null) {
      screens = <Screens>[];
      json['screens'].forEach((v) {
        screens!.add(Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.screens != null) {
      data['screens'] = this.screens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screens {
  String? screenName;
  String? heading;
  String? question;
  String? hintText;
  List<String>? fields;
  List<GenderOptions>? genderOptions;
  List<SkillsOptions>? skillsOptions;
  ChildScreen? childScreen;

  Screens(
      {this.screenName,
      this.heading,
      this.question,
      this.hintText,
      this.fields,
      this.genderOptions,
      this.skillsOptions,
      this.childScreen});

  Screens.fromJson(Map<String, dynamic> json) {
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    hintText = json['hint_text'];
    fields = json['fields'].cast<String>();
    if (json['options'] != null) {
      genderOptions = <GenderOptions>[];
      json['options'].forEach((v) {
        genderOptions!.add(new GenderOptions.fromJson(v));
      });
    }
    if (json['options'] != null) {
      skillsOptions = <SkillsOptions>[];
      json['options'].forEach((v) {
        skillsOptions!.add(new SkillsOptions.fromJson(v));
      });
    }
    childScreen = json['child_screen'] != null
        ? new ChildScreen.fromJson(json['child_screen'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screen_name'] = this.screenName;
    data['heading'] = this.heading;
    data['question'] = this.question;
    data['hint_text'] = this.hintText;
    data['fields'] = this.fields;
    if (this.genderOptions != null) {
      data['gender_options'] =
          this.genderOptions!.map((v) => v.toJson()).toList();
    }
    if (this.skillsOptions != null) {
      data['options'] =
          this.skillsOptions!.map((v) => v.toJson()).toList();
    }
    if (this.childScreen != null) {
      data['child_screen'] = this.childScreen!.toJson();
    }
    return data;
  }
}

class GenderOptions {
  String? text;
  String? value;

  GenderOptions({this.text, this.value});

  GenderOptions.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}

class SkillsOptions {
  String? key;
  String? text;
  String? value;

  SkillsOptions({this.key, this.text, this.value});

  SkillsOptions.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}

class ChildScreen {
  List<Frontend>? frontend;
  List<Backend>? backend;
  List<Designer>? designer;

  ChildScreen({this.frontend, this.backend, this.designer});

  ChildScreen.fromJson(Map<String, dynamic> json) {
    if (json['frontend'] != null) {
      frontend = <Frontend>[];
      json['frontend'].forEach((v) {
        frontend!.add(new Frontend.fromJson(v));
      });
    }
    if (json['backend'] != null) {
      backend = <Backend>[];
      json['backend'].forEach((v) {
        backend!.add(new Backend.fromJson(v));
      });
    }
    if (json['designer'] != null) {
      designer = <Designer>[];
      json['designer'].forEach((v) {
        designer!.add(new Designer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.frontend != null) {
      data['frontend'] = this.frontend!.map((v) => v.toJson()).toList();
    }
    if (this.backend != null) {
      data['backend'] = this.backend!.map((v) => v.toJson()).toList();
    }
    if (this.designer != null) {
      data['designer'] = this.designer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Frontend {
  String? screenName;
  String? heading;
  String? question;
  List<String>? fields;
  List<Frontend>? frontendOptions;

  Frontend(
      {this.screenName,
      this.heading,
      this.question,
      this.fields,
      this.frontendOptions});

  Frontend.fromJson(Map<String, dynamic> json) {
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    fields = json['fields'].cast<String>();
    if (json['frontend_options'] != null) {
      frontendOptions = <Frontend>[];
      json['frontend_options'].forEach((v) {
        frontendOptions!.add(new Frontend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screen_name'] = this.screenName;
    data['heading'] = this.heading;
    data['question'] = this.question;
    data['fields'] = this.fields;
    if (this.frontendOptions != null) {
      data['frontend_options'] =
          this.frontendOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Backend {
  String? screenName;
  String? heading;
  String? question;
  String? hintText;
  List<String>? fields;

  Backend(
      {this.screenName,
      this.heading,
      this.question,
      this.hintText,
      this.fields});

  Backend.fromJson(Map<String, dynamic> json) {
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    hintText = json['hint_text'];
    fields = json['fields'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screen_name'] = this.screenName;
    data['heading'] = this.heading;
    data['question'] = this.question;
    data['hint_text'] = this.hintText;
    data['fields'] = this.fields;
    return data;
  }
}

class Designer {
  String? screenName;
  String? heading;
  String? question;
  String? hintText;
  List<String>? fields;
  List<Designer>? desingerOptions;
  Null? ans;

  Designer(
      {this.screenName,
      this.heading,
      this.question,
      this.hintText,
      this.fields,
      this.desingerOptions,
      this.ans});

  Designer.fromJson(Map<String, dynamic> json) {
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    hintText = json['hint_text'];
    fields = json['fields'].cast<String>();
    if (json['desinger_options'] != null) {
      desingerOptions = <Designer>[];
      json['desinger_options'].forEach((v) {
        desingerOptions!.add(new Designer.fromJson(v));
      });
    }
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screen_name'] = this.screenName;
    data['heading'] = this.heading;
    data['question'] = this.question;
    data['hint_text'] = this.hintText;
    data['fields'] = this.fields;
    if (this.desingerOptions != null) {
      data['desinger_options'] =
          this.desingerOptions!.map((v) => v.toJson()).toList();
    }
    data['ans'] = this.ans;
    return data;
  }
}
