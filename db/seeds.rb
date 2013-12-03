# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(jnoconor cobus7 andersr irislee theevo ivanbrennan loganhasson tiffanypeon stephaniehoh ahimmelstoss danielchangNYC samtalks manu3569 glamouracademy rosiehoyem rayning0 mecampbellsoup AYC726 sarony emilyxxie polycarpou irmiller22 J-Scag scottluptowski TrevMcKendrick jamesjtong Clee681 davidbella richardsonjm gregeng samueldowens casunlight BandadaKM manleyhimself sonejah21). each do |user|
    User.create(:github_name => user)
  end