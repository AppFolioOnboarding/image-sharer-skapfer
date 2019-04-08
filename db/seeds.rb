# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

cat_pictures = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/ThoughtfulBlini.jpg/800px-ThoughtfulBlini.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/ed/BillyHJay.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Egyptian_Mau_Bronze.jpg/1024px-Egyptian_Mau_Bronze.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Siam_lilacpoint.jpg/800px-Siam_lilacpoint.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Veda%2Cchat-adulte-m%C3%A2le-race-korat.JPG/800px-Veda%2Cchat-adulte-m%C3%A2le-race-korat.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/5/5b/PersanBlanc.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Blue_Somali_kitten_age_3_months.jpg/1024px-Blue_Somali_kitten_age_3_months.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Six_weeks_old_cat_%28aka%29_edit.jpg/1280px-Six_weeks_old_cat_%28aka%29_edit.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/e3/Japanese_Bobtail_looking_like_Manx.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Chartreux_cat_J_adult_female_001.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Franz_Marc_013.jpg/800px-Franz_Marc_013.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/d/d7/DBPB_1968_316_Wildkatze.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/f/f1/Japanese_traditional_furry_art1.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/ThoughtfulBlini.jpg/800px-ThoughtfulBlini.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/a/ad/Heubach_cat.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/66/Noorse-boskat_wikipedia_1.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Pumiforme.JPG/1024px-Pumiforme.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Gato_Barra%C3%B1a_Galicia_2.jpg/1024px-Gato_Barra%C3%B1a_Galicia_2.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/DEUX_CHATS_AMOUREUX.JPG/1024px-DEUX_CHATS_AMOUREUX.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Cat_by_Laziale93.JPG/1024px-Cat_by_Laziale93.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Siam_blue_point.jpg/1024px-Siam_blue_point.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Brown_and_white_tabby_cat_with_green_eyes-Hisashi-03.jpg/1280px-Brown_and_white_tabby_cat_with_green_eyes-Hisashi-03.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/e7/Jammlich_crop.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Tabby_Pfaffengrund.JPG/1024px-Tabby_Pfaffengrund.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Penny_snuggles.JPG/1024px-Penny_snuggles.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/6/60/Neighbours_Siamese.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg/800px-Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/b/b9/Cats_eye.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/7/70/Gatos_cats_7_cropped.jpg'
]

cat_picture_urls = cat_pictures.map { |x| { url: x, tag_list: 'cat' } }
Imageurl.create! cat_picture_urls

Imageurl.create!(url: 'https://weblog.rubyonrails.org/images/rails-logo.svg', tag_list: 'logo')
