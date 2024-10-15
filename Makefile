# source https://dev.to/yagnadeepxo/the-beginners-guide-to-zk-snark-setting-up-your-first-proof-system-3le3

# compile circom
com:
	circom circuit.circom --r1cs --wasm

# create ptua
ptau:
	wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_12.ptau

# create zkey
zkey:
	npx snarkjs groth16 setup circuit.r1cs powersOfTau28_hez_final_12.ptau circuit_0000.zkey

# generate proof
index:
	node index.js

# generate verification_key.json
gen-ve:
	npx snarkjs zkey export verificationkey circuit_0000.zkey verification_key.json

# verify
ve:
	node verify.js
