use crate::init::ErrorResponse;
use actix_web::{HttpRequest, error::QueryPayloadError};
pub fn error_add(error: QueryPayloadError, _req: &HttpRequest) -> actix_web::Error {
    let clean_error = error
        .to_string()
        .split(":")
        .last()
        .map(|s| s.trim().to_string())
        .unwrap_or_default();
    let response = ErrorResponse {
        message: clean_error,
    };
    actix_web::error::ErrorBadRequest(response)
}
