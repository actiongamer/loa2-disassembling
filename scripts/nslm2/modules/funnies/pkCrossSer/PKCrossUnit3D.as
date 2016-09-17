package nslm2.modules.funnies.pkCrossSer
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import proto.CrossArenaEnemyInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import flash.display.BitmapData;
   import org.specter3d.events.Avatar3DEvent;
   import away3d.bounds.NullBounds;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.MouseIconManager;
   import flash.geom.Vector3D;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import flash.geom.Matrix;
   import away3d.entities.Entity;
   import com.game.shared.component.NameTag3D;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import morn.core.utils.BitmapUtils;
   import flash.events.Event;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import game.ui.arenas.mains.ArenaRankTagUI;
   import morn.core.components.Component;
   import morn.core.components.Image;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   
   public class PKCrossUnit3D extends Unit3DBase
   {
       
      
      public var arenaPlayer:CrossArenaEnemyInfo;
      
      private var RIPImg:Image3D;
      
      public var _hpBarImage3D:Image3D;
      
      private var _jiFenTag3D:NameTag3D;
      
      public var _nameTag:NameTag3D;
      
      public var _rankTag3D:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function PKCrossUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
         this.overMethodEnabled = true;
         this.overMethodColor = 16723968;
         this.useShadow = false;
         this.tag3DBottomBox.showShadow();
         this.tag3DBottomBox.visible = false;
      }
      
      public function initByArenaPlayer(param1:CrossArenaEnemyInfo) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.npcId);
         if(arenaPlayer == null)
         {
            this.arenaPlayer = param1;
         }
         if(_loc2_)
         {
            if(_nameTag && Uint64Util.equal(this.arenaPlayer.baseInfo.id,param1.baseInfo.id) == false)
            {
               TweenLite.to(_nameTag,0.5,{"alpha":0});
            }
            if(_fightTag3D && Uint64Util.equal(this.arenaPlayer.baseInfo.id,param1.baseInfo.id) == false)
            {
               TweenLite.to(_fightTag3D,0.5,{"alpha":0});
            }
            if(Uint64Util.equal(this.arenaPlayer.baseInfo.id,param1.baseInfo.id) == false)
            {
               this.mouseEnabled = false;
               this.mouseChildren = false;
               setMouseCursorOut();
               if(avatar)
               {
                  TweenLite.to(this.avatar,0.5,{
                     "alpha":0,
                     "onComplete":changeView,
                     "onCompleteParams":[param1]
                  });
               }
               else
               {
                  changeView(param1);
               }
            }
            else
            {
               changeView(param1);
            }
            this.arenaPlayer = param1;
            this.tag3DBottomBox.visible = true;
         }
         else
         {
            Log.fatal(this,"缺少stcNpcId",param1.baseInfo.npcId,param1);
         }
      }
      
      public function becomeRIP() : void
      {
         var _loc1_:BitmapData = App.asset.getBitmapData("png.uiPKCrossSer.img_cross");
         if(!RIPImg)
         {
            RIPImg = new Image3D(null,_loc1_.width,_loc1_.height,-200);
            RIPImg.showByBmd(_loc1_);
         }
         RIPImg.visible = true;
         RIPImg.y = 60;
         this.tag3DBottomBox.boxIngoreRoScale.addChild(RIPImg);
         this.box3D2.visible = false;
         overMethodEnabled = false;
         buttonMode = false;
      }
      
      override protected function onHouseAvatarAnimAllComplete(param1:Avatar3DEvent) : void
      {
         super.onHouseAvatarAnimAllComplete(param1);
         this.horseAvatar.avatarMesh.bounds = new NullBounds();
      }
      
      override protected function validateMouseEvent() : void
      {
         super.validateMouseEvent();
         if(this.avatar)
         {
            this.avatar.mouseChildren = true;
            this.avatar.mouseEnabled = true;
            this.switchMouseEvent(this.avatar,true);
         }
         if(horseAvatar)
         {
            this.horseAvatar.mouseChildren = true;
            this.horseAvatar.mouseEnabled = false;
            this.switchMouseEvent(this.horseAvatar,false);
         }
      }
      
      private function changeView(param1:CrossArenaEnemyInfo) : void
      {
         box3D2.visible = true;
         if(RIPImg)
         {
            RIPImg.visible = false;
         }
         overMethodEnabled = true;
         buttonMode = true;
         this.showName(PlayerModel.ins.getFullNameWithDistName(arenaPlayer.baseInfo,false),ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.baseInfo.militaryRank)));
         this.showFightValue(Uint64Util.toNumber(param1.baseInfo.ability));
         this.showHpBar(param1.leftHp / 100);
         this.showJiFen(LocaleMgr.ins.getStr(50600033,[param1.score,param1.coin]));
         if(param1.status == 0)
         {
            becomeRIP();
            this.orderTags();
            return;
         }
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1.baseInfo);
         if(param1.baseInfo.horse)
         {
            this.initStcHorseId(param1.baseInfo.horse);
            this.orderTags(true);
         }
         else
         {
            this.orderTags();
         }
         this.box3D2.scaleAll = 0.9;
         this.avatar.alpha = 0;
         this.visible = true;
         TweenLite.to(_nameTag,0.5,{"alpha":1});
         TweenLite.to(_fightTag3D,0.5,{"alpha":1});
         TweenLite.to(this.avatar,0.5,{"alpha":1});
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
      
      override protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      override protected function validatePos() : void
      {
         this.position = new Vector3D(this.pos2d.x,this.pos2d.y,this.pos2d.y * 2);
      }
      
      public function showHpBar(param1:Number, param2:String = null) : void
      {
         var _loc6_:ProgressBar = new ProgressBar();
         _loc6_.skin = !!param2?param2:"png.a5.comps.progresses.progress_S14";
         _loc6_.value = param1;
         _loc6_.commitMeasure();
         var _loc5_:Label = new Label();
         _loc5_.width = _loc6_.width;
         _loc5_.align = "center";
         _loc5_.text = int(param1 * 100) + "%";
         _loc5_.color = 16777215;
         _loc5_.size = 12;
         _loc5_.commitMeasure();
         var _loc3_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height + 4,true,0);
         var _loc4_:Matrix = new Matrix();
         _loc4_.ty = 2;
         _loc3_.draw(_loc6_,_loc4_,null,null,null,false);
         _loc4_ = new Matrix();
         _loc4_.ty = -2;
         _loc3_.draw(_loc5_,_loc4_,null,null,null,false);
         if(_hpBarImage3D == null)
         {
            _hpBarImage3D = new Image3D(null,_loc3_.width,_loc3_.height,0);
            _hpBarImage3D.renderLayer = Entity.TOP_LAYER;
         }
         tag3DVBox.boxIngoreRoScale.addChild(_hpBarImage3D);
         _hpBarImage3D.showByBmd(_loc3_);
         _hpBarImage3D.y = 18;
      }
      
      public function showJiFen(param1:String) : void
      {
         if(_jiFenTag3D == null)
         {
            _jiFenTag3D = new NameTag3D(200);
            _jiFenTag3D.renderLayer = Entity.TOP_LAYER;
            this.tag3DVBox.addChild(_jiFenTag3D);
         }
         _jiFenTag3D.setText(param1);
         _jiFenTag3D.drawBitmap();
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
         if(PlayerModel.ins.isCurPlayer(this.arenaPlayer.baseInfo.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         if(ClientConfig.isRuLang())
         {
            _loc3_.font = "Arial";
         }
         _loc3_.text = LinkUtils.playerNameSmart(this.arenaPlayer.baseInfo.id,param1,this.arenaPlayer.baseInfo.dist,param2);
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
         _loc2_.playerId = this.arenaPlayer.baseInfo.id;
         _loc2_.disID = this.arenaPlayer.baseInfo.dist;
         _loc2_.name = this.arenaPlayer.baseInfo.name;
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(117,_loc2_));
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
      
      private function orderTags(param1:Boolean = false) : void
      {
         var _loc2_:int = !!param1?24:0;
         _nameTag.y = 32 + _loc2_;
         _hpBarImage3D.y = 17 + _loc2_;
         _fightTag3D.y = 0 + _loc2_;
         _jiFenTag3D.y = -24 + _loc2_;
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
         if(_hpBarImage3D)
         {
            _hpBarImage3D.dispose();
            _hpBarImage3D = null;
         }
         if(_jiFenTag3D)
         {
            _jiFenTag3D.dispose();
            _jiFenTag3D = null;
         }
         if(RIPImg)
         {
            RIPImg.dispose();
            RIPImg = null;
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
