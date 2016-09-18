package nslm2.modules.battles.PeakSports.scene
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import proto.BkStagePlayerInfo;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.common.model.PlayerModel;
   import morn.core.managers.timerMgrs.TimerManager;
   import proto.BkSceneMoveReq;
   import nslm2.modules.battles.PeakSports.service.PeakSportsBattleService;
   import flash.geom.Point;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsPlayerDiedVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import proto.ScenePlayerInfo;
   import nslm2.modules.battles.PeakSports.control.PeakSportsPlayerBaseControl;
   import nslm2.modules.battles.PeakSports.control.PeakSportsEnemyControl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.foundations.setting.model.SettingModel;
   
   public class PeakSportsScene3D extends Scene45Base
   {
       
      
      public function PeakSportsScene3D()
      {
         super();
         this.useFullScreen = true;
      }
      
      private function get model() : PeakSportsModel
      {
         return PeakSportsModel.ins;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgFightNewPlayer",onNewPlayer);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgFightNewPlayer",onNewPlayer);
         }
      }
      
      private function onNewPlayer(param1:MzEvent) : void
      {
         var _loc2_:BkStagePlayerInfo = param1.data as BkStagePlayerInfo;
         this.addOtherPlayer(_loc2_,true);
      }
      
      override protected function init3D() : void
      {
         SceneModel.ins.findPathMed.initFindPathMedVector([0,1,2,3]);
         super.init3D();
         playerHero.tag3DVBox.initName(PlayerModel.ins.getPlayerNameWithAccType(PlayerModel.ins.getSelfFullNameWithDistName(false),PlayerModel.ins.playerInfo.gmType,0),16723968);
         TimerManager.ins.doLoop(500,sendSelfPosition);
      }
      
      private function sendSelfPosition() : void
      {
         var _loc1_:BkSceneMoveReq = new BkSceneMoveReq();
         _loc1_.x = this.playerHero.pos2d.x;
         _loc1_.y = this.playerHero.pos2d.y;
         PeakSportsBattleService.ins.sendSelfPos(_loc1_);
      }
      
      override protected function showOtherRoleArr() : void
      {
         var len:int = PeakSportsModel.ins.bkStagePlayers.array.length;
         var i:int = 0;
         while(i < len)
         {
            var $otherRole:BkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.array[i];
            if(Uint64Util.equal($otherRole.playerInfo.baseInfo.id,PlayerModel.ins.playerInfo.id))
            {
               var $curXY:Point = new Point(MathUtil.maxMin($otherRole.x,this.mapConfigVo.sceneSize.x,0),MathUtil.maxMin($otherRole.y,this.mapConfigVo.sceneSize.y,0));
               $curXY = SceneModel.ins.findPathMed.getCanMovePoiNearest($curXY,$otherRole.side);
               playerHero.pos2d = $curXY;
               if($otherRole.rebornStamp == -1)
               {
                  var tempConDeathNum:uint = $otherRole.conDeathNum;
                  App.timer.doOnce(500,function():*
                  {
                     var /*UnknownSlot*/:* = function():void
                     {
                        PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerDied",new PeakSportsPlayerDiedVo(PlayerModel.ins.playerInfo.id,ServerTimer.ins.second,tempConDeathNum,-1)));
                     };
                     return function():void
                     {
                        PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightPlayerDied",new PeakSportsPlayerDiedVo(PlayerModel.ins.playerInfo.id,ServerTimer.ins.second,tempConDeathNum,-1)));
                     };
                  }());
               }
            }
            else
            {
               addOtherPlayer($otherRole,true);
            }
            i = Number(i) + 1;
         }
      }
      
      public function addOtherPlayer(param1:BkStagePlayerInfo, param2:Boolean = true) : ScenePlayer3D
      {
         var _loc3_:* = null;
         var _loc4_:ScenePlayerInfo = PeakSportsUtil.bkStagePlayerInfoToScenePlayerInfo(param1);
         if(PeakSportsUtil.isFriend(param1.side))
         {
            _loc3_ = new PeakSportsFriend3D(avatarLayer);
            _loc3_.side = param1.side;
            _loc3_.roleId = _loc4_.baseInfo.id;
            _loc3_.playerInfo = _loc4_;
            _loc3_.initName();
            this.parts.push(new PeakSportsPlayerBaseControl().bind(_loc3_).initScene(this));
         }
         else
         {
            _loc3_ = new PeakSportsEnemy3D(avatarLayer);
            _loc3_.side = param1.side;
            _loc3_.roleId = _loc4_.baseInfo.id;
            _loc3_.playerInfo = _loc4_;
            _loc3_.initName();
            this.parts.push(new PeakSportsEnemyControl().bind(_loc3_).initScene(this));
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
         PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightMinimapNewImage",param1));
         return _loc3_;
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(sendSelfPosition);
         super.dispose();
      }
   }
}
