#[macro_use] extern crate rocket;

use rocket::fs::{FileServer, relative};

#[get("/-/health")]
fn health() -> &'static str {
   "Server is healthy"
}

#[rocket::launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![health])
        .mount("/", FileServer::from(relative!("static")))
}
