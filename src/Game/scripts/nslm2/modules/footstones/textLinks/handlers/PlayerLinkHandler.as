package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   
   public class PlayerLinkHandler extends LinkHandlerBase
   {
       
      
      private var _playerId:UInt64;
      
      public function PlayerLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:PlayerVo = new PlayerVo();
         _loc1_.playerId = this.playerId;
         _loc1_.name = playerName;
         _loc1_.disID = dist;
         _loc1_.gmtype = this.gmType;
         _loc1_.baseId = int(this.evtContent[4]);
         var _loc2_:int = ModuleMgr.ins.sceneLayer.curModuleId;
         var _loc3_:int = 102;
         if(!(int(_loc2_) - 50600))
         {
            _loc3_ = 117;
         }
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(_loc3_,_loc1_));
      }
      
      public function get playerId() : UInt64
      {
         if(_playerId == null)
         {
            _playerId = Uint64Util.fromString(this.evtContent[0]);
         }
         return _playerId;
      }
      
      public function get playerName() : String
      {
         return this.evtContent[1];
      }
      
      public function get dist() : int
      {
         return this.evtContent[2];
      }
      
      public function get gmType() : int
      {
         return this.evtContent[3];
      }
   }
}
