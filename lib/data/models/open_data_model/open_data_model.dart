class InfoOpenData {
  Result? result;
  int? status;
  int? code;
  Null? error;
  Null? errors;

  InfoOpenData({this.result, this.status, this.code, this.error, this.errors});

  InfoOpenData.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
    code = json['code'];
    error = json['error'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    data['error'] = this.error;
    data['errors'] = this.errors;
    return data;
  }
}

class Result {
  int? count;
  List<Data>? data;

  Result({this.count, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? hududlar;
  int? i2000Yil;
  int? i2001Yil;
  int? i2002Yil;
  int? i2003Yil;
  int? i2004Yil;
  int? i2005Yil;
  int? i2006Yil;
  int? i2007Yil;
  int? i2008Yil;
  int? i2009Yil;
  int? i2010Yil;
  int? i2011Yil;
  int? i2012Yil;
  int? i2013Yil;
  int? i2014Yil;
  int? i2015Yil;
  int? i2016Yil;
  int? i2017Yil;
  int? i2018Yil;
  int? i2019Yil;
  int? i2020Yil;

  Data(
      {this.hududlar,
        this.i2000Yil,
        this.i2001Yil,
        this.i2002Yil,
        this.i2003Yil,
        this.i2004Yil,
        this.i2005Yil,
        this.i2006Yil,
        this.i2007Yil,
        this.i2008Yil,
        this.i2009Yil,
        this.i2010Yil,
        this.i2011Yil,
        this.i2012Yil,
        this.i2013Yil,
        this.i2014Yil,
        this.i2015Yil,
        this.i2016Yil,
        this.i2017Yil,
        this.i2018Yil,
        this.i2019Yil,
        this.i2020Yil});

  Data.fromJson(Map<String, dynamic> json) {
    hududlar = json['Hududlar'];
    i2000Yil = json['2000Yil'];
    i2001Yil = json['2001Yil'];
    i2002Yil = json['2002Yil'];
    i2003Yil = json['2003Yil'];
    i2004Yil = json['2004Yil'];
    i2005Yil = json['2005Yil'];
    i2006Yil = json['2006Yil'];
    i2007Yil = json['2007Yil'];
    i2008Yil = json['2008Yil'];
    i2009Yil = json['2009Yil'];
    i2010Yil = json['2010Yil'];
    i2011Yil = json['2011Yil'];
    i2012Yil = json['2012Yil'];
    i2013Yil = json['2013Yil'];
    i2014Yil = json['2014Yil'];
    i2015Yil = json['2015Yil'];
    i2016Yil = json['2016Yil'];
    i2017Yil = json['2017Yil'];
    i2018Yil = json['2018Yil'];
    i2019Yil = json['2019Yil'];
    i2020Yil = json['2020Yil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hududlar'] = this.hududlar;
    data['2000Yil'] = this.i2000Yil;
    data['2001Yil'] = this.i2001Yil;
    data['2002Yil'] = this.i2002Yil;
    data['2003Yil'] = this.i2003Yil;
    data['2004Yil'] = this.i2004Yil;
    data['2005Yil'] = this.i2005Yil;
    data['2006Yil'] = this.i2006Yil;
    data['2007Yil'] = this.i2007Yil;
    data['2008Yil'] = this.i2008Yil;
    data['2009Yil'] = this.i2009Yil;
    data['2010Yil'] = this.i2010Yil;
    data['2011Yil'] = this.i2011Yil;
    data['2012Yil'] = this.i2012Yil;
    data['2013Yil'] = this.i2013Yil;
    data['2014Yil'] = this.i2014Yil;
    data['2015Yil'] = this.i2015Yil;
    data['2016Yil'] = this.i2016Yil;
    data['2017Yil'] = this.i2017Yil;
    data['2018Yil'] = this.i2018Yil;
    data['2019Yil'] = this.i2019Yil;
    data['2020Yil'] = this.i2020Yil;
    return data;
  }
}