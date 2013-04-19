atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @comics.each do |comic|
    next if comic.updated_at.blank?

    feed.entry( comic ) do |entry|
      entry.title   comic.title
      entry.summary "<img src='http://marchofthemeanies.com" + comic.image_url + "' width='480' height='480' />", type: "html"
    end
  end
end

