package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.PeakSportsMiniMapUI;
   import com.mz.core.utils.DictHash;
   import flash.geom.Vector3D;
   import morn.core.components.Image;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import flash.events.MouseEvent;
   import nslm2.mgrs.MouseIconManager;
   import com.mz.core.event.MzEvent;
   import proto.BkStagePlayerInfo;
   import nslm2.utils.Uint64Util;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import proto.BkGameStageInfoNotify;
   import proto.BkStageResInfo;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import proto.BkGameTeamBuff;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import proto.BkSpecialCommandNotify;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsPlayerDiedVo;
   import nslm2.common.model.PlayerModel;
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
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import morn.core.components.Label;
   import flash.events.Event;
   import proto.BkSpecialCommandReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.logging.Log;
   import org.specter3d.loaders.AssetLib;
   import flash.display.BitmapData;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Rectangle;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class PeakSportsMiniMap extends PeakSportsMiniMapUI
   {
       
      
      private var btnSoundSkin:String;
      
      private var mapScaleWidth:Number;
      
      private var mapScaleHeight:Number;
      
      private var initY:int = 0;
      
      private var lastHeight:Number = 0;
      
      private var _imgDict:DictHash;
      
      private var _playerSideDic:DictHash;
      
      public var npcArr:Array;
      
      public var pointDict:DictHash;
      
      private var _visibleDict:DictHash;
      
      private var effPos1:Vector3D;
      
      private var effPos2:Vector3D;
      
      private var effPos3:Vector3D;
      
      private var _specterImage1:Image;
      
      private var _specterImage2:Image;
      
      private var _specterImage3:Image;
      
      public function PeakSportsMiniMap()
      {
         _imgDict = new DictHash();
         _playerSideDic = new DictHash();
         npcArr = [];
         pointDict = new DictHash();
         _visibleDict = new DictHash();
         effPos1 = new Vector3D(543,498,0);
         effPos2 = new Vector3D(2347,2011,0);
         effPos3 = new Vector3D(3813,3968,0);
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
         switchEventListeners(true);
         this.img_role.mouseEvent = false;
         wuImage.mask = wuMaskImage;
         wuImage.url = UrlLib.peakSportsUI("maskMiniMap");
         wuImage.visible = false;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgFightMinimapNewImage",onNewImage);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerLeave",onDeleteImage);
            PeakSportsMsgs.ins.addEventListener("msgFightInfoChanged",onInfoChanged);
            PeakSportsMsgs.ins.addEventListener("peakSportsPatternInfo",onPattern);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerDied",onDied);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerRevived",onRevived);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgFightMinimapNewImage",onNewImage);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerLeave",onDeleteImage);
            PeakSportsMsgs.ins.removeEventListener("msgFightInfoChanged",onInfoChanged);
            PeakSportsMsgs.ins.removeEventListener("peakSportsPatternInfo",onPattern);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerDied",onDied);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerRevived",onRevived);
         }
      }
      
      protected function imgMapMouseOver(param1:MouseEvent) : void
      {
         if(commandBtn.selected)
         {
            MouseIconManager.changeMouseCursor("mouse_flag");
         }
      }
      
      protected function imgMapMouseOut(param1:MouseEvent) : void
      {
         if(commandBtn.selected)
         {
            MouseIconManager.changeMouseCursor("auto");
            MouseIconManager.ins.hideSpecialMouseCursor();
         }
      }
      
      private function onNewImage(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BkStagePlayerInfo = param1.data as BkStagePlayerInfo;
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
         _imgDict.put(Uint64Util.toString(_loc2_.playerInfo.baseInfo.id),_loc3_);
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
      
      private function onInfoChanged(param1:MzEvent) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:BkGameStageInfoNotify = PeakFlagModel.ins.bkGameStageInfoNotify;
         _loc7_ = 0;
         while(_loc7_ < _loc4_.resInfos.length)
         {
            _loc6_ = _loc4_.resInfos[_loc7_] as BkStageResInfo;
            if(_loc6_.id == 9002)
            {
               setImageUrl(_specterImage1,_loc6_.progress,PeakSportsTempType.getLimitProgress(_loc6_.id));
            }
            else if(_loc6_.id == 9003)
            {
               setImageUrl(_specterImage2,_loc6_.progress,PeakSportsTempType.getLimitProgress(_loc6_.id));
            }
            else
            {
               setImageUrl(_specterImage3,_loc6_.progress,PeakSportsTempType.getLimitProgress(_loc6_.id));
            }
            _loc7_++;
         }
         if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 1)
         {
            _loc5_ = _loc4_.teamBuff1;
         }
         else
         {
            _loc5_ = _loc4_.teamBuff2;
         }
         var _loc3_:Boolean = false;
         if(_loc5_ && _loc5_.length > 0)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc5_.length)
            {
               _loc2_ = _loc5_[_loc7_] as BkGameTeamBuff;
               if(_loc2_ && _loc2_.buffId == 1)
               {
                  _loc3_ = true;
               }
               _loc7_++;
            }
         }
      }
      
      private function setImageUrl(param1:Image, param2:int, param3:int) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param2 == param3)
         {
            param1.url = UrlLib.peakSportsMiniMap(2);
         }
         else if(param2 == -param3)
         {
            param1.url = UrlLib.peakSportsMiniMap(3);
         }
         else
         {
            param1.url = UrlLib.peakSportsMiniMap(1);
         }
      }
      
      private function time_onLoop() : void
      {
         txt_systemTime.text = TimeUtils.hiWithZero(ServerTimer.ins.date);
      }
      
      private function onPattern(param1:MzEvent) : void
      {
         var _loc2_:BkSpecialCommandNotify = param1.data as BkSpecialCommandNotify;
         if(_loc2_)
         {
            showEffPoint(_loc2_.param1,_loc2_.param2);
         }
      }
      
      protected function onDied(param1:MzEvent) : void
      {
         var _loc2_:PeakSportsPlayerDiedVo = param1.data as PeakSportsPlayerDiedVo;
         pointVisible(_loc2_.playerId);
      }
      
      protected function onRevived(param1:MzEvent) : void
      {
         pointVisible(param1.data);
      }
      
      private function pointVisible(param1:UInt64) : void
      {
         var _loc2_:* = null;
         var _loc3_:BkStagePlayerInfo = PeakSportsModel.ins.getBkStagePlayerInfo(param1);
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
      
      override public function show(param1:Object = null) : void
      {
         npcArr = null;
         super.show(param1);
         initY = 390;
         this.onResize(null);
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
               wuImage.x = img_role.x + (img_role.width - wuImage.width >> 1) - 11;
               wuImage.y = img_role.y + (img_role.height - wuImage.height >> 1) + 11;
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
         var _loc8_:int = 0;
         var _loc7_:* = npcArr;
         for each(var _loc1_ in npcArr)
         {
            _loc4_ = new Image();
            _loc4_.skin = PeakSportsUtil.getMiniMapResSkin(_loc1_);
            _loc4_.anchorX = 0.5;
            _loc4_.anchorY = 0.5;
            _loc4_.x = _loc1_.pos2d.x / mapScaleWidth;
            _loc4_.y = _loc1_.pos2d.y / mapScaleHeight;
            _loc5_ = new Label();
            var _loc6_:* = false;
            _loc5_.mouseEnabled = _loc6_;
            _loc5_.mouseChildren = _loc6_;
            _loc5_.size = 11;
            _loc4_.name = _loc1_.npcGroupId.toString();
            _loc4_.buttonMode = true;
            _loc2_ = LocaleMgr.ins.getStr(StcMgr.ins.getStageNpcRelationVo(_loc1_.npcGroupId).name,[_loc1_.npcGroupId == 9000?LocaleMgr.ins.getStr(999600139):LocaleMgr.ins.getStr(999600140)]);
            _loc4_.toolTip = _loc2_;
            _loc5_.width = 65;
            _loc5_.wordWrap = true;
            _loc5_.multiline = true;
            _loc5_.align = "center";
            _loc5_.autoSize = "none";
            _loc5_.text = _loc2_;
            if(_loc1_.npcGroupId == 9000)
            {
               _loc6_ = -_loc5_.width / 2 + 5;
               _loc5_.x = _loc6_;
               §§push(_loc6_);
            }
            else
            {
               _loc6_ = -_loc5_.width / 2 - 7;
               _loc5_.x = _loc6_;
               §§push(Number(_loc6_));
            }
            §§pop();
            _loc5_.y = -_loc5_.height + 1;
            this.layer_pois.addChild(_loc4_);
            if(!PeakSportsUtil.checkIsMonster(_loc1_))
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
            _loc1_ = PeakSportsModel.ins.bkStagePlayers.getValue(_loc3_);
            if(_loc4_ && _loc1_)
            {
               _loc4_.x = _loc1_.x / mapScaleWidth;
               _loc4_.y = _loc1_.y / mapScaleHeight;
            }
         }
         this.img_role.x = PeakSportsModel.ins.currentBkStagePlayerInfo.x / mapScaleWidth;
         this.img_role.y = PeakSportsModel.ins.currentBkStagePlayerInfo.y / mapScaleHeight;
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
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(commandBtn.selected)
         {
            if(param1.currentTarget == img_map)
            {
               _loc3_ = new BkSpecialCommandReq();
               _loc3_.command = 2;
               _loc3_.param1 = param1.currentTarget.mouseX;
               _loc3_.param2 = param1.currentTarget.mouseY;
               ServerEngine.ins.send(4276,_loc3_,null);
            }
         }
         else
         {
            if(PeakSportsModel.ins.isDied == true)
            {
               return;
            }
            var _loc4_:* = param1.target;
            if(this.img_map !== _loc4_)
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
         }
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
            addEffImage();
            this.img_map.addEventListener("click",onClickMiniMap);
         }
      }
      
      public function addEffImage() : void
      {
         _specterImage1 = new Image();
         _specterImage1.x = effPos1.x / mapScaleWidth - 11;
         _specterImage1.y = effPos1.y / mapScaleHeight - 20;
         layer_avatars.addChild(_specterImage1);
         _specterImage2 = new Image();
         _specterImage2.x = effPos2.x / mapScaleWidth - 11;
         _specterImage2.y = effPos2.y / mapScaleHeight - 20;
         layer_avatars.addChild(_specterImage2);
         _specterImage3 = new Image();
         _specterImage3.x = effPos3.x / mapScaleWidth - 11;
         _specterImage3.y = effPos3.y / mapScaleHeight - 20;
         layer_avatars.addChild(_specterImage3);
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
      
      public function showWu() : void
      {
         wuImage.x = img_role.x + (img_role.width - wuImage.width >> 1) - 11;
         wuImage.y = img_role.y + (img_role.height - wuImage.height >> 1) + 11;
         wuImage.visible = true;
      }
      
      public function hideWu() : void
      {
         wuImage.visible = false;
      }
      
      public function showEffPoint(param1:uint, param2:uint) : void
      {
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.setAnchor(0.5,0.5);
         _loc3_.init(90000001,1,"all",false);
         _loc3_.scaleAll = 0.3;
         _loc3_.x = param1;
         _loc3_.y = param2;
         img_map.addChild(_loc3_);
      }
      
      override public function dispose() : void
      {
         if(_specterImage1)
         {
            _specterImage1.dispose();
            _specterImage1 = null;
         }
         if(_specterImage2)
         {
            _specterImage2.dispose();
            _specterImage2 = null;
         }
         if(_specterImage3)
         {
            _specterImage3.dispose();
            _specterImage3 = null;
         }
         super.dispose();
      }
   }
}
