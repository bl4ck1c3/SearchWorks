require "spec_helper"

describe FacetsHelper do
  describe "#render_single_facet" do
    before do
      @response = OpenStruct.new(facets: [])
    end
    it "should return nil if there is no facet available" do
      expect(helper.send(:render_single_facet, "not_a_facet")).to be_nil
    end
    it "should render the facet limit when the facet does exist " do
      @response.facets = [OpenStruct.new(name: "this_facet")]
      helper.should_receive(:facet_by_field_name).with("this_facet").and_return("a-facet")
      helper.should_receive(:render_facet_limit).with("a-facet", {}).and_return("a-partial")
      expect(helper.send(:render_single_facet, "this_facet")).to eq "a-partial"
    end
    it "should pass options onto #render_facet_limit" do
      @response.facets = [OpenStruct.new(name: "this_facet")]
      options = {partial: "the-partial-to-render"}
      helper.should_receive(:facet_by_field_name).with("this_facet").and_return("a-facet")
      helper.should_receive(:render_facet_limit).with("a-facet", options).and_return("a-partial")
      expect(helper.send(:render_single_facet, "this_facet", options)).to eq "a-partial"
    end
  end
end