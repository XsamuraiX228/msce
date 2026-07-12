pub use api::Operation;
use serde::Serialize;
use std::fmt;

#[derive(Serialize)]
pub struct SuccessResponse {
    pub result: f64,
}

#[derive(Serialize, Debug)]
pub struct ErrorResponse {
    pub message: String,
}

impl ErrorResponse {
    pub fn new(message: String) -> Self {
        ErrorResponse { message }
    }
}

impl fmt::Display for ErrorResponse {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}
