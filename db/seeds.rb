excuses = [
  "飲み会",
  "急な残業",
  "腰痛",
  "接待",
  "納期直前",
  "気力ゼロ"
]

excuses.each do |excuse_name|
  Excuse.find_or_create_by!(name: excuse_name)
end
