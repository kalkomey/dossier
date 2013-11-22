require 'axlsx'

module Dossier
	class Axlsx
		class_attribute :default_format			
		self.default_format = :xlsx

	  def self.call(template)
	    "xlsx_package = ::Axlsx::Package.new(author: nil);" + 
	    template.source +
	    "; xlsx_package.to_stream.string;"
	  end
	end
end

ActionView::Template.register_template_handler :axlsx, Dossier::Axlsx