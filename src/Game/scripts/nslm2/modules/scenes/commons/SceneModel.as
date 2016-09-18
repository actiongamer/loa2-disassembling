package nslm2.modules.scenes.commons
{
   import flash.events.EventDispatcher;
   import nslm2.common.scene.multiLayer.configs.BgMapConfigVo;
   import common.findPath.FindPathMed;
   import proto.ScenePlayerInfo;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import proto.EnterSceneReq;
   import nslm2.common.model.PlayerModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ChangeCityScenelineReq;
   import proto.ProtocolStatusRes;
   import proto.EnterScenePlayerNotify;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.Uint64Util;
   import com.mz.core.event.MzEvent;
   import proto.EnterSceneOtherPlayerNotify;
   import proto.LeaveSceneNotify;
   import proto.ShowLineStateRes;
   import com.netease.protobuf.UInt64;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class SceneModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.scenes.commons.SceneModel;
      
      public static var canFindPath:Boolean = true;
       
      
      public var isCrossScene:Boolean = false;
      
      private var _mapConfigVo:BgMapConfigVo;
      
      public var findPathMed:FindPathMed;
      
      public var playerRole:ScenePlayerInfo;
      
      public var roleList:DictHash;
      
      private var _sceneId:uint;
      
      private var _stcStageVo:StcStageVo;
      
      private var isChangeLine:Boolean;
      
      public var showLineStateRes:ShowLineStateRes;
      
      public function SceneModel()
      {
         findPathMed = new FindPathMed();
         roleList = new DictHash();
         super();
         ServerEngine.ins.addAlwayHandler(8003,server_enterScene);
         ServerEngine.ins.addAlwayHandler(8001,server_enterSceneOther);
         ServerEngine.ins.addAlwayHandler(8002,server_leaveScene);
         ServerEngine.ins.addAlwayHandler(6051,se_showLineState);
         TimerManager.ins.doFrameLoop(1,onFrame);
      }
      
      public static function get ins() : nslm2.modules.scenes.commons.SceneModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.scenes.commons.SceneModel();
         }
         return _ins;
      }
      
      public function get mapConfigVo() : BgMapConfigVo
      {
         return _mapConfigVo;
      }
      
      public function set mapConfigVo(param1:BgMapConfigVo) : void
      {
         if(_mapConfigVo != param1)
         {
            _mapConfigVo = param1;
            if(_mapConfigVo)
            {
               this.findPathMed.sceneSize = _mapConfigVo.sceneSize;
            }
         }
      }
      
      private function onFrame() : void
      {
         canFindPath = true;
      }
      
      public function get sceneId() : uint
      {
         return _sceneId;
      }
      
      public function get stcStageVo() : StcStageVo
      {
         return _stcStageVo;
      }
      
      public function cmd_enterScene(param1:int) : void
      {
         var _loc2_:EnterSceneReq = new EnterSceneReq();
         _loc2_.sceneId = param1;
         PlayerModel.ins.currentCity = param1;
         ServerEngine.ins.send(8000,_loc2_);
      }
      
      public function cmd_changeLine(param1:int) : void
      {
         isChangeLine = true;
         var _loc2_:ChangeCityScenelineReq = new ChangeCityScenelineReq();
         _loc2_.line = param1;
         ServerEngine.ins.send(6050,_loc2_,null,server_changeLineErr);
      }
      
      private function server_changeLineErr(param1:ProtocolStatusRes) : void
      {
         this.isChangeLine = false;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function server_enterScene(param1:EnterScenePlayerNotify) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this._sceneId != param1.sceneId)
         {
            _sceneId = param1.sceneId;
            _stcStageVo = StcMgr.ins.getStageVo(this._sceneId);
            isChangeLine = false;
         }
         roleList.clear();
         var _loc3_:int = param1.players.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.players[_loc4_];
            roleList.put(Uint64Util.toString(_loc2_.baseInfo.id),_loc2_);
            if(Uint64Util.equal(_loc2_.baseInfo.id,PlayerModel.ins.playerInfo.id))
            {
               playerRole = _loc2_;
            }
            _loc4_++;
         }
         if(this.isChangeLine)
         {
            this.dispatchEvent(new MzEvent("modelServerCplPrefix" + 6050));
         }
         else
         {
            this.findPathMed.clear();
            this.dispatchEvent(new MzEvent("modelServerCplPrefix" + 8003));
         }
         this.isChangeLine = false;
      }
      
      private function server_enterSceneOther(param1:EnterSceneOtherPlayerNotify) : void
      {
      }
      
      private function server_leaveScene(param1:LeaveSceneNotify) : void
      {
      }
      
      private function se_showLineState(param1:ShowLineStateRes) : void
      {
         showLineStateRes = param1;
         this.dispatchEvent(new MzEvent("msg_show_line_state",param1));
      }
      
      public function changePlayerPos(param1:UInt64, param2:Point) : void
      {
         var _loc3_:ScenePlayerInfo = roleList.getValue(Uint64Util.toString(param1));
         if(_loc3_)
         {
            _loc3_.x = param2.x;
            _loc3_.y = param2.y;
         }
      }
      
      public function canShowPvpOption() : Boolean
      {
         if(ModuleMgr.ins.sceneLayer.curModuleId == 40500 || ModuleMgr.ins.sceneLayer.curModuleId == 40510)
         {
            return true;
         }
         return false;
      }
   }
}
