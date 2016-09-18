package nslm2.modules.funnies.guildPKCrossSer
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import proto.FamilyExpeEnemyInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import flash.display.BitmapData;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.MouseIconManager;
   import morn.core.components.ProgressBar;
   import morn.core.components.Image;
   import flash.geom.Matrix;
   import morn.core.components.Label;
   import away3d.entities.Entity;
   import com.game.shared.component.NameTag3D;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import away3d.events.MouseEvent3D;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import morn.core.utils.BitmapUtils;
   import flash.events.Event;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import game.ui.arenas.mains.ArenaRankTagUI;
   import morn.core.components.Component;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   
   public class GPKUnit3D extends Unit3DBase
   {
       
      
      public var arenaPlayer:FamilyExpeEnemyInfo;
      
      private var RIPImg:Image3D;
      
      public var _hpBarImage3D:Image3D;
      
      private var _jiFenTag3D:NameTag3D;
      
      public var buff_size:int = 32;
      
      public var _buffIMage:Image3D;
      
      private var _shoushenTag3D:NameTag3D;
      
      public var _nameTag:NameTag3D;
      
      public var _rankTag3D:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function GPKUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
         this.overMethodEnabled = true;
         this.overMethodColor = 16723968;
         this.useShadow = false;
         this.tag3DBottomBox.showShadow();
         this.tag3DBottomBox.visible = false;
      }
      
      public function playBornEff() : void
      {
         if(!GPKCrossModule.effContainer)
         {
            return;
         }
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         var _loc2_:Vector3D = TransformUtil.stage3Dto2D(this.scenePosition,GPKCrossModule.effContainer);
         _loc1_.x = _loc2_.x - 84;
         _loc1_.y = _loc2_.y - 177;
         _loc1_.init(50200001);
         GPKCrossModule.effContainer.addChild(_loc1_);
      }
      
      public function initByArenaPlayer(param1:FamilyExpeEnemyInfo) : void
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
         var _loc1_:BitmapData = App.asset.getBitmapData("png.uiGuildPKCrossSer.img_cross");
         if(!RIPImg)
         {
            RIPImg = new Image3D(null,_loc1_.width,_loc1_.height,0);
            RIPImg.showByBmd(_loc1_);
         }
         RIPImg.visible = true;
         RIPImg.y = 60;
         this.tag3DBottomBox.boxIngoreRoScale.addChild(RIPImg);
         RIPImg.mouseEnabled = true;
         this.box3D2.visible = false;
         overMethodEnabled = false;
      }
      
      private function changeView(param1:FamilyExpeEnemyInfo) : void
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
         this.showHpBar(param1.hpPercent / 100);
         this.showJiFen(LocaleMgr.ins.getStr(30610217,[param1.coin,param1.con]));
         if(_shoushenTag3D)
         {
            _shoushenTag3D.dispose();
            _shoushenTag3D = null;
         }
         if(_buffIMage)
         {
            _buffIMage.dispose();
            _buffIMage = null;
         }
         if(!StringUtils.isNull(param1.firstKillerName))
         {
            this.showShouShen(LocaleMgr.ins.getStr(99900138) + param1.firstKillerName);
            this.showBuffIcon(UrlLib.buffIcon(DefindConsts.FAMILY_EXPE_DEBUFF));
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
         var _loc5_:* = null;
         var _loc7_:ProgressBar = new ProgressBar();
         _loc7_.skin = !!param2?param2:"png.uiGuildPKCrossSer.progress_skill";
         _loc7_.value = param1;
         var _loc6_:Image = new Image();
         _loc6_.skin = "png.uiGuildPKCrossSer.progress_up";
         _loc7_.addChild(_loc6_);
         _loc7_.commitMeasure();
         var _loc3_:BitmapData = new BitmapData(_loc7_.width,_loc7_.height + 4,true,0);
         var _loc4_:Matrix = new Matrix();
         _loc4_.ty = 2;
         _loc3_.draw(_loc7_,_loc4_,null,null,null,false);
         if(param1 > 0)
         {
            _loc4_ = new Matrix();
            _loc4_.ty = -2;
            _loc5_ = new Label();
            _loc5_.width = _loc7_.width;
            _loc5_.align = "center";
            _loc5_.text = int(param1 * 100) + "%";
            if(param1 >= 0.5)
            {
               _loc5_.color = 458496;
            }
            else if(param1 >= 0.25)
            {
               _loc5_.color = 16773888;
            }
            else
            {
               _loc5_.color = 16723968;
            }
            _loc5_.size = 12;
            _loc5_.commitMeasure();
            _loc3_.draw(_loc5_,_loc4_,null,null,null,false);
         }
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
            _jiFenTag3D = new NameTag3D(250);
            _jiFenTag3D.renderLayer = Entity.TOP_LAYER;
            this.tag3DVBox.addChild(_jiFenTag3D);
         }
         _jiFenTag3D.setText(param1);
         _jiFenTag3D.drawBitmap();
      }
      
      public function showBuffIcon(param1:String = null) : void
      {
         $skin = param1;
         onImageLoaded = function(param1:String, param2:BitmapData):void
         {
            var _loc3_:int = 0;
            if(_buffIMage == null)
            {
               _buffIMage = new Image3D(null,buff_size,buff_size,0);
               _buffIMage.renderLayer = Entity.TOP_LAYER;
               _buffIMage.mousePriority = 4;
               _buffIMage.addEventListener("mouseOver3d",_buffIcon_OVER);
               _buffIMage.addEventListener("mouseOut3d",_buffIcon_OUT);
               _buffIMage.mouseEnabled = true;
               _loc3_ = !!hasHorse?24:0;
               _buffIMage.y = 40 + _loc3_;
               _buffIMage.x = -80;
            }
            tag3DVBox.boxIngoreRoScale.addChild(_buffIMage);
            _buffIMage.showByBmd(param2);
         };
         if(App.asset.hasBitmapData($skin))
         {
            var bitmapData:BitmapData = App.asset.getBitmapData($skin);
            onImageLoaded($skin,bitmapData);
         }
         else
         {
            ResMgr.ins.load(1,$skin,onImageLoaded);
         }
      }
      
      protected function _buffIcon_OUT(param1:MouseEvent3D) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      protected function _buffIcon_OVER(param1:MouseEvent3D) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_show",LocaleMgr.ins.getStr(50700003));
      }
      
      public function showShouShen(param1:String) : void
      {
         if(_shoushenTag3D == null)
         {
            _shoushenTag3D = new NameTag3D();
            _shoushenTag3D.renderLayer = Entity.TOP_LAYER;
            this.tag3DVBox.addChild(_shoushenTag3D);
         }
         _shoushenTag3D.setText(param1);
         _shoushenTag3D.drawBitmap();
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
         if(_shoushenTag3D)
         {
            _shoushenTag3D.y = 40 + _loc2_;
         }
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
         if(_shoushenTag3D)
         {
            _shoushenTag3D.dispose();
            _shoushenTag3D = null;
         }
         if(_buffIMage)
         {
            _buffIMage.dispose();
            _buffIMage = null;
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
