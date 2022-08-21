pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/switcher.circom"
include "../node_modules/circomlib/circuits/poseidon.circom"
include "../node_modules/circomlib/circuits/bitify.circom"

template    VerfierLevel() {
    signal  input   sipling;
    signal  input   selector;
    signal  input   root;

    component sw = switcher();
    component hash = Poseidon();

    sw.sel  <== selector;
    sw.L    <== low;
    sw.R    <== sipling;

    log(4444444444);
    log(sw.outL);
    log(sw.outR);

    hash.inputs[0] = sw.outL;
    hash.inputs[1] = sw.outR;
    root <== hash.out;
}


template        MerkelTreeVerifier(nLevels) {
    signal  input   key;
    signal  input   value;
    signal  input   root;
    signal  input   siblings[nLevels];

    component   ntobits = Num2Bits(nLevels);
    component   levels[nLevels];

    component   hashV = Poseidon(1);

    hashV.inputs[0] <== value;
    ntobits <== key;

    for (var i = nLevels - 1; i >= 0; i--) {
        levels[i] = VerfierLevel();
        levels[i].sipling <== sinbings[i];
        levels[i].selector <== ntobits.out[i];
        if (i == nLevels - 1)
        {
            levels[i].low <== hashV.out;
        } else {
            levels[i].low <== levels[i +1 ].root;
        }
    }
    root === levels[0].root;
}