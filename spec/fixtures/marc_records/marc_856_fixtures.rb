module Marc856Fixtures
  def simple_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='3'>Before text</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Title text1</subfield>
          <subfield code='z'>Title text2</subfield>
        </datafield>
      </record>
    xml
  end
  def labelless_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://library.stanford.edu</subfield>
        </datafield>
      </record>
    xml
  end
  def casalini_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='3'>Link text</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='x'>CasaliniTOC</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Title text1</subfield>
          <subfield code='z'>Title text2</subfield>
        </datafield>
      </record>
    xml
  end
  def stanford_only_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Available to stanford affiliated users at:</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Available-to-stanford-affiliated-users-at:</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='3'>Available to stanford affiliated users at</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Available to stanford affiliated users</subfield>
        </datafield>
      </record>
    xml
  end
  def fulltext_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='2'>
          <subfield code='3'>finding aid</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Title text1</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='2'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>This is the Finding Aid</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='1'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2=''>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
      </record>
    xml
  end
  def supplemental_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='2'>
          <subfield code='3'>Before text</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Title text1</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='2'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>Title text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='3'>this is the table of contents</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='3'>this is sample text</subfield>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2='1'>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>this is the abstract</subfield>
        </datafield>
        <datafield tag='856' ind1='0' ind2=''>
          <subfield code='u'>http://library.stanford.edu</subfield>
          <subfield code='y'>Link text</subfield>
          <subfield code='z'>this is the description</subfield>
        </datafield>
      </record>
    xml
  end
  def ez_proxy_856
    <<-xml
      <record>
        <datafield tag='856' ind1='0' ind2='0'>
          <subfield code='u'>http://ezproxy.stanford.edu/?url=http://library.stanford.edu</subfield>
        </datafield>
      </record>
    xml
  end
end