package nslm2.modules.cultivates.pet.service
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PetInfoNotify;
   import proto.PetOnBattleReq;
   import proto.PetStarUpReq;
   import proto.PetStatusUseReq;
   import proto.ProtocolStatusRes;
   
   public class PetService implements IDispose
   {
      
      private static var _ins:nslm2.modules.cultivates.pet.service.PetService;
       
      
      private var petModel:PetModel;
      
      private var _reqSkinKind:int;
      
      private var _reqSkinId:uint;
      
      private var _activateId:uint;
      
      public function PetService()
      {
         petModel = PetModel.ins;
         super();
         acivate();
      }
      
      public static function get ins() : nslm2.modules.cultivates.pet.service.PetService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.pet.service.PetService();
         }
         return _ins;
      }
      
      public function acivate() : void
      {
         swicthHandler(true);
      }
      
      public function getAllPetInfo(param1:Function) : void
      {
         ServerEngine.ins.send(5367,null,param1);
      }
      
      private function petInfoNotifyHandler(param1:PetInfoNotify) : void
      {
         petModel.updatePetInfo(param1.info);
      }
      
      public function petOnBattle(param1:int, param2:int, param3:*) : void
      {
         var _loc4_:PetOnBattleReq = new PetOnBattleReq();
         _loc4_.id = param1;
         _loc4_.kind = param2;
         ServerEngine.ins.send(5364,_loc4_,param3);
      }
      
      public function petStarUp(param1:int, param2:*) : void
      {
         var _loc3_:PetStarUpReq = new PetStarUpReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(5363,_loc3_,param2);
      }
      
      public function swicthHandler(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(5361,petInfoNotifyHandler);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(5361,petInfoNotifyHandler);
         }
      }
      
      public function clothesWear(param1:uint) : void
      {
         var _loc2_:PetStatusUseReq = new PetStatusUseReq();
         if(petModel.crtPetInfo.status == param1)
         {
            return;
         }
         _reqSkinId = param1;
         _loc2_.id = petModel.crtPetId;
         _loc2_.kind = param1;
         ServerEngine.ins.send(5369,_loc2_,server_clothesWear);
      }
      
      private function server_clothesWear(param1:ProtocolStatusRes) : void
      {
         petModel.changeFashion(_reqSkinId);
         clear();
      }
      
      private function clear() : void
      {
         _reqSkinId = 0;
         _reqSkinKind = 0;
      }
      
      public function dispose() : void
      {
      }
      
      public function activateClothes(param1:uint) : void
      {
         _activateId = param1;
         var _loc2_:PetStatusUseReq = new PetStatusUseReq();
         _loc2_.id = petModel.crtPetId;
         _loc2_.kind = param1;
         ServerEngine.ins.send(5368,_loc2_,server_activeCpl);
      }
      
      private function server_activeCpl() : void
      {
         petModel.onDataChangeOne(_activateId);
      }
   }
}
