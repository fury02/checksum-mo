import Array "mo:base/Array";
import List "mo:base/List";
import Blob  "mo:base/Blob";
import Cycles "mo:base/ExperimentalCycles";
import Nat  "mo:base/Nat";
import Nat8  "mo:base/Nat8";
import Nat64  "mo:base/Nat64";
import Error "mo:base/Error";

import EIC "mo:base/ExperimentalInternetComputer";
import StableMemory "mo:base/ExperimentalStableMemory";

import Debug "mo:base/Debug";

actor EICCounter{

    stable var counter : Nat = 0;

    public shared func reset() : async () {
        counter := 0;
    };
    
    public func result(d: Nat): async Nat{
        var i : Nat = 1;
        var j : Nat = 1;
        counter := 0;
        while(j <= d){
            i := i * j;
            j := j + 1;
            var c = EIC.countInstructions(func() { counter += 2 });
        };
        Debug.print("counter : " # debug_show(counter));
        return i;
    };
};