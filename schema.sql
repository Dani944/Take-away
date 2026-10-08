CREATE TABLE IF NOT EXISTS products (
 id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT, description_fr TEXT,
 price REAL NOT NULL, image TEXT, active INTEGER NOT NULL DEFAULT 1
);
CREATE TABLE IF NOT EXISTS orders (
 id INTEGER PRIMARY KEY AUTOINCREMENT, customer_name TEXT NOT NULL, phone TEXT NOT NULL,
 order_type TEXT NOT NULL CHECK(order_type IN ('delivery','pickup')),
 address TEXT, latitude REAL, longitude REAL, payment_method TEXT NOT NULL,
 notes TEXT, status TEXT NOT NULL DEFAULT 'new', total REAL NOT NULL DEFAULT 0,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS order_items (
 id INTEGER PRIMARY KEY AUTOINCREMENT, order_id INTEGER NOT NULL,
 product_id INTEGER NOT NULL, quantity INTEGER NOT NULL, price REAL NOT NULL,
 FOREIGN KEY(order_id) REFERENCES orders(id), FOREIGN KEY(product_id) REFERENCES products(id)
);
INSERT OR IGNORE INTO products(id,name,description,description_fr,price,image) VALUES
(1,'Chicken Naan','Grilled naan, chicken, cheese & chutney.','Naan grillé, poulet, fromage et chutney.',2.5,'https://spicengrill.fr/wp-content/uploads/2024/10/Design-sans-titre-13.png'),
(2,'Grill Plate','Rice, naan, salad and your choice of filling.','Riz, naan, salade et garniture au choix.',4.5,'https://spicengrill.fr/wp-content/uploads/2024/10/Design-sans-titre-12.png'),
(3,'Thali','A generous Indian platter.','Une généreuse assiette indienne.',5.0,'https://spicengrill.fr/wp-content/uploads/2024/10/Design-sans-titre-11.png'),
(4,'Naanizza','Indian-style pizza on naan.','Pizza façon indienne sur naan.',4.0,'https://spicengrill.fr/wp-content/uploads/2024/10/Design-sans-titre-10.png');