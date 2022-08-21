pragma circom 2.0.0;

include "../../circuit/ZkVoting.circom"

component main { public [root] } = MerkelTreeVerifier(3);