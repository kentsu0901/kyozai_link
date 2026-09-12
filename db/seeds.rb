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

AcademicYear.find_or_create_by!(year: 2027)

academic_year = AcademicYear.find_by!(year: 2027)

course_data = {
  "国語" => [
    { name: "現代の国語", grade: 1 },
    { name: "言語文化", grade: 1 },
    { name: "論理国語", grade: 2 },
    { name: "文学国語", grade: 2 },
    { name: "古典探究", grade: 3 }
  ],

  "地歴" => [
    { name: "地理総合", grade: 1 },
    { name: "歴史総合", grade: 1 },
    { name: "地理探究", grade: 2 },
    { name: "日本史探究", grade: 2 },
    { name: "世界史探究", grade: 3 }
  ],

  "公民" => [
    { name: "公共", grade: 1 },
    { name: "倫理", grade: 2 },
    { name: "政治・経済", grade: 3 }
  ],

  "数学" => [
    { name: "数学Ⅰ", grade: 1 },
    { name: "数学A", grade: 1 },
    { name: "数学Ⅱ", grade: 2 },
    { name: "数学B", grade: 2 },
    { name: "数学Ⅲ", grade: 3 },
    { name: "数学C", grade: 3 }
  ],

  "理科" => [
    { name: "物理基礎", grade: 1 },
    { name: "化学基礎", grade: 1 },
    { name: "生物基礎", grade: 2 },
    { name: "物理", grade: 2 },
    { name: "化学", grade: 3 },
    { name: "生物", grade: 3 }
  ],

  "保健体育" => [
    { name: "体育", grade: 1 },
    { name: "保健", grade: 1 },
    { name: "体育", grade: 2 },
    { name: "保健", grade: 2 },
    { name: "体育", grade: 3 }
  ],

  "芸術" => [
    { name: "音楽Ⅰ", grade: 1 },
    { name: "美術Ⅰ", grade: 1 },
    { name: "書道Ⅰ", grade: 1 },
    { name: "音楽Ⅱ", grade: 2 },
    { name: "美術Ⅱ", grade: 2 },
    { name: "書道Ⅱ", grade: 2 }
  ],

  "外国語" => [
    { name: "英語コミュニケーションⅠ", grade: 1 },
    { name: "論理・表現Ⅰ", grade: 1 },
    { name: "英語コミュニケーションⅡ", grade: 2 },
    { name: "論理・表現Ⅱ", grade: 2 },
    { name: "英語コミュニケーションⅢ", grade: 3 },
    { name: "論理・表現Ⅲ", grade: 3 }
  ],

  "家庭" => [
    { name: "家庭基礎", grade: 1 },
    { name: "家庭総合", grade: 2 }
  ],

  "情報" => [
    { name: "情報Ⅰ", grade: 1 },
    { name: "情報Ⅱ", grade: 2 }
  ]
}

course_data.each do |subject_name, courses|
  subject = Subject.find_by!(name: subject_name)

  courses.each do |course|
    Course.find_or_create_by!(
      name: course[:name],
      grade: course[:grade],
      subject: subject,
      academic_year: academic_year
    )
  end
end