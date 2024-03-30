jq '.[] | {name, full_name, description, title: .paper.title, collection: .collections[0].collection, area: .collections[0].area}' methods.json > methods_reformat.txt
