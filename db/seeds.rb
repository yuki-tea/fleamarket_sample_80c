lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])


@category1 = Category.create(name:"カテゴリ1")
categories = [
             {level1:"カテゴリ 1",level_children[
             {level2: "カテゴリ 1-1", level2_children:["1-1-1","1-1-2","1-1-3"]}]
             },
             {level1:"カテゴリ 2",level1_children:[
              {level2:"カテゴリ 2-1",level2_children:["カテゴリ 2-1-1","カテゴリ 2-1-2","カテゴリ 2-1-3"]},
              {level2:"カテゴリ 2-2",level2_children:["カテゴリ 2-2-1","カテゴリ 2-2-2"]}
             ]
}
]
# each.with_indexの使い方
# 使うと要素の数だけ処理を繰り返し実行し、繰り返しごとに番号を振ることができます。
# iに番号が入る。





categories.each.with_index(1) do |category1,i|
  # カテゴリーにインデックスを貼る
  level1_var = "@category1_#{i}"
  level1_val = Category.create(name: "#{category[level1]}")eval("#{level1_val} = level1_val")
    category[:level1_children].each.with_index(1) do |level1_child, j|
  # evalとは、引数で渡した文字列rubyプログラムとして実行するメソッド
    level2_var ="#{level1_var}_#{j}"
    level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])")eval("#{level2_var} = level2_val")
      level1_child[:level2_children].each do |level2_children_val|
        eval("#{level2_var}.children.create(name:level2_children_val)") 
      end
  end
end