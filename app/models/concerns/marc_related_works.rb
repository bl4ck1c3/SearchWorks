module MarcRelatedWorks
  def marc_related_works
    if self.respond_to?(:to_marc)
      @marc_related_works ||= RelatedWork.new(self.to_marc)
    end
  end
end
