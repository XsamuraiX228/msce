use crate::init::ErrorResponse;
use actix_web::{HttpRequest, error::QueryPayloadError};

pub fn handle_query_error(error: QueryPayloadError, _req: &HttpRequest) -> actix_web::Error {
    let error_message = error
        .to_string()
        .split(":")
        .last()
        .map(|s| s.trim().to_string())
        .unwrap_or_default();
    let error_body = ErrorResponse {
        message: error_message,
    };
    actix_web::error::ErrorBadRequest(error_body)
}

use std::fmt;

impl fmt::Display for ErrorResponse {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}