json.partial! 'guest', guest: @guest


# json.reviews do 
#     @shirt.reviews.each do |review|
#         json.set! review.id do 
#             json.extract! review, :id, :description, :shirt_id 
#             json.reviewer review.user.name
#         end
#     end
# end