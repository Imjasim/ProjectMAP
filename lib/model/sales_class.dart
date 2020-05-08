class Sales {
  String prodName;
  String  prodPrice ;
  String prodDesc;

  Sales (this.prodName, this.prodPrice, this.prodDesc);
  Sales.copy(Sales from) : this(from.prodName, from.prodPrice, from.prodDesc);
}