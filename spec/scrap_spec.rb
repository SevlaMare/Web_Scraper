require 'nokogiri'
require 'open-uri'
require_relative '../lib/metadata.rb'
require_relative '../lib/engine.rb'

describe Engine do
  let(:scrap) { Engine.new }
  let(:page) { scrap.scan_now(1, 'Full Stack') }

  context 'When start instance of Engine' do
    it 'Should have default css classes on Metadata' do
      expect(scrap.instance_variable_get(:@map_class))
        .to eq(
          {
            'title' => '.card-link',
            'location' => '.jobposting-location',
            'salary' => '.jobposting-salary',
            'content' => '.jobposting-snippet'
          }
        )
    end
  end

  context 'When Scrapping the predefined page' do
    it 'Should return a not empty array for css class title' do
      expect(scrap.get_it(page, 'title'))
        .not_to be_empty
    end

    it 'Should return a not empty array for css class location' do
      expect(scrap.get_it(page, 'location'))
        .not_to be_empty
    end

    it 'Should return a not empty array for css class salary' do
      expect(scrap.get_it(page, 'salary'))
        .not_to be_empty
    end

    it 'Should return a not empty array for css class content' do
      expect(scrap.get_it(page, 'content'))
        .not_to be_empty
    end

    it 'Should return nil for css class that are not in setup' do
      expect(scrap.get_it(page, 'abc'))
        .to eq(nil)
    end
  end
end
