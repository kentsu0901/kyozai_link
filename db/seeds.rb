subjects = [
  { name: "国語", sort_order: 1 },
  { name: "地歴", sort_order: 2 },
  { name: "公民", sort_order: 3 },
  { name: "数学", sort_order: 4 },
  { name: "理科", sort_order: 5 },
  { name: "保健体育", sort_order: 6 },
  { name: "芸術", sort_order: 7 },
  { name: "外国語", sort_order: 8 },
  { name: "家庭", sort_order: 9 },
  { name: "情報", sort_order: 10 }
]

subjects.each do |subject|
  Subject.find_or_create_by!(name: subject[:name]) do |record|
    record.sort_order = subject[:sort_order]
  end
end
