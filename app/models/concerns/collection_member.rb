module CollectionMember
  def is_a_collection_member?
    self[:collection] and self[:collection] != ['sirsi']
  end

  def parent_collections
    return nil unless is_a_collection_member?
    @parent_collections ||= Blacklight.solr.select(
      params: { fq: parent_collection_params }
    )['response']['docs'].map do |doc|
      SolrDocument.new(doc)
    end
  end

  def index_parent_collections
    return nil if !is_a_collection_member? || self[:collection_with_title].blank?
    unless @index_parent_collections
      @index_parent_collections = self[:collection_with_title].map do |collection_with_title|
        id, title = collection_with_title.split('-|-').map(&:strip)
        SolrDocument.new(id: id, title_display: title)
      end
    end
    @index_parent_collections
  end

  def online_label
    return if is_a_collection?
    return if druid.blank?
    "<span class='online-label'>Online</span>".html_safe
  end

  private
  def parent_collection_params
    self["collection"].map do |collection_id|
      "id:#{collection_id}"
    end.join(" OR ")
  end
end
