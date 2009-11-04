class StockoutController < ApplicationController
  def index
  end

  def search
    @stock_out_list = StockState.find_stock_out(params[:date])
    @current_date = params[:date]
    respond_to do |format|
      format.html {render :partial => "search"}
      format.csv  {response_csv(@stock_out_list.to_csv([:product_id,:product_name,:purchase_quantity]).tosjis, params)}
    end
  end

  def pdf
    @pdfs = []
    stock_out = StockState.find_stock_out_for_supplier(params[:date])
    stock_out.each_pair do |key, value|
      supplier = Supplier.find(key)
      csv = value.to_csv([:product_name, :purchase_quantity, :price])
      template_path = File.join(RAILS_ROOT, 'config/pdf', 'naiji.jasper')
      pdf_name = supplier.id.to_s + '_' + format_month(params) + '_' + Time.now.strftime('%Y%m%d') + '.pdf'
      pdf_path = File.join(RAILS_ROOT, 'public','pdf')
      pdf_path += File::SEPARATOR + pdf_name
      if !File.exist?(pdf_path)
        JasperReport.build_pre_order(csv, supplier, template_path, pdf_path)
      end
      @pdfs << {:supplier_id => supplier.id, :supplier_name => supplier.supplier_name, :pdf_name => pdf_name}
    end
    @current_date = params[:date]
  end

  def send_mail
    suppliers = params[:suppliers]
    puts "======="
    puts suppliers.inspect
    suppliers.each do |spl|
      puts spl.split(",").inspect
      supplier = Supplier.find(spl.split(",").last)
      puts supplier.inspect
      Sendmail.deliver_result(supplier,spl.split(",").first)
    end 
  end

  private
  def response_csv (csv, params)
    filename ='stockout_'+format_month(params)+".csv"
    send_data(csv, :type=>'text/csv', :filename=>filename)
  end

  def format_month params
    params[:date][:year]+params[:date][:month]
  end
end
