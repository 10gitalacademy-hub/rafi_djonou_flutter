class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String category;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;
  final int stock;
  final bool isHandmade;
  final bool isCustomizable;
  final bool isInStock;
  final String material;
  final double rating;
  final int reviews;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.colors,
    required this.sizes,
    required this.stock,
    required this.isHandmade,
    required this.isCustomizable,
    required this.isInStock,
    required this.material,
    required this.rating,
    required this.reviews,
  });

  static List<Product> mockProducts = [
    Product(
      id: 1,
      name: 'Collier Perles Multicolores Afro',
      price: 28.99,
      description: 'Magnifique collier en perles de verre multicolores, fait main avec soin. Parfait pour sublimer une tenue africaine ou casual.',
      category: 'Colliers',
      images: [
        'https://via.placeholder.com/400x400?text=Collier+Multicolore',
        'https://via.placeholder.com/400x400?text=Collier+Detail1',
        'https://via.placeholder.com/400x400?text=Collier+Detail2',
      ],
      colors: ['Multicolore', 'Rouge/Or', 'Bleu/Blanc'],
      sizes: ['40 cm', '45 cm', '50 cm'],
      stock: 5,
      isHandmade: true,
      isCustomizable: true,
      isInStock: true,
      material: 'Perles de verre, fil nylon, fermoir en acier inoxydable',
      rating: 4.8,
      reviews: 24,
    ),
    Product(
      id: 2,
      name: 'Boucles d\'Oreilles Perles Cauri',
      price: 18.50,
      description: 'Élégantes boucles d\'oreilles avec perles cauri authentiques. Légères et confortables pour un port quotidien.',
      category: 'Boucles d\'oreilles',
      images: [
        'https://via.placeholder.com/400x400?text=Boucles+Cauri',
        'https://via.placeholder.com/400x400?text=Boucles+Detail',
      ],
      colors: ['Naturel', 'Doré', 'Argenté'],
      sizes: ['Standard'],
      stock: 12,
      isHandmade: true,
      isCustomizable: false,
      isInStock: true,
      material: 'Perles cauri, crochets en acier chirurgical',
      rating: 4.9,
      reviews: 42,
    ),
    Product(
      id: 3,
      name: 'Perles de Hanche Traditionnelles',
      price: 22.00,
      description: 'Perles de hanche traditionnelles avec motifs africains. Parfait pour les cérémonies et occasions spéciales.',
      category: 'Perles de hanche',
      images: [
        'https://via.placeholder.com/400x400?text=Perles+Hanche',
      ],
      colors: ['Multicolore', 'Or', 'Argent'],
      sizes: ['60-70 cm', '70-80 cm', '80-90 cm'],
      stock: 8,
      isHandmade: true,
      isCustomizable: true,
      isInStock: false,
      material: 'Perles de verre, fil nylon, fermoir magnétique',
      rating: 4.7,
      reviews: 18,
    ),
    Product(
      id: 4,
      name: 'Bracelet de Cheville Perles Colorées',
      price: 12.99,
      description: 'Bracelet de cheville coloré et léger. Idéal pour l\'été et les occasions festives.',
      category: 'Bracelets',
      images: [
        'https://via.placeholder.com/400x400?text=Bracelet+Cheville',
      ],
      colors: ['Multicolore', 'Rose/Blanc', 'Bleu/Vert'],
      sizes: ['Ajustable'],
      stock: 15,
      isHandmade: true,
      isCustomizable: true,
      isInStock: true,
      material: 'Perles de verre, fil élastique',
      rating: 4.6,
      reviews: 31,
    ),
    Product(
      id: 5,
      name: 'Bracelet Perles de Pierre Naturelle',
      price: 24.00,
      description: 'Bracelet élégant en perles de pierre naturelle. Apaise et harmonise les énergies.',
      category: 'Bracelets',
      images: [
        'https://via.placeholder.com/400x400?text=Bracelet+Pierre',
      ],
      colors: ['Améthyste', 'Quartz Rose', 'Œil de Tigre'],
      sizes: ['Standard'],
      stock: 7,
      isHandmade: true,
      isCustomizable: false,
      isInStock: true,
      material: 'Pierres naturelles, fil nylon',
      rating: 4.9,
      reviews: 19,
    ),
    Product(
      id: 6,
      name: 'Sac Pochette Perles Luxe',
      price: 89.00,
      description: 'Sac pochette luxueux entièrement orné de perles. Pièce maîtresse pour vos soirées.',
      category: 'Sacs en perles',
      images: [
        'https://via.placeholder.com/400x400?text=Sac+Luxe',
      ],
      colors: ['Noir', 'Or', 'Argent'],
      sizes: ['Standard'],
      stock: 3,
      isHandmade: true,
      isCustomizable: false,
      isInStock: true,
      material: 'Perles de verre, toile, fermoir doré',
      rating: 5.0,
      reviews: 12,
    ),
    Product(
      id: 7,
      name: 'Collier Cérémonie Perles Dorées',
      price: 65.00,
      description: 'Collier de cérémonie avec perles dorées et cristaux. Parfait pour les mariages et événements importants.',
      category: 'Colliers',
      images: [
        'https://via.placeholder.com/400x400?text=Collier+Ceremonie',
      ],
      colors: ['Or', 'Argent'],
      sizes: ['45 cm', '50 cm'],
      stock: 4,
      isHandmade: true,
      isCustomizable: false,
      isInStock: true,
      material: 'Perles dorées, cristaux Swarovski, fil nylon',
      rating: 4.95,
      reviews: 8,
    ),
    Product(
      id: 8,
      name: 'Boucles Perles Minimalistes',
      price: 14.50,
      description: 'Boucles minimalistes avec perles discrètes. Parfaites pour un look épuré et élégant.',
      category: 'Boucles d\'oreilles',
      images: [
        'https://via.placeholder.com/400x400?text=Boucles+Minimalistes',
      ],
      colors: ['Blanc', 'Noir', 'Or'],
      sizes: ['Standard'],
      stock: 20,
      isHandmade: true,
      isCustomizable: false,
      isInStock: true,
      material: 'Perles de verre, crochets en acier inoxydable',
      rating: 4.7,
      reviews: 35,
    ),
  ];
}
