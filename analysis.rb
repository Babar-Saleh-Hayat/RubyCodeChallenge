class Analysis
  attr_reader :id, :title, :reasons, :lang

  Reason = Struct.new(:title, :description)

  def initialize(id:, title:, reasons:, lang:)
    @id = id
    @title = title
    @reasons = reasons.map do |item|
      Reason.new(item['title'], item['description'])
    end
    @lang = lang
  end

end

