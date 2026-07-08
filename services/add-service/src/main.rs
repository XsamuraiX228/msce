use actix_web::{App, HttpServer, web};
use crate::add_handler::add;
use crate::error_handler::handle_query_error;
pub mod init;
pub mod add_handler;
pub mod error_handler;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        let query_cfg = web::QueryConfig::default()
            .error_handler(handle_query_error);

        App::new()
            .app_data(query_cfg)
            .route("/add", web::get().to(add))
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}