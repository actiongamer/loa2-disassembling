package nslm2.modules.battles.battlefields.scene
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.common.model.PlayerModel;
   import morn.core.managers.timerMgrs.TimerManager;
   import proto.BgStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import proto.ScenePlayerInfo;
   import nslm2.modules.battles.battlefields.ctrls.BattlefieldPlayerBaseCtrl;
   import nslm2.modules.battles.battlefields.ctrls.BattlefieldEnemyCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import com.mz.core.event.MzEvent;
   import proto.BgSceneMoveReq;
   import nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
   
   public class BattlefieldScene3D extends Scene45Base
   {
       
      
      public function BattlefieldScene3D()
      {
         super();
         this.useFullScreen = true;
      }
      
      private function get model() : BattlefieldModel
      {
         return BattlefieldModel.ins;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightNewPlayer",onNewPlayer);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightNewPlayer",onNewPlayer);
         }
      }
      
      override protected function init3D() : void
      {
         SceneModel.ins.findPathMed.initFindPathMedVector([0,1,2]);
         super.init3D();
         playerHero.tag3DVBox.initName(PlayerModel.ins.getPlayerNameWithAccType(PlayerModel.ins.getSelfFullNameWithDistName(false),PlayerModel.ins.playerInfo.gmType,0),16723968);
         TimerManager.ins.doLoop(500,sendSelfPosition);
      }
      
      override protected function showOtherRoleArr() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:int = BattlefieldModel.ins.bgStagePlayers.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = BattlefieldModel.ins.bgStagePlayers.array[_loc4_];
            if(Uint64Util.equal(_loc3_.playerInfo.baseInfo.id,PlayerModel.ins.playerInfo.id))
            {
               _loc1_ = new Point(MathUtil.maxMin(_loc3_.x,this.mapConfigVo.sceneSize.x,0),MathUtil.maxMin(_loc3_.y,this.mapConfigVo.sceneSize.y,0));
               _loc1_ = SceneModel.ins.findPathMed.getCanMovePoiNearest(_loc1_,_loc3_.side);
               playerHero.pos2d = _loc1_;
            }
            else
            {
               this.addOtherPlayer(_loc3_,true);
            }
            _loc4_++;
         }
      }
      
      public function addOtherPlayer(param1:BgStagePlayerInfo, param2:Boolean = true) : ScenePlayer3D
      {
         var _loc3_:* = null;
         var _loc4_:ScenePlayerInfo = BattlefieldUtil.bgStagePlayerInfoToScenePlayerInfo(param1);
         if(BattlefieldUtil.isFriend(param1.side))
         {
            _loc3_ = new BattlefieldFriend3D(avatarLayer);
            _loc3_.side = param1.side;
            _loc3_.roleId = _loc4_.baseInfo.id;
            _loc3_.playerInfo = _loc4_;
            _loc3_.initName();
            this.parts.push(new BattlefieldPlayerBaseCtrl().bind(_loc3_).initScene(this));
         }
         else
         {
            _loc3_ = new BattlefieldEnemy3D(avatarLayer);
            _loc3_.side = param1.side;
            _loc3_.roleId = _loc4_.baseInfo.id;
            _loc3_.playerInfo = _loc4_;
            _loc3_.initName();
            this.parts.push(new BattlefieldEnemyCtrl().bind(_loc3_).initScene(this));
         }
         _loc3_.suitId = _loc4_.baseInfo.clothes;
         _loc3_.wingId = _loc4_.baseInfo.wing;
         _loc3_.stcNpcId = _loc4_.baseInfo.npcId;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_loc3_.stcNpcId);
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(_loc3_,_loc4_.baseInfo);
         if(_loc4_.baseInfo.horse)
         {
            _loc3_.initStcHorseId(_loc4_.baseInfo.horse);
         }
         _loc3_.x2d = _loc4_.x;
         _loc3_.y2d = _loc4_.y;
         if(_loc3_.avatar)
         {
            _loc3_.avatar.effectsVisible = SettingModel.ins.otherSpecEffect == 0;
         }
         _loc3_.visible = param1.status != 0;
         this.otherRoleArr.push(_loc3_);
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightMinimapNewImage",param1));
         return _loc3_;
      }
      
      private function sendSelfPosition() : void
      {
         var _loc1_:BgSceneMoveReq = new BgSceneMoveReq();
         _loc1_.x = this.playerHero.pos2d.x;
         _loc1_.y = this.playerHero.pos2d.y;
         BattlefieldBattleService.ins.sendSelfPos(_loc1_);
      }
      
      private function onNewPlayer(param1:MzEvent) : void
      {
         var _loc2_:BgStagePlayerInfo = param1.data as BgStagePlayerInfo;
         this.addOtherPlayer(_loc2_,true);
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(sendSelfPosition);
         super.dispose();
      }
   }
}
