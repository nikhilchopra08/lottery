import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

actor class NFT (name: Text, content: [Nat8]) = this {
  
  private let itemName = name;
  private let imageBytes = content;
  private var listedForSale = false;

  public query func getName() : async Text{
    return itemName;
  };

  public query func getAsset() : async [Nat8] {
    return imageBytes;
  };

  public query func getCanisterId() : async Principal {
    return Principal.fromActor(this);
  };

};