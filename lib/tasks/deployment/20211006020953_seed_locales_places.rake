# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
namespace :after_party do
  desc 'Deployment task: seed_locales_places'
  task seed_locales_places: :environment do
    puts "Running deploy task 'seed_locales_places'"

    # Put your task implementation HERE.
    locales = [
      {
        params: {
          name: 'Chicago, IL',
          content: 'Coolest city in the world',
          hero_image_url: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F02%2F11%2Fchicago-illinois-CHITG0221.jpg&w=1050&h=704&c=sc&poi=face&q=85'
        },
        external_place_id: 'ChIJ7cv00DwsDogRAMDACa2m4K8'
      },
      {
        params: {
          name: 'Seattle, WA',
          content: 'Supersonic city',
          hero_image_url: 'https://media.cntraveler.com/photos/60480c67ff9cba52f2a91899/16:9/w_2560%2Cc_limit/01-velo-header-seattle-needle.jpg'
        },
        external_place_id: 'ChIJVTPokywQkFQRmtVEaUZlJRA'
      },
      {
        params: {
          name: 'Richmond, VA',
          content: 'Historic capital city of Virginia',
          hero_image_url: 'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,h_800,q_65,w_1920/v1/clients/virginia/CN19071201V_233_57a18292-4ab6-4633-b730-60cf1f0e531b.jpg'
        },
        external_place_id: 'ChIJ7cmZVwkRsYkRxTxC4m0-2L8'
      }
    ]

    locales.each do |locale|
      Locales::Create.run!(locale)
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
# rubocop:enable Metrics/BlockLength
