# Zk-voting-system
implementation of a voting system using Zero Knowledge Proofs

first we must create a Merkel tree that receives an array of public key
Compute the Merkel proof
We can verify the proof with Js but it will be done by the circuit.
We use a merkelize function. Notice that it requires a field , a hash function, the arry of Objects to be Merkilezed and the number of levels.
The number of levels can be computed knowing the arity of the tree and the number of elements of the array, However it is explicily provided to the function to mimic how the ZK circuit will check the Merkel proof 