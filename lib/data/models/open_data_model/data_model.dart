class Data {
  final String hududlar;
  final int i2000Yil;
  final int i2001Yil;
  final int i2002Yil;
  final int i2003Yil;
  final int i2004Yil;
  final int i2005Yil;
  final int i2006Yil;
  final int i2007Yil;
  final int i2008Yil;
  final int i2009Yil;
  final int i2010Yil;
  final int i2011Yil;
  final int i2012Yil;
  final int i2013Yil;
  final int i2014Yil;
  final int i2015Yil;
  final int i2016Yil;
  final int i2017Yil;
  final int i2018Yil;
  final int i2019Yil;
  final int i2020Yil;

  Data({
    required this.hududlar,
    required this.i2000Yil,
    required this.i2001Yil,
    required this.i2002Yil,
    required this.i2003Yil,
    required this.i2004Yil,
    required this.i2005Yil,
    required this.i2006Yil,
    required this.i2007Yil,
    required this.i2008Yil,
    required this.i2009Yil,
    required this.i2010Yil,
    required this.i2011Yil,
    required this.i2012Yil,
    required this.i2013Yil,
    required this.i2014Yil,
    required this.i2015Yil,
    required this.i2016Yil,
    required this.i2017Yil,
    required this.i2018Yil,
    required this.i2019Yil,
    required this.i2020Yil,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      hududlar: json['hududlar'] as String? ?? '',
      i2000Yil: json['i2000Yil'] as int? ?? 0,
      i2001Yil: json['i2001Yil'] as int? ?? 0,
      i2002Yil: json['i2002Yil'] as int? ?? 0,
      i2003Yil: json['i2003Yil'] as int? ?? 0,
      i2004Yil: json['i2004Yil'] as int? ?? 0,
      i2005Yil: json['i2005Yil'] as int? ?? 0,
      i2006Yil: json['i2006Yil'] as int? ?? 0,
      i2007Yil: json['i2007Yil'] as int? ?? 0,
      i2008Yil: json['i2008Yil'] as int? ?? 0,
      i2009Yil: json['i2009Yil'] as int? ?? 0,
      i2010Yil: json['i2010Yil'] as int? ?? 0,
      i2011Yil: json['i2011Yil'] as int? ?? 0,
      i2012Yil: json['i2012Yil'] as int? ?? 0,
      i2013Yil: json['i2013Yil'] as int? ?? 0,
      i2014Yil: json['i2014Yil'] as int? ?? 0,
      i2015Yil: json['i2015Yil'] as int? ?? 0,
      i2016Yil: json['i2016Yil'] as int? ?? 0,
      i2017Yil: json['i2017Yil'] as int? ?? 0,
      i2018Yil: json['i2018Yil'] as int? ?? 0,
      i2019Yil: json['i2019Yil'] as int? ?? 0,
      i2020Yil: json['i2020Yil'] as int? ?? 0,
    );
  }
}
