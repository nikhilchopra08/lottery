import NFTActorClass "../NFT/nft";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import List "mo:base/List";
import Iter "mo:base/Iter";
import Nat8 "mo:base/Nat8";

actor lottery_backend {


  var mapOfNFTs = HashMap.HashMap<Principal, NFTActorClass.NFT>(1, Principal.equal, Principal.hash);

  public shared func mint(name : Text, imgData : [Nat8]) : async Principal {

    Debug.print(debug_show (Cycles.balance()));
    Cycles.add(100_500_000_000);
    let newNFT = await NFTActorClass.NFT(name, imgData);
    Debug.print(debug_show (Cycles.balance()));

    let newNFTPrincipal = await newNFT.getCanisterId();

    return newNFTPrincipal

  };

  public query func getlottery_backendCanisterID() : async Principal {
    return Principal.fromActor(lottery_backend);
  };
};