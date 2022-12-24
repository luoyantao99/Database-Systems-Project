CREATE SCHEMA thinkcmf
GO
DROP TABLE IF EXISTS [thinkcmf].[OrderStock]
DROP TABLE IF EXISTS [thinkcmf].[Shipment]
DROP TABLE IF EXISTS [thinkcmf].[CustomerOrder]
DROP TABLE IF EXISTS [thinkcmf].[OrderStatus]
DROP TABLE IF EXISTS [thinkcmf].[Courier]
DROP TABLE IF EXISTS [thinkcmf].[CustomerAddress]
DROP TABLE IF EXISTS [thinkcmf].[Customer]
DROP TABLE IF EXISTS [thinkcmf].[Stock]
DROP TABLE IF EXISTS [thinkcmf].[Tops]
DROP TABLE IF EXISTS [thinkcmf].[Bottoms]
DROP TABLE IF EXISTS [thinkcmf].[Accessories]
DROP TABLE IF EXISTS [thinkcmf].[ProductDiscount]
DROP TABLE IF EXISTS [thinkcmf].[Product]
DROP TABLE IF EXISTS [thinkcmf].[Model]
DROP TABLE IF EXISTS [thinkcmf].[Gender]
DROP TABLE IF EXISTS [thinkcmf].[Brand]
DROP TABLE IF EXISTS [thinkcmf].[Supplier]

CREATE TABLE thinkcmf.Supplier
(
    SupplierID INT AUTO_INCREMENT PRIMARY key,
    SupplierName NVARCHAR(50) NOT NULL,
    SupplierEmail NVARCHAR(50) NOT NULL,
    SupplierAddress NVARCHAR(255) NOT NULL,
    SupplierPhone NVARCHAR(50) NOT NULL
);


INSERT INTO thinkcmf.Supplier (SupplierID, SupplierName, SupplierEmail, SupplierAddress, SupplierPhone) VALUES 
(1, 'Seiya Nakamura JP', 'sn@gmail.com', '307, 305, 204, 5-15-9 Minami-Aoyama, Minato-ku, Tokyo, Japan','1122334455'),
(2, 'Seiya Nakamura FR', 'sn@gmail.com', '2 Rue de Francs Bourgeois 75003, Paris, France','1122334455');



CREATE TABLE thinkcmf.Brand 
(
    BrandID INT AUTO_INCREMENT PRIMARY KEY,
    BrandName NVARCHAR(50) NOT NULL,
    BrandCountry NVARCHAR(50) NOT NULL,
    BrandDescription NVARCHAR(255) NOT NULL,
    SupplierID INT REFERENCES thinkcmf.Supplier(SupplierID)
);


INSERT INTO thinkcmf.Brand (BrandID, BrandName, BrandCountry, BrandDescription, SupplierID) VALUES
(1, 'Namacheko', 'Belgian', 'The Lurr siblings navigate notions of diaspora, duality, and cultural identity through clothing, merging disparate elements of their Kurdish heritage and European upbringing into compellingly simple and intensely personal designs.', 2),
(2, 'Rick Owens', 'Italy', 'Rooted in conceptual and architectural forms, the designs from Rick Owens are at once ancient and futuristic, priestly and profane.',2),
(3, 'Namesake', 'China', 'With roots in Taiwan, Japan, and the United States alike, NAMESAKE applies a nostalgic lens to logo-brandished streetwear, refashioning elements of Taiwan’s agricultural history, basketball apparel, and technology into something palpably modern.',1)
;


CREATE TABLE thinkcmf.Gender
(
	GenderCode INT AUTO_INCREMENT PRIMARY KEY,
	GenderName NVARCHAR (50) NOT NULL
);


INSERT INTO thinkcmf.Gender (GenderCode, GenderName) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Unisex')
;


CREATE TABLE thinkcmf.Model
(
	ModelID INT AUTO_INCREMENT PRIMARY KEY,
	ModelFirstName NVARCHAR (50) NOT NULL,
	ModelLastName NVARCHAR (50) NOT NULL,
	ModelHeight INT NOT NULL,
	ModelWeight INT NOT NULL,
	ModelChest INT NOT NULL,
	ModelShoulder INT NOT NULL,
	ModelHip INT NOT NULL,
	ModelWaist INT NOT NULL,
    GenderCode INT REFERENCES thinkcmf.Gender(GenderCode)
);


INSERT INTO thinkcmf.Model (ModelID, ModelFirstName, ModelLastName, ModelHeight, ModelWeight, ModelChest, ModelShoulder, ModelHip, ModelWaist, GenderCode) VALUES
(1, 'Ben', 'C', 178, 70, 100, 40, 20, 80, 1), 
(2, 'Linda','P', 165, 50, 90, 35, 20, 60, 2)
;


CREATE TABLE thinkcmf.Customer
(
	Email NVARCHAR (50) PRIMARY KEY,
	CustomerFirstName NVARCHAR (50) NOT NULL,
	CustomerLastName NVARCHAR (50) NOT NULL,
    GenderCode INT REFERENCES thinkcmf.Gender(GenderCode),
    CustomerDoB Date NOT NULL,
	CustomerGrade INT NOT NULL,
	CustomerValidAmount INT NOT NULL,
	CustomerHeight INT,
	CustomerWeight INT
);

INSERT INTO thinkcmf.Customer (Email, CustomerFirstName, CustomerLastName, GenderCode, CustomerDoB, CustomerGrade, CustomerValidAmount, CustomerHeight, CustomerWeight) VALUES
('2514814688@qq.com', 'Chenqi', 'Zhao', 1, '1999-11-15', 5, 50000, 175, 62.5),
('charles.eq.zh@gmail.com', 'Enki', 'Chen', 2, '1999-10-08', 1, 10000, 165, 50);


CREATE TABLE thinkcmf.OrderStatus
(
	StatusCode INT AUTO_INCREMENT PRIMARY KEY,
	StatusName NVARCHAR (50) NOT NULL,
	StatusDescription NVARCHAR (255) NOT NULL
);


INSERT INTO thinkcmf.OrderStatus (StatusCode, StatusName, StatusDescription) VALUES
(1, 'Processing', 'Customer placed an order, waiting for company to check.'),
(2, 'Shipped', 'Order has been shipped.'),
(3, 'Delivered', 'Order has been delivered.'),
(4, 'Return', 'Customer request to return the product.'),
(5, 'Completed','Order is completed.');



CREATE TABLE thinkcmf.Courier
(
	CourierID INT AUTO_INCREMENT PRIMARY KEY,
	CourierName NVARCHAR (50) NOT NULL,
	CourierEmail NVARCHAR (50) NOT NULL,
	CourierFee INT NOT NULL
);


INSERT INTO thinkcmf.Courier (CourierID, CourierName, CourierEmail, CourierFee) VALUES
(1, 'DHL', 'customer_service@dhl.com', 20),
(2, 'UPS', 'customer_service@ups.com', 14),
(3, 'FEDEX', 'customer_service@fedex.com', 7);



CREATE TABLE thinkcmf.CustomerAddress
(
	AddressID INT AUTO_INCREMENT PRIMARY KEY,
	CustomerEmail NVARCHAR (50) REFERENCES thinkcmf.Customer(Email),
	FirstName NVARCHAR (50) NOT NULL,
	LastName NVARCHAR (50) NOT NULL,
	Address1 NVARCHAR (255) NOT NULL,
	Address2 NVARCHAR (255),
	AddressCity NVARCHAR (50) NOT NULL,
	AddressZip NVARCHAR (50) NOT NULL,
	AddressState NVARCHAR (50) NOT NULL,
	AddressCountry NVARCHAR (50) NOT NULL,
	PhonerNumber NVARCHAR (50) NOT NULL,
	AddressType NVARCHAR (50) NOT NULL
);


INSERT INTO thinkcmf.CustomerAddress (AddressID, CustomerEmail, FirstName, LastName, Address1, Address2, AddressCity, AddressZip, AddressState, AddressCountry, PhonerNumber, AddressType) VALUES
(1,'2514814688@qq.com', 'Chenqi', 'Zhao', '25 Christopher Columbus Drive', NULL, 'Jersey City', '07302', 'New Jersey', 'US', '7816588588', 'Home')
;


CREATE TABLE thinkcmf.CustomerOrder
(
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
	CustomerEmail NVARCHAR (50) REFERENCES thinkcmf.Customer(Email),
	StatusCode INT REFERENCES thinkcmf.OrderStatus(StatusCode),
	AddressID INT REFERENCES thinkcmf.CustomerAddress(AddressID),
	CourierID INT REFERENCES thinkcmf.Courier(CourierID),
	OrderPromotion INT NOT NULL,
	OrderTotalPrice INT NOT NULL,
	OrderPlacedDate Date NOT NULL,
	OrderPaidDate Date NOT NULL,
	OrderPaymentMethod NVARCHAR (50) NOT NULL
);


INSERT INTO thinkcmf.CustomerOrder (OrderID, CustomerEmail, StatusCode, AddressID, CourierID, OrderPromotion, OrderTotalPrice, OrderPlacedDate, OrderPaidDate, OrderPaymentMethod) VALUES
(1, '2514814688@qq.com', 3, 1, 1, 80, 559, '2022-12-12', '2022-12-12', 'Paypal'),
(2, '2514814688@qq.com', 1, 1, 1, 80, 1673, '2022-12-14', '2022-12-14', 'Paypal');



CREATE TABLE thinkcmf.Shipment
(
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
	ShippedDate Date NOT NULL,
	TrackNumber NVARCHAR (50) NOT NULL,
	DeliveredDate Date,
	ShipmentReview NVARCHAR (255)
);

INSERT INTO thinkcmf.Shipment (OrderID, ShippedDate, TrackNumber, DeliveredDate, ShipmentReview) VALUES
(1, '2022-12-13', '181928418941', '2022-12-14', 'So fast! Delivered in 1 day!');



CREATE TABLE thinkcmf.Product
(
	ProductID INT AUTO_INCREMENT PRIMARY KEY,
    GenderCode INT REFERENCES thinkcmf.Gender(GenderCode),
    BrandID INT REFERENCES thinkcmf.Brand(BrandID),
    ProductName NVARCHAR (50) NOT NULL,
    ProductColor NVARCHAR (50) NOT NULL,
    ProductType NVARCHAR (50) NOT NULL,
    ProductDescription NVARCHAR (255) NOT NULL,
    ModelID INT REFERENCES thinkcmf.Model(ModelID),
    ProductModelSize INT NOT NULL,
    ProductPrice INT NOT NULL
);


INSERT INTO thinkcmf.Product (ProductID, GenderCode, BrandID, ProductName, ProductColor, ProductType, ProductDescription, ModelID, ProductModelSize, ProductPrice) VALUES
(1, 1, 1, 'Black Azor Lounge Pants', 'Black', 'Bottoms',  'Acetate-blend brocade lounge pants.', 1, 46, 960),
(2, 1, 2, 'Black Mountain Down Jacket', 'Black', 'Tops', 'Lightweight quilted down-filled nylon satin jacket.', 1, 50, 2580),
(3, 3, 2, 'Taupe Embroidered Face Mask', 'Brown', 'Accessories', 'Cotton poplin face mask in taupe.', 2, 0, 85),
(4, 3, 3, 'Off-White Sava Hoodie', 'Off-White', 'Tops', 'Cotton fleece hoodie. Graphics and text printed and embroidered throughout.', 1, 48, 310);



CREATE TABLE thinkcmf.ProductDiscount
(
	ProductID INT REFERENCES thinkcmf.Product(ProductID),
    StartDate Date,
    EndDate Date,
    Discount INT NOT NULL,
    PRIMARY KEY (ProductID, StartDate, EndDate)
);

