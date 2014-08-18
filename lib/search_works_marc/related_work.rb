class RelatedWork < SearchWorksMarc
  include Enumerable
  def initialize(marc_record)
    @marc_record = select_related_works remove_fields marc_record.fields
  end

  def each
    for record in parse_marc_record
      yield record
    end
  end

  private

  def format_subfields sections
    sections.map do |section|
      temp_array = []
      section.each_with_index.map do |field, i|
        temp_array.push field.value
      end
      temp_array.compact
    end
  end
  def grouping
    puts @marc_record.inspect
    @marc_record.group_by { |f| f.nil? }
  end

  def label_by_indicator indicator
    'Related work'
  end

  def select_related_works fields
    fields.select do |f|
      f.tag == '730' ||
        (f.tag == '700' && f.subfields.find { |sf| sf.code == 't' })
    end
  end
end
