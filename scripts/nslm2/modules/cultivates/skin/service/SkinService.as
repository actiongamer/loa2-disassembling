package nslm2.modules.cultivates.skin.service
{
   import nslm2.modules.cultivates.skin.SkinModel;
   import proto.HeroSkinEquipReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import proto.HeroSkinActiveReq;
   
   public class SkinService
   {
      
      private static var _ins:nslm2.modules.cultivates.skin.service.SkinService;
       
      
      private var model:SkinModel;
      
      private var _reqSkinId:int;
      
      private var _reqSkinKind:int;
      
      private var _activateId:int;
      
      public function SkinService()
      {
         model = SkinModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.skin.service.SkinService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.skin.service.SkinService();
         }
         return _ins;
      }
      
      public function clothesWear(param1:uint) : void
      {
         var _loc2_:HeroSkinEquipReq = new HeroSkinEquipReq();
         _reqSkinKind = param1 != 0?1:2;
         if(model.usingSkinId == param1)
         {
            return;
         }
         _reqSkinId = param1 == 0?model.usingSkinId:uint(param1);
         _loc2_.id = _reqSkinId;
         _loc2_.hero = model.curHeroInfo.baseInfo.id;
         _loc2_.kind = _reqSkinKind;
         ServerEngine.ins.send(5021,_loc2_,server_clothesWear);
      }
      
      private function server_clothesWear(param1:ProtocolStatusRes) : void
      {
         model.changeFashion(_reqSkinKind,_reqSkinId);
         clear();
      }
      
      public function activateClothes(param1:int) : void
      {
         _activateId = param1;
         var _loc2_:HeroSkinActiveReq = new HeroSkinActiveReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(5019,_loc2_,server_activeCpl);
      }
      
      private function server_activeCpl() : void
      {
         model.onDataChangeOne(_activateId);
      }
      
      private function clear() : void
      {
         _reqSkinId = 0;
         _reqSkinKind = 0;
      }
      
      public function getInitSkinInfo() : void
      {
         ServerEngine.ins.send(5022,null,model.parseInfo);
      }
   }
}
