use crate::types::ErrorResponse;
use actix_web::{HttpRequest, error::QueryPayloadError};

pub fn map_query_error(error: QueryPayloadError, _req: &HttpRequest) -> actix_web::Error {
    let error_message = error
        .to_string()
        .splitn(2, ":")
        .nth(1)
        .map(|s| s.trim().to_string())
        .unwrap_or_default();
    let error_body = ErrorResponse {
        message: error_message,
    };
    actix_web::error::ErrorBadRequest(error_body)
}
