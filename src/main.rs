use actix_web::{web, App, HttpResponse, HttpServer, Responder};

async fn greet() -> impl Responder {
	HttpResponse::Ok().content_type("text/plain").body("hello kubernetes world!\n")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
	HttpServer::new(|| App::new().route("/", web::get().to(greet))).bind("0.0.0.0:8080")?.run().await
}
