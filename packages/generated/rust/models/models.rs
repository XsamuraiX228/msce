//!
//! Generated from an OAS specification by openapi-model-generator(v0.6.2)
//!

use serde::{Serialize, Deserialize};

/// Request body for math operations
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Operation {
    /// variable a
    pub a: f64,
    /// variable b
    pub b: f64,
}