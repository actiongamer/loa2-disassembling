package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.BattlefieldMiniMapUI;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.vos.BattlefieldPlayerDiedVo;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import proto.BgStagePlayerInfo;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Image;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.utils.FunctionDelegate;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.geom.PoiAndRoVo;
   import flash.geom.Point;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import morn.core.components.Label;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import org.specter3d.loaders.AssetLib;
   import flash.display.BitmapData;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Rectangle;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class BattlefieldMiniMap extends BattlefieldMiniMapUI
   {
       
      
      private var btnSoundSkin:String;
      
      private var mapScaleWidth:Number;
      
      private var mapScaleHeight:Number;
      
      private var initY:int = 0;
      
      private var lastHeight:Number = 0;
      
      private const TWEEN_HEIGHT:int = 838;
      
      private const MOVE_HEIGHT:int = 650;
      
      private var _imgDict:DictHash;
      
      private var _playerSideDic:DictHash;
      
      public var npcArr:Array;
      
      public var pointDict:DictHash;
      
      private var _visibleDict:DictHash;
      
      public function BattlefieldMiniMap()
      {
         _imgDict = new DictHash();
         _playerSideDic = new DictHash();
         npcArr = [];
         pointDict = new DictHash();
         _visibleDict = new DictHash();
         super();
         this.top = 3;
         this.right = 3;
         this.img_role.smoothing = true;
         this.img_role.skin = "png.uiMiniMap.img_self";
         this.img_map.smoothing = true;
         DisplayUtils.addChildFromGlobal(this.layer_avatars,this.img_role);
         this.layer_pois.cancelMeasure();
         this.layer_pois.graphics.clear();
         this.layer_avatars.cancelMeasure();
         this.layer_avatars.graphics.clear();
         var _loc1_:StcStageVo = StcMgr.ins.getStageVo(SceneModel.ins.sceneId);
         this.txt_cityname.text = LocaleMgr.ins.getStr(_loc1_.name);
         this.txt_systemTime.toolTip = ServerTimer.ins.serverTimeTooltip;
         time_onLoop();
         TimerManager.ins.doLoop(1000,this.time_onLoop);
         onChangeFlagOwner(null);
         switchEventListeners(true);
         this.img_role.mouseEvent = false;
      }
      
      private function time_onLoop() : void
      {
         txt_systemTime.text = TimeUtils.hiWithZero(ServerTimer.ins.date);
      }
      
      override public function show(param1:Object = null) : void
      {
         npcArr = null;
         super.show(param1);
         initY = 390;
         this.onResize(null);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightMinimapNewImage",onNewImage);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerLeave",onDeleteImage);
            BattlefieldMsgs.ins.addEventListener("MSG_FLAG_OWNER_UPDATE",onChangeFlagOwner);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerDied",onDied);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerRevived",onRevived);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightMinimapNewImage",onNewImage);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerLeave",onDeleteImage);
            BattlefieldMsgs.ins.removeEventListener("MSG_FLAG_OWNER_UPDATE",onChangeFlagOwner);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerDied",onDied);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerRevived",onRevived);
         }
      }
      
      protected function onDied(param1:MzEvent) : void
      {
         var _loc2_:BattlefieldPlayerDiedVo = param1.data as BattlefieldPlayerDiedVo;
         pointVisible(_loc2_.playerId);
      }
      
      protected function onRevived(param1:MzEvent) : void
      {
         pointVisible(param1.data);
      }
      
      private function pointVisible(param1:UInt64) : void
      {
         var _loc2_:* = null;
         var _loc3_:BgStagePlayerInfo = BattlefieldModel.ins.getBgStagePlayerInfo(param1);
         if(_loc3_ == null)
         {
            return;
         }
         if(PlayerModel.ins.isCurPlayer(param1))
         {
            _loc2_ = img_role;
         }
         else
         {
            _loc2_ = _imgDict.getValue(Uint64Util.toString(param1));
         }
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc3_.status == 0)
         {
            _loc2_.visible = false;
         }
         else
         {
            _loc2_.visible = true;
         }
      }
      
      protected function onChangeFlagOwner(param1:MzEvent) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = BattleFlagModel.ins.flagOwnerIdArr;
         var _loc7_:int = 0;
         var _loc6_:* = _imgDict.dict;
         for(var _loc2_ in _imgDict.dict)
         {
            _loc5_ = _playerSideDic.getValue(_loc2_);
            _loc4_ = this._imgDict.getValue(_loc2_);
            if(_loc3_.indexOf(_loc2_) >= 0)
            {
               if(_loc4_)
               {
                  if(_loc5_ == 1)
                  {
                     _loc4_.url = "png.uiMiniMap.img_blueFlag";
                  }
                  else
                  {
                     _loc4_.url = "png.uiMiniMap.img_redFlag";
                  }
               }
            }
            else if(_loc4_)
            {
               if(_loc5_ == 1)
               {
                  _loc4_.url = "png.uiMiniMap.img_friend";
               }
               else
               {
                  _loc4_.url = "png.uiMiniMap.img_enemy";
               }
            }
         }
         _loc5_ = BattlefieldModel.ins.currentBgStagePlayerInfo.side;
         if(_loc3_.indexOf(Uint64Util.toString(PlayerModel.ins.playerInfo.id)) >= 0)
         {
            if(_loc5_ == 1)
            {
               img_role.url = "png.uiMiniMap.img_blueFlag";
            }
            else
            {
               img_role.url = "png.uiMiniMap.img_redFlag";
            }
         }
         else
         {
            img_role.url = "png.uiMiniMap.img_self";
         }
      }
      
      private function onNewImage(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BgStagePlayerInfo = param1.data as BgStagePlayerInfo;
         if(_loc2_.side == 1)
         {
            _loc3_ = new Image("png.uiMiniMap.img_friend");
         }
         else
         {
            _loc3_ = new Image("png.uiMiniMap.img_enemy");
         }
         _loc3_.smoothing = true;
         this.layer_avatars.addChild(_loc3_);
         _loc3_.anchorX = this.img_role.anchorX;
         _loc3_.anchorY = this.img_role.anchorY;
         _loc3_.x = _loc2_.x / mapScaleWidth;
         _loc3_.y = _loc2_.y / mapScaleHeight;
         _loc3_.mouseEvent = false;
         _playerSideDic.put(Uint64Util.toString(_loc2_.playerInfo.baseInfo.id),_loc2_.side);
         this._imgDict.put(Uint64Util.toString(_loc2_.playerInfo.baseInfo.id),_loc3_);
         onChangeFlagOwner(null);
      }
      
      private function onDeleteImage(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         var _loc3_:Image = this._imgDict.getValue(Uint64Util.toString(_loc2_));
         if(_loc3_)
         {
            this._imgDict.remove(Uint64Util.toString(_loc2_));
            _loc3_.dispose();
            _loc3_ = null;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_refresh_small_map","msg_player_hero_CHANGE_POS","msg_other_player_change_pos","msg_add_NPC","msg_npc_visible"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         super.handleNotices(param1,param2);
         var _loc10_:* = param1;
         if("msg_refresh_small_map" !== _loc10_)
         {
            if("msg_player_hero_CHANGE_POS" !== _loc10_)
            {
               if("msg_other_player_change_pos" !== _loc10_)
               {
                  if("msg_add_NPC" !== _loc10_)
                  {
                     if("msg_npc_visible" === _loc10_)
                     {
                        _loc5_ = param2 as MiniMapNpcVisibleVo;
                        changePointVisible(_loc5_.stageNpcRelationId,_loc5_.visible);
                        validatePoint(_loc5_.stageNpcRelationId);
                     }
                  }
                  else
                  {
                     _loc3_ = param2 as SceneNpc3D;
                     if(!npcArr)
                     {
                        npcArr = [];
                     }
                     npcArr.push(_loc3_);
                  }
               }
               else
               {
                  _loc7_ = param2 as PoiAndRoVo;
                  _loc6_ = _loc7_.poi;
                  _loc9_ = this._imgDict.getValue(_loc7_.playerId);
                  if(_loc9_)
                  {
                     _loc9_.x = _loc6_.x / mapScaleWidth;
                     _loc9_.y = _loc6_.y / mapScaleHeight;
                  }
               }
            }
            else
            {
               _loc7_ = param2 as PoiAndRoVo;
               _loc6_ = _loc7_.poi;
               this.img_role.x = _loc6_.x / mapScaleWidth;
               this.img_role.y = _loc6_.y / mapScaleHeight;
               pointVisible(PlayerModel.ins.playerInfo.id);
            }
         }
         else if(this.moduleInfo && this.moduleInfo.isShow)
         {
            _loc8_ = param2 as int;
            _loc4_ = UrlLib.sceneSmallJpg(_loc8_);
            AppGlobalContext.QueueLoader.loadOne(new ResourceVo(_loc4_),FunctionDelegate.create(loadSmallCpl,_loc4_),"default_group");
            this.txt_cityname.text = LocaleMgr.ins.getStr(StcMgr.ins.getStageVo(SceneModel.ins.sceneId).name);
         }
      }
      
      public function addNpcLabel() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         while(pointDict.array.length > 0)
         {
            DisplayUtils.removeSelf(pointDict.array.pop());
         }
         pointDict = new DictHash();
         var _loc3_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = npcArr;
         for each(var _loc1_ in npcArr)
         {
            _loc4_ = new Image();
            _loc4_.skin = BattlefieldUtil.getMiniMapResSkin(_loc1_);
            _loc4_.anchorX = 0.5;
            _loc4_.anchorY = 0.5;
            _loc4_.x = _loc1_.pos2d.x / mapScaleWidth;
            _loc4_.y = _loc1_.pos2d.y / mapScaleHeight;
            _loc5_ = new Label();
            _loc4_.name = _loc1_.npcGroupId.toString();
            _loc4_.buttonMode = true;
            _loc2_ = LocaleMgr.ins.getStr(StcMgr.ins.getStageNpcRelationVo(_loc1_.npcGroupId).name);
            _loc4_.toolTip = _loc2_;
            _loc5_.width = 65;
            _loc5_.wordWrap = true;
            _loc5_.multiline = true;
            _loc5_.align = "center";
            _loc5_.autoSize = "none";
            _loc5_.text = _loc2_;
            _loc5_.x = -_loc5_.width / 2;
            _loc5_.y = -5 - _loc5_.height;
            this.layer_pois.addChild(_loc4_);
            if(!BattlefieldUtil.checkIsMonster(_loc1_))
            {
               _loc4_.addChild(_loc5_);
            }
            pointDict.put(_loc1_.npcGroupId,_loc4_);
            _loc4_.addEventListener("click",onClickMiniMap);
         }
         validatePointAll();
         npcArr = null;
      }
      
      private function validatePointAll() : void
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = pointDict.dict;
         for(var _loc2_ in pointDict.dict)
         {
            validatePoint(_loc2_);
         }
         var _loc8_:int = 0;
         var _loc7_:* = _imgDict.dict;
         for(var _loc3_ in _imgDict.dict)
         {
            _loc4_ = this._imgDict.getValue(_loc3_);
            _loc1_ = BattlefieldModel.ins.bgStagePlayers.getValue(_loc3_);
            if(_loc4_ && _loc1_)
            {
               _loc4_.x = _loc1_.x / mapScaleWidth;
               _loc4_.y = _loc1_.y / mapScaleHeight;
            }
         }
         this.img_role.x = BattlefieldModel.ins.currentBgStagePlayerInfo.x / mapScaleWidth;
         this.img_role.y = BattlefieldModel.ins.currentBgStagePlayerInfo.y / mapScaleHeight;
      }
      
      private function validatePoint(param1:int) : void
      {
         var _loc2_:Image = pointDict.getValue(param1);
         if(_loc2_)
         {
            _loc2_.visible = _visibleDict.getValue(param1);
         }
      }
      
      private function changePointVisible(param1:int, param2:Boolean) : void
      {
         _visibleDict.put(param1,param2);
      }
      
      public function onClickMiniMap(param1:Event) : void
      {
         var _loc2_:* = null;
         if(BattlefieldModel.ins.isDied == true)
         {
            return;
         }
         var _loc3_:* = param1.target;
         if(this.img_map !== _loc3_)
         {
            ObserverMgr.ins.sendNotice("task_notice_auto_track",param1.target.name);
         }
         else
         {
            _loc2_ = new Point(box_map.mouseX * mapScaleWidth,box_map.mouseY * mapScaleHeight);
            ObserverMgr.ins.sendNotice("MSG_MINIMAP_POS_CHANGE",_loc2_);
            if(EnvConfig.ins.showDebugModule)
            {
               Log.debug(this,"SceneClickPoi:",_loc2_);
            }
         }
         AssistantModel.ins.removeTask(50500);
      }
      
      private function loadSmallCpl(param1:String) : void
      {
         var _loc2_:BitmapData = AssetLib.getBitmapData(param1);
         if(_loc2_)
         {
            img_map.bitmapData = _loc2_;
            mapScaleWidth = 8 * (_loc2_.width / img_map.width);
            mapScaleHeight = 8 * (_loc2_.height / img_map.height);
            addNpcLabel();
            this.img_map.addEventListener("click",onClickMiniMap);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         TimerManager.ins.clearTimer(fadeView_fadeInCpl);
         switchEventListeners(false);
         img_map.bitmapData = null;
         while(pointDict.array.length > 0)
         {
            this.layer_pois.removeChild(pointDict.array.pop());
         }
         while(this._imgDict.array.length > 0)
         {
            this.layer_avatars.removeChild(this._imgDict.array.pop());
         }
         this.preCloseCpl();
      }
      
      override protected function get bounds() : Rectangle
      {
         return new Rectangle(this.x,this.y,this.width,this.height);
      }
   }
}
