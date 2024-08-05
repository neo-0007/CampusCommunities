class PdfModel {
  final String pdfUrl;
  final String pdfTitle;
  final String uploadedBy;
  final String uploadDate;

  PdfModel( 
      {required this.pdfTitle,
      required this.pdfUrl,
      required this.uploadedBy,
      required this.uploadDate});

  factory PdfModel.fromJson(Map<String, dynamic> json) {
    return PdfModel(
        pdfTitle: json['pdf_title'],
        uploadDate: json['upload_date'],
        uploadedBy:json['uploaded_by'],
        pdfUrl:json['pdf_url']
        );
  }
}
