use actix_web::{HttpResponse, Responder, web};
use crate::init::{Operation, SuccessResponse};

pub async fn add_operation(query: web::Query<Operation>) -> impl Responder {
    HttpResponse::Ok().json(SuccessResponse {
        result: query.a + query.b,
    })
}