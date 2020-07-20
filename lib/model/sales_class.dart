class Sales {
  String id;
  String prodName;
  String  prodPrice ;
  String prodDesc;

  Sales (this.id, this.prodName, this.prodPrice, this.prodDesc);
  Sales.copy(Sales from) : this(from.id, from.prodName, from.prodPrice, from.prodDesc);

  Sales.fromJson(Map<String, dynamic> json)
      : this(
             json['id'], json['prodName'], json['prodPrice'], json['prodDesc']
            );

  Map<String, dynamic> toJson() =>
      {'id': id, 'prodName': prodName, 'prodPrice': prodPrice, 'prodDesc': prodDesc};
}