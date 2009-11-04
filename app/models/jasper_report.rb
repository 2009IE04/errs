# To change this template, choose Tools | Templates
# and open the template in the editor.



class JasperReport
  def self.build_pre_order(csv, supplier, template_path, pdf_path)
    jd = JRCsvDataSource.new(java.io.StringReader.new(csv))
    column_names = ["注文内容", "数量", "金額", "備考"].to_java(:string)

    jd.setColumnNames(column_names)
    jd.setUseFirstRowAsHeader(true)

    params = HashMap.new
    params.put("CLIENT_NAME", supplier.supplier_name)
    params.put("POST_CODE", supplier.post_code)
    params.put("ADDRESS", supplier.prefecture + supplier.address1 + supplier.address2)
    params.put("FAX", supplier.fax)

    JasperRunManager.runReportToPdfFile(template_path, pdf_path, params, jd)
  end
end