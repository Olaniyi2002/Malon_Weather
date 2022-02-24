class Model {
  final String image, country, city, temp, wind, humidity;

  Model(
      {this.wind,
      this.humidity,
      this.image,
      this.temp,
      this.city,
      this.country});
}

const image =
    "https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/25/010885/1.jpg";

List<Model> item = [
  Model(image: image, city: "Lagos", country: "Nigeria"),
  Model(image: image, city: "London", country: "United Kingdom"),
  Model(image: image, city: "lima", country: "Peru"),
  Model(image: image, city: "Kampala", country: "Uganda"),
  Model(image: image, city: "Abu Dhabi", country: "United Arab Emirates"),
  Model(image: image, city: "Tirana", country: "Albania"),
  Model(image: image, city: "Luanda", country: "Angola"),
  Model(image: image, city: "Belize", country: "Belize"),
  Model(image: image, city: "Vienna", country: "Austria"),
  Model(image: image, city: "Brasilia", country: "Brazil"),
  Model(image: image, city: "Ottawa", country: "Canada"),
];
