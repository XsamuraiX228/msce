use serde::{Deserialize, Serialize};
use std::fmt;
#[derive(Deserialize)]
pub struct Operation {
    pub a: f64,
    pub b: f64
}

#[derive(Serialize)]
pub struct SuccessResponse {
    pub result: f64
}

#[derive(Serialize, Debug)]
pub struct ErrorResponse {
    pub message: String
}

impl fmt::Display for ErrorResponse {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}