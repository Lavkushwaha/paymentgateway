class PaymentData {
  num userId;
  String userEmail;
  String userMobileNo;
  String merchantIdentifier;
  String transactionIdentifier;
  String transactionCurrency;
  String transactionAmount;
  String transactionDatetime;
  num paymentIdentifier;

  PaymentData({
    this.userId,
    this.userEmail,
    this.userMobileNo,
    this.merchantIdentifier,
    this.transactionIdentifier,
    this.transactionCurrency,
    this.transactionAmount,
    this.transactionDatetime,
    this.paymentIdentifier,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
    userId: json["user_id"] == null ? 0 as num : json["user_id"] as num,
    userEmail: json["user_email"] == null ? "" : json["user_email"],
    userMobileNo: json["user_mobileNo"] == null ? "" : json["user_mobileNo"],
    merchantIdentifier: json["merchant_identifier"],
    transactionIdentifier: json["transaction_identifier"],
    transactionCurrency: json["transaction_currency"],
    transactionAmount: json["transaction_amount"],
    transactionDatetime: json["transaction_datetime"],
    paymentIdentifier: json["payment_identifier"] == null
        ? 0 as num
        : json["payment_identifier"] as num,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_email": userEmail,
    "user_mobileNo": userMobileNo,
    "merchant_identifier": merchantIdentifier,
    "transaction_identifier": transactionIdentifier,
    "transaction_currency": transactionCurrency,
    "transaction_amount": transactionAmount,
    "transaction_datetime": transactionDatetime,
    "payment_identifier": paymentIdentifier,
  };
}