INSERT INTO thinkcmf.ProductDiscount (ProductID, StartDate, EndDate, Discount) VALUES
(1, '2022-12-1', '2022-12-25', 69),
(2, '2022-10-1', '2022-10-15', 90),
(2, '2022-12-1', '2022-12-25', 72),
(4, '2022-12-1', '2022-12-25', 75);


CREATE TABLE thinkcmf.Stock
(
	ProductID INT REFERENCES thinkcmf.Product(ProductID),
    OrderedSize INT,
    WholeSalePrice INT NOT NULL,
    OrderedAmount INT NOT NULL,
    LeftAmount INT NOT NULL,
    PRIMARY KEY (ProductID, OrderedSize)
);

INSERT INTO thinkcmf.Stock (ProductID, OrderedSize, WholeSalePrice, OrderedAmount, LeftAmount)VALUES
(1, 44, 320, 4, 4),
(1, 46, 320, 4, 4),
(1, 48, 320, 2, 2),
(1, 50, 320, 0, 0),
(2, 44, 774, 1, 1),
(2, 46, 774, 1, 1),
(2, 48, 774, 1, 0),
(2, 50, 774, 0, 0),
(3, 0, 25, 5, 5),
(4, 44, 103, 10, 10),
(4, 46, 103, 10, 6),
(4, 48, 103, 10, 10),
(4, 50, 103, 10, 10);


CREATE TABLE thinkcmf.OrderStock
(
    OrderID INT REFERENCES thinkcmf.CustomerOrder(OrderID),
	ProductID INT,
    OrderedSize INT,
    OrderProductAmount INT NOT NULL,
    ProductSoldPrice INT NOT NULL,
    OrderProductReview NVARCHAR (255),
	foreign key (ProductID, OrderedSize) REFERENCES thinkcmf.Stock(ProductID, Orderedsize),
    PRIMARY KEY (OrderID, ProductID, OrderedSize)
);

INSERT INTO thinkcmf.OrderStock (OrderID, ProductID, OrderedSize, OrderProductAmount, ProductSoldPrice, OrderProductReview) VALUES
(1, 4, 46, 3, 233, 'Nice hoodie'),
(2, 2, 48, 1, 1858, NULL),
(2, 4, 46, 1, 233, NULL);


CREATE TABLE thinkcmf.Tops
(
	ProductID INT REFERENCES thinkcmf.Product(ProductID),
    Size INT,
    LengthMeasurement INT,
    ChestMeasurement INT,
    ShoulderMeasurement INT,
    SleeveMeasurement INT,
    PRIMARY KEY (ProductID, Size)
);

INSERT INTO thinkcmf.Tops (ProductID, Size, LengthMeasurement, ChestMeasurement, ShoulderMeasurement, SleeveMeasurement) VALUES
(2, 44, NULL, 66, 49, 76),
(2, 46, NULL, 68, 53, 76),
(2, 48, NULL, 70, 54, 76),
(2, 50, NULL, 72, 54, 76),
(4, 44, 71, 61, 57, 72),
(4, 46, 74, 66, 58, 73),
(4, 48, 76, 67, 59, 74),
(4, 50, 77, 70, 61, 76);

CREATE TABLE thinkcmf.Bottoms
(
	ProductID INT REFERENCES thinkcmf.Product(ProductID),
    Size INT,
    WaistMeasurement INT,
    LengthMeasurement INT,
    HipMeasurement INT,
    HemMeasurement INT,
    PRIMARY KEY (ProductID, Size)
);

INSERT INTO thinkcmf.Bottoms (ProductID, Size, WaistMeasurement, LengthMeasurement, HipMeasurement, HemMeasurement) VALUES
(1, 44, 72, 105, 30, 20),
(1, 46, 76, 107, 31, 21),
(1, 48, 80, 109, 32, 22),
(1, 50, 84, 111, 33, 23);


CREATE TABLE thinkcmf.Accessories
(
	ProductID INT REFERENCES thinkcmf.Product(ProductID),
    Size INT,
    Measurement INT,
    PRIMARY KEY (ProductID, Size)
);

INSERT INTO thinkcmf.Accessories (ProductID, Size, Measurement) VALUES
(3, 0, NULL);







