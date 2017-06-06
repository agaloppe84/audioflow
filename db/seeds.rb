Category.destroy_all
Track.destroy_all

def random_number
  rand(0.03..0.14)
end






category01 = Category.create!(name: "Funk")



track01 = Track.create!(name: "S.S.O O6", artist: "Soul sensation orchestra", duration: "3min40s", category: category01, year: "1977", audio_url: "https://res.cloudinary.com/dytbi4y5w/video/upload/v1496779129/06_S.S.O._06_rrgzpk.mp3", artist_description: "No description")
track02 = Track.create!(name: "Warm weather", artist: "Pieces of a dream", duration: "4min30s", category: category01, year: "1981", audio_url: "https://res.cloudinary.com/dytbi4y5w/video/upload/v1496762058/Warm_weather_pieces_of_a_dream_81_sgwjfa.m4a", artist_description: "Pieces of a Dream is an American R&B and jazz group from Philadelphia. The group was formed in 1976 by bassist Cedric Napoleon, drummer Curtis Harmon, and keyboardist James Lloyd. At the time, the three were all teenagers. The group based their name on 'Pieces of Dreams', a Michel Legrand tune recorded by Stanley Turrentine that the group performed. In late 1983, the group had their most successful single, 'Fo-Fi-Fo', which peaked at #13 on the US soul chart.")
track03 = Track.create!(name: "Nice vibes", artist: "The anvil band", duration: "4min30s", category: category01, year: "1974", audio_url: "https://res.cloudinary.com/dytbi4y5w/video/upload/v1496778088/10_10_Nice_Vibes_fuw8l2.mp3", artist_description: "No description")
track04 = Track.create!(name: "Show stopper", artist: "ADC band", duration: "4min30s", category: category01, year: "1977", audio_url: "https://res.cloudinary.com/dytbi4y5w/video/upload/v1496778601/ADC_Band_-_Showstopper__82__12_Inch_y04d49.mp3", artist_description: "No description")
@tracks = Track.all





@tracks.each_with_index do |track, index|
  ("Track#{index+1} ************************").chars.each do |char|
    print char
    sleep(random_number)
  end
  puts " "
  ("Title : #{track.name}").chars.each do |char|
    print char
    sleep(random_number)
  end
  puts " "
  ("Artist : #{track.artist}").chars.each do |char|
    print char
    sleep(random_number)
  end
  puts " "
  ("Category : #{track.category.name}").chars.each do |char|
    print char
    sleep(random_number)
  end
  puts " "
  ("Duration : #{track.duration}").chars.each do |char|
    print char
    sleep(random_number)
  end
  puts " "
  puts " "
end
