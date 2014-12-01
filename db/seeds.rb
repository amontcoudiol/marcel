# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "SecureRandom"


User.destroy_all
Vote.destroy_all
Campaign.destroy_all
Picture.destroy_all

birthday = "12/11/1975".to_date
first_names = ["Jack", "Monica", "Jim", "Victoria", "Bill", "Pamela", "Bob", "Scarlett", "Jimi", "Angelina", "David", "Eva", "Barack", "Michelle", "Brad", "Roselyne", "Patrick"]
pictures = ["http://assets.fiercemarkets.com/files/wireless/fierceimages/jack_dorsey.jpg", "http://www.eyerys.com/sites/default/files/jack_dorsey.jpg",
  "http://img.desktopnexus.com/group:avatar/150x150/monica-bellucci-51779d1821515.jpg", "http://www.tsbmag.com/wp-content/uploads/2008/11/monica_bellucci_8-150x150.jpg",
  "https://lh5.googleusercontent.com/-992cVQB0B80/TwqeM4M7QoI/AAAAAAAAAFs/5ZByvI9f8to/s150-c/photo.jpg", "https://lh4.googleusercontent.com/-Jc7Bi4CftrY/T8UxE-2PzjI/AAAAAAAAACI/7JYd_Vs1cX4/s150-c/photo.jpg",
  "http://www.mynewhair.info/wp-content/uploads/2008/03/03-Victoria-Beckham-150x150.png", "http://hdpicss.com/wp-content/uploads/2014/10/Victoria-Beckham-6.jpg",
  "http://www.xblafans.com/wp-content/uploads//2014/05/Bill-Gates-150x150.jpg", "http://www3.pcmag.com/media/images/311685-bill-gates-1981.jpg?thumb=y",
  "http://1.bp.blogspot.com/-sfe8z59S7Bo/Tgw4AurE4OI/AAAAAAAAHKE/-1HgW8rv7rc/s150-c/Ex%252Bnovio%252Bde%252BPamela%252BAnderson%252Ba%252Bdemand%25C3%25B3%252Bpor%252B22%252Bmillones%252Bde%252Bd%25C3%25B3lares.jpg", "http://zns.india.com/upload/2012/5/19/pamela-anderson-150-2.jpg",
  "http://photos.geni.com/p12/49/60/89/7b/534448386b314e74/pej97tiw_medium.jpg", "http://achievedstrategies.com/blog/wp-content/uploads/2011/06/bob-marley-happy-150x150.jpg",
  "http://shorthaircutsv.com/wp-content/uploads/2011/09/scarlett-johansson-short-hair-150x150.jpg", "http://i.imgur.com/VF3Kpk7.jpg",
  "http://www.elmoremagazine.com/wp-content/uploads/2014/08/think0110H-Think-Like-Jimi-Hendrix-4d43a08a-3e0d-4ad7-8ae6-55db7bd2821a-150x150.jpg", "http://www.verbicidemagazine.com/wp-content/uploads/2013/02/jimi-hendrix-feat-150x150.jpg",
  "http://wallpapers55.com/wp-content/uploads/2013/10/Angelina-Jolie-Hairstyle-150x150.jpg", "http://gossipsucker.com/wp-content/uploads/2009/04/angelina_jolie_starts_out_modeling12-150x150.jpg",
  "http://thenet.ng/wp-content/uploads/2014/10/David-Beckham-e1413597408624-150x150.jpg", "http://4.bp.blogspot.com/_ToO3jTl_gxQ/TGcgeAwiWaI/AAAAAAAAAB0/XPSxVtLY_kE/s320/davidbeckhamcornrows+.jpg",
  "http://static1.get-the-look.ca/articles/0/24/0/@/666-host-eva-longoria-attends-hollywood-150x150-1.jpg", "http://hdpicss.com/wp-content/uploads/2014/09/Eva-Longoria-Wallpapers-3-150x150.jpg",
  "http://rack.0.mshcdn.com/media/ZgkyMDEyLzEyLzA0L2FlL2JhcmFja19vYmFtLmJudgpwCXRodW1iCTE1MHgxNTAjCmUJanBn/13f49412/c2a/barack_obama.jpg", "http://blogs.ocweekly.com/navelgazing/assets_c/2011/03/young-barack-obama-150-thumb-150x150.jpg",
  "http://cdn.factcheck.org/UploadedFiles/2013/12/MObama.jpg", "http://www.jammiewf.com/assets/moboxing11-150x150.jpg",
  "http://www.thelawinsider.com/wp-content/uploads/2010/08/brad_pitt-tiger-150x150.jpg", "http://www.tuxboard.com/photos/2014/10/Brad-Pitt-150x150.jpg",
  "http://www.nilmirum.fr/wp-content/uploads/2014/06/Roselyne-Bachelot-150x150.jpg", "http://static.actustar.com/img/stars/150/24151.jpg",
  "http://i2.wp.com/www.legossip.net/wp-content/uploads/2014/10/Patrick-Sebastien-et-Nabilla-guerre-continue.jpg?resize=150%2C150", "http://www.zicabloc.com/wp-content/uploads/2014/02/patrick-sebastien-on-est-des-dingues-150x150.jpg"]

pictures_ids = []
34.times do |b|
  pic = Picture.create!(file: pictures[b])
  pictures_ids << pic.id
end

users = []
17.times do |c|
  if c.even?
    user = User.create!(first_name: first_names[c], birthday: birthday, gender: "male", password: "qwertzuiop", email: "yo#{c}@gmail.com")
  else
    user = User.create!(first_name: first_names[c], birthday: birthday, gender: "female", password: "qwertzuiop", email: "yo#{c}@gmail.com")
  end
  user.campaigns.create(picture_a_id: pictures_ids[2*c], picture_b_id: pictures_ids[2*c + 1])
  users << user
  birthday = birthday >> 12
end

users.each do |u|
  offsets = (1...Campaign.count).to_a

  (1..15).to_a.sample.times do
    offset = offsets.sample
    offsets.delete(offset)
    campaign = Campaign.offset(offset).first

    pic_offset = rand(2)
    if pic_offset == 0
      picture_id = campaign.picture_a_id
    else
      picture_id = campaign.picture_b_id
    end

    u.votes.create!(voted_picture_id: picture_id, campaign_id: campaign.id)
  end
end


