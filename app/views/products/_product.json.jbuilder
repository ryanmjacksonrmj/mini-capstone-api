json.id product.id
json.name product.name
json.price product.price
json.description product.description
json.is_discounted? product.is_discounted?
json.tax product.tax
json.total product.total
json.supplier product.supplier
json.images product.images

json.images product.images.map do |image|
  json.id image.id
  json.url image.url
end
json.categories product.categories
json.active product.active