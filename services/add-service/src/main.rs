use crate::errors::map_query_error;
use actix_web::{App, HttpServer, web};
pub mod add_handler;
pub mod errors;
pub mod types;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        let query_cfg = web::QueryConfig::default().error_handler(map_query_error);

        App::new()
            .app_data(query_cfg)
            .service(add_handler::add_operation)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
