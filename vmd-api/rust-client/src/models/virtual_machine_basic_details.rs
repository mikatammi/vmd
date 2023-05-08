/*
 * Virtual Machine Management API of the Ghaf platform - OpenAPI
 *
 * OpenAPI specification for virtual machine management on Ghaf platform
 *
 * The version of the OpenAPI document: 1.0.1
 * Contact: nikita.bazulin@unikie.com
 * Generated by: https://openapi-generator.tech
 */




#[derive(Clone, Debug, PartialEq, Default, Serialize, Deserialize)]
pub struct VirtualMachineBasicDetails {
    #[serde(rename = "id", deserialize_with = "Option::deserialize")]
    pub id: Option<serde_json::Value>,
    #[serde(rename = "state", deserialize_with = "Option::deserialize")]
    pub state: Option<State>,
    #[serde(rename = "name", deserialize_with = "Option::deserialize")]
    pub name: Option<serde_json::Value>,
    #[serde(rename = "description", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub description: Option<Option<serde_json::Value>>,
}

impl VirtualMachineBasicDetails {
    pub fn new(id: Option<serde_json::Value>, state: Option<State>, name: Option<serde_json::Value>) -> VirtualMachineBasicDetails {
        VirtualMachineBasicDetails {
            id,
            state,
            name,
            description: None,
        }
    }
}

/// 
#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd, Hash, Serialize, Deserialize)]
pub enum State {
    #[serde(rename = "D")]
    D,
    #[serde(rename = "I")]
    I,
    #[serde(rename = "R")]
    R,
    #[serde(rename = "S")]
    S,
    #[serde(rename = "T")]
    T,
    #[serde(rename = "TDebug")]
    TDebug,
    #[serde(rename = "W")]
    W,
    #[serde(rename = "X")]
    X,
    #[serde(rename = "Z")]
    Z,
}

impl Default for State {
    fn default() -> State {
        Self::D
    }
}

