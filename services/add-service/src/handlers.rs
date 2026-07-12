use crate::types::{Operation, SuccessResponse};
use actix_web::{HttpResponse, Responder, get, web};
#[get("/add")]
pub async fn add_operation(query: web::Query<Operation>) -> impl Responder {
    HttpResponse::Ok().json(SuccessResponse {
        result: query.a + query.b,
    })
}
