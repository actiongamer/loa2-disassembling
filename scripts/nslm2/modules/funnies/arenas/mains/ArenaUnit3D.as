package nslm2.modules.funnies.arenas.mains
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.common.vo.PlayerVo;
   import game.ui.arenas.mains.fightBtnPanelUI;
   import proto.ArenaPlayer;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.common.vo.VipInfoVo;
   import nslm2.utils.TransformUtil;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Vector3D;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.mgrs.MouseIconManager;
   import com.game.shared.component.NameTag3D;
   import away3d.entities.Entity;
   import morn.core.components.Label;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import game.ui.arenas.mains.ArenaRankTagUI;
   import morn.core.components.Component;
   import morn.core.components.Image;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   
   public class ArenaUnit3D extends Unit3DBase
   {
       
      
      public var playerVo:PlayerVo;
      
      public var say:nslm2.modules.funnies.arenas.mains.ArenaUnitSay;
      
      public var btnPanel:fightBtnPanelUI;
      
      public var arenaPlayer:ArenaPlayer;
      
      public var _nameTag:NameTag3D;
      
      public var _rankTag3D:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function ArenaUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
         this.overMethodEnabled = true;
         this.overMethodColor = 16723968;
         this.useShadow = false;
         this.tag3DBottomBox.showShadow();
      }
      
      public function initByArenaPlayer(param1:ArenaPlayer) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.playerInfo.npcId);
         if(arenaPlayer == null)
         {
            this.arenaPlayer = param1;
         }
         if(_loc2_)
         {
            if(_rankTag3D && (param1.rank > 3 || Uint64Util.equal(this.arenaPlayer.playerInfo.id,param1.playerInfo.id) == false))
            {
               TweenLite.to(_rankTag3D,0.5,{"alpha":0});
            }
            if(_nameTag && (param1.rank > 3 || Uint64Util.equal(this.arenaPlayer.playerInfo.id,param1.playerInfo.id) == false))
            {
               TweenLite.to(_nameTag,0.5,{"alpha":0});
            }
            if(_fightTag3D && (param1.rank > 3 || Uint64Util.equal(this.arenaPlayer.playerInfo.id,param1.playerInfo.id) == false))
            {
               TweenLite.to(_fightTag3D,0.5,{"alpha":0});
            }
            if(this.avatar == null)
            {
               changeView(param1);
            }
            else if(param1.rank > 3 || Uint64Util.equal(this.arenaPlayer.playerInfo.id,param1.playerInfo.id) == false)
            {
               this.mouseEnabled = false;
               this.mouseChildren = false;
               setMouseCursorOut();
               TweenLite.to(this.avatar,0.5,{
                  "alpha":0,
                  "onComplete":changeView,
                  "onCompleteParams":[param1]
               });
            }
            this.arenaPlayer = param1;
         }
         else
         {
            Log.fatal(this,"缺少stcNpcId",param1.playerInfo.npcId,param1);
         }
      }
      
      private function changeView(param1:ArenaPlayer) : void
      {
         this.visible = false;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1.playerInfo);
         if(param1.playerInfo.horse && param1.rank < 4)
         {
            this.initStcHorseId(param1.playerInfo.horse);
         }
         this.showName(param1.playerInfo.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.playerInfo.militaryRank)));
         var _loc2_:VipInfoVo = VipUtils.vipInfoVo(param1.playerInfo);
         _loc2_ = new VipInfoVo();
         _loc2_.isQQLux = true;
         _loc2_.isQQVip = true;
         _loc2_.qqVip = 5;
         this.tag3DVBox.initVip(_loc2_);
         if(this.tag3DVBox.vipTag && this.tag3DVBox.vipTag.visible)
         {
            this.tag3DVBox.vipTag.x = this.tag3DVBox.vipTag.width / 2 - 4 - 58;
            if(this.arenaPlayer.rank <= 3)
            {
               this.tag3DVBox.vipTag.y = 20;
            }
            else
            {
               this.tag3DVBox.vipTag.y = 38;
            }
         }
         this.showRank(param1.rank);
         this.showFightValue(Uint64Util.toNumber(param1.playerInfo.ability));
         this.orderTags();
         this.avatar.alpha = 0;
         this.visible = true;
         TweenLite.to(_rankTag3D,0.5,{"alpha":1});
         TweenLite.to(_nameTag,0.5,{"alpha":1});
         TweenLite.to(_fightTag3D,0.5,{"alpha":1});
         TweenLite.to(this.avatar,0.5,{"alpha":1});
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
      
      override protected function setMouseCursorOver() : void
      {
         var _loc1_:Vector3D = TransformUtil.stage3Dto2D(this.tag3DVBox.scenePosition,UIMgr.ins.dragLayer);
         if(say)
         {
            say.show(!!arenaPlayer.manifesto?arenaPlayer.manifesto:LocaleMgr.ins.getStr(999000397),_loc1_.x,_loc1_.y);
         }
         if(btnPanel && arenaPlayer.rank > ArenaService.ins.infoRes.rank)
         {
            btnPanel.x = _loc1_.x - 30;
            btnPanel.y = _loc1_.y + 130;
            btnPanel.visible = true;
         }
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      override protected function setMouseCursorOut() : void
      {
         super.setMouseCursorOut();
         if(say)
         {
            say.hide();
         }
         if(btnPanel)
         {
            btnPanel.visible = false;
         }
      }
      
      override protected function validatePos() : void
      {
         this.position = new Vector3D(this.pos2d.x,this.pos2d.y,this.pos2d.y * 2);
      }
      
      public function showName(param1:String, param2:uint) : void
      {
         if(_nameTag == null)
         {
            _nameTag = new NameTag3D();
            tag3DVBox.addChild(_nameTag);
            _nameTag.renderLayer = Entity.TOP_LAYER;
            _nameTag.mousePriority = 4;
            _nameTag.addEventListener("mouseOver3d",_nameTag_OVER);
            _nameTag.addEventListener("mouseOut3d",_nameTag_OUT);
            _nameTag.addEventListener("mouseDown3d",_nameTag_mouse);
         }
         if(PlayerModel.ins.isCurPlayer(this.arenaPlayer.playerInfo.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         _loc3_.text = LinkUtils.playerNameSmart(this.arenaPlayer.playerInfo.id,this.arenaPlayer.playerInfo.name,this.arenaPlayer.playerInfo.dist,param2);
         _loc3_.commitMeasure();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         _loc4_.draw(_loc3_,null,null,null,null,true);
         _loc4_ = BitmapUtils.transparentCut(_loc4_);
         _nameTag.setBitmapData(_loc4_,true);
         _loc3_.dispose();
      }
      
      private function _nameTag_OVER(param1:Event) : void
      {
         MouseIconManager.changeMouseCursor("hand");
      }
      
      private function _nameTag_OUT(param1:Event) : void
      {
         MouseIconManager.changeMouseCursor("auto");
      }
      
      private function _nameTag_mouse(param1:Event) : void
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = this.arenaPlayer.playerInfo.id;
         _loc2_.disID = this.arenaPlayer.playerInfo.dist;
         _loc2_.name = this.arenaPlayer.playerInfo.name;
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(102,_loc2_));
      }
      
      public function showRank(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_rankTag3D == null)
         {
            _rankTag3D = new NameTag3D();
            tag3DVBox.addChild(_rankTag3D);
            _rankTag3D.renderLayer = Entity.TOP_LAYER;
            _rankTag3D.y = 38;
         }
         if(param1 > 3)
         {
            _loc4_ = new ArenaRankTagUI();
            _loc4_.txt_value.text = String(param1);
            _loc4_.commitMeasure();
            _loc2_ = _loc4_;
         }
         else
         {
            _loc5_ = new Image("png.uiArenas.rank" + param1);
            _loc2_ = _loc5_;
         }
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_,null,null,null,null,true);
         _loc2_.dispose();
         _loc3_ = BitmapUtils.transparentCut(_loc3_);
         _rankTag3D.setBitmapData(_loc3_,true);
      }
      
      public function showFightValue(param1:Number) : void
      {
         if(_fightTag3D == null)
         {
            _fightTag3D = new NameTag3D();
            tag3DVBox.addChild(_fightTag3D);
            _fightTag3D.renderLayer = Entity.TOP_LAYER;
            _fightTag3D.y = 36;
         }
         var _loc2_:ArenaFightValueTagUI = new ArenaFightValueTagUI();
         _loc2_.txt_value.text = String(param1);
         _loc2_.commitMeasure();
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_,null,null,null,null,true);
         _loc3_ = BitmapUtils.transparentCut(_loc3_);
         _fightTag3D.setBitmapData(_loc3_,true);
         _loc2_.dispose();
      }
      
      private function orderTags() : void
      {
         if(this.arenaPlayer.rank > 3)
         {
            _nameTag.y = 36;
            _fightTag3D.y = 18;
            _rankTag3D.y = 0;
         }
         else
         {
            _rankTag3D.y = 54;
            _nameTag.y = 18;
            _fightTag3D.y = 0;
         }
      }
      
      override protected function countRunRo(param1:Point, param2:Point) : int
      {
         return -1 * super.countRunRo(param1,param2);
      }
      
      override public function dispose() : void
      {
         if(_rankTag3D)
         {
            TweenLite.killTweensOf(_rankTag3D);
            _rankTag3D.dispose();
            _rankTag3D = null;
         }
         if(_nameTag)
         {
            TweenLite.killTweensOf(_nameTag);
            _nameTag.removeEventListener("mouseOver3d",_nameTag_OVER);
            _nameTag.removeEventListener("mouseOut3d",_nameTag_OUT);
            _nameTag.removeEventListener("mouseDown3d",_nameTag_mouse);
            _nameTag.dispose();
            _nameTag = null;
         }
         if(_fightTag3D)
         {
            TweenLite.killTweensOf(_fightTag3D);
            _fightTag3D.dispose();
            _fightTag3D = null;
         }
         if(this.avatar)
         {
            TweenLite.killTweensOf(this.avatar);
            avatar.dispose();
            avatar = null;
         }
         super.dispose();
      }
   }
}
