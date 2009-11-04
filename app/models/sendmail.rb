class Sendmail < ActionMailer::Base
  

  def result(supplier,file_name,sent_at = Time.now)

    pdf_path = File.join(RAILS_ROOT, 'public','pdf')
    pdf_path += File::SEPARATOR + file_name
    subject    '内示書発送'
    recipients ''
    #recipients supplier.mail_address
    from       ''
    sent_on    sent_at
    attachment :content_type => "application/pdf",
    :body =>  File.read(pdf_path),
    :filename => file_name
    body :greeting => "#{supplier.supplier_name}様"
  end

end
