class ProductCategoryItems {
    ProductCategoryItems({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating? rating;

    factory ProductCategoryItems.fromJson(Map<String, dynamic> json){ 
        return ProductCategoryItems(
            id: json["id"] ?? 0,
            title: json["title"] ?? "",
            price: json["price"] ?? 0.0,
            description: json["description"] ?? "",
            category: json["category"] ?? "",
            image: json["image"] ?? "",
            rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
    };

    @override
    String toString(){
        return "$id, $title, $price, $description, $category, $image, $rating, ";
    }

}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    factory Rating.fromJson(Map<String, dynamic> json){ 
        return Rating(
            rate: json["rate"] ?? 0.0,
            count: json["count"] ?? 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };

    @override
    String toString(){
        return "$rate, $count, ";
    }

}

/*
[
	{
		"id": 5,
		"title": "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
		"price": 695,
		"description": "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
		"category": "jewelery",
		"image": "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
		"rating": {
			"rate": 4.6,
			"count": 400
		}
	},
	{
		"id": 6,
		"title": "Solid Gold Petite Micropave ",
		"price": 168,
		"description": "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
		"category": "jewelery",
		"image": "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
		"rating": {
			"rate": 3.9,
			"count": 70
		}
	},
	{
		"id": 7,
		"title": "White Gold Plated Princess",
		"price": 9.99,
		"description": "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
		"category": "jewelery",
		"image": "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
		"rating": {
			"rate": 3,
			"count": 400
		}
	},
	{
		"id": 8,
		"title": "Pierced Owl Rose Gold Plated Stainless Steel Double",
		"price": 10.99,
		"description": "Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
		"category": "jewelery",
		"image": "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
		"rating": {
			"rate": 1.9,
			"count": 100
		}
	}
]*/