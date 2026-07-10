use serde::Serialize;
pub use models::models::Operation;

#[derive(Serialize)]
pub struct SuccessResponse {
    pub result: f64
}

#[derive(Serialize, Debug)]
pub struct ErrorResponse {
    pub message: String
}
