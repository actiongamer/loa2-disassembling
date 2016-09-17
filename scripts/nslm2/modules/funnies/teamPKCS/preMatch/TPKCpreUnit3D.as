package nslm2.modules.funnies.teamPKCS.preMatch
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.display.Sprite;
   import proto.PlayerBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.UIMgr;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.display.particle.SpecterEffect;
   import away3d.events.AnimatorEvent;
   import com.game.shared.component.NameTag3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import away3d.entities.Entity;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import morn.core.utils.BitmapUtils;
   import morn.core.components.Image;
   import flash.geom.Point;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.battle.text.TextView;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import nslm2.modules.battles.battle.text.TextAniQueue;
   import flash.display.DisplayObjectContainer;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import flash.events.Event;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   
   public class TPKCpreUnit3D extends Unit3DBase
   {
       
      
      public var parent2D:Sprite;
      
      public var isSelf:Boolean;
      
      public var maxHp:Number = 0;
      
      public var currHp:Number = 0;
      
      public var winTimes:int = 0;
      
      public var arenaPlayer:PlayerBaseInfo;
      
      private var _shoushenTag3D:NameTag3D;
      
      public var _hpBarImage3D:Image3D;
      
      public var _nameTag:NameTag3D;
      
      public var _indexTag3D:NameTag3D;
      
      public var index:int;
      
      private var _oriPos:Point;
      
      private var _textAniQueue:TextAniQueue;
      
      public var _fightTag3D:NameTag3D;
      
      public function TPKCpreUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
         this.overMethodEnabled = true;
         this.overMethodColor = 16723968;
         this.useShadow = false;
         this.tag3DBottomBox.showShadow();
         this.tag3DBottomBox.visible = true;
      }
      
      override protected function validateMouseEvent() : void
      {
      }
      
      public function initByArenaPlayer(param1:PlayerBaseInfo) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.npcId);
         if(arenaPlayer == null)
         {
            this.arenaPlayer = param1;
         }
         if(_loc2_)
         {
            if(_nameTag && Uint64Util.equal(this.arenaPlayer.id,param1.id) == false)
            {
               TweenLite.to(_nameTag,0.5,{"alpha":0});
            }
            if(_fightTag3D && Uint64Util.equal(this.arenaPlayer.id,param1.id) == false)
            {
               TweenLite.to(_fightTag3D,0.5,{"alpha":0});
            }
            if(Uint64Util.equal(this.arenaPlayer.id,param1.id) == false)
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
            Log.fatal(this,"缺少stcNpcId",param1.npcId,param1);
         }
      }
      
      public function playerHurtEffect() : void
      {
         var _loc1_:* = null;
         var _loc2_:ObjectContainer3D = UIMgr.root3D;
         var _loc3_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(95010);
         _loc1_ = EffectManager.createEffect(UrlLib.e3d_particle(_loc3_.effect),true,_loc2_,null,_loc3_.over_time,true,1,"default_group");
         _loc1_.position = avatar.scenePosition;
         _loc1_.y = _loc1_.y + 100;
         _loc1_.scaleAll = 2;
      }
      
      override public function set action(param1:String) : void
      {
         .super.action = param1;
         avatar.addEventListener("animator_complete",onActionComplete);
      }
      
      private function onActionComplete(param1:AnimatorEvent) : void
      {
         e = param1;
         avatar.removeEventListener("animator_complete",onActionComplete);
         if(action == "dead")
         {
            onFadeUpdte = function():void
            {
               if(tag3DBottomBox.shadowTag3D)
               {
                  tag3DBottomBox.shadowTag3D.alpha = avatar.alpha;
               }
            };
            onBodyFade = function():void
            {
               avatar.alpha = 1;
               avatar.visible = false;
               if(tag3DBottomBox.shadowTag3D)
               {
                  tag3DBottomBox.shadowTag3D.alpha = 1;
                  tag3DBottomBox.shadowTag3D.visible = false;
               }
            };
            TweenLite.to(avatar,0.5,{
               "alpha":0,
               "useFrames":false,
               "onUpdate":onFadeUpdte,
               "onComplete":onBodyFade
            });
            if(tag3DVBox)
            {
               tag3DVBox.visible = false;
            }
            return;
         }
         .super.action = "std_3";
      }
      
      public function showShouShen(param1:String, param2:String) : void
      {
         _shoushenTag3D.setText(param1,param2);
         _shoushenTag3D.drawBitmap();
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
         if(_shoushenTag3D == null)
         {
            _shoushenTag3D = new NameTag3D();
            _shoushenTag3D.renderLayer = Entity.TOP_LAYER;
            this.tag3DVBox.addChild(_shoushenTag3D);
            showShouShen("","#32FFFF");
         }
         orderTags();
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
         if(PlayerModel.ins.isCurPlayer(this.arenaPlayer.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         _loc3_.text = LinkUtils.playerNameSmart(this.arenaPlayer.id,param1,this.arenaPlayer.dist,param2);
         _loc3_.commitMeasure();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         _loc4_.draw(_loc3_,null,null,null,null,true);
         _loc4_ = BitmapUtils.transparentCut(_loc4_);
         _nameTag.setBitmapData(_loc4_,true);
         _loc3_.dispose();
      }
      
      public function showIndex(param1:int) : void
      {
         index = param1;
         if(!_indexTag3D)
         {
            _indexTag3D = new NameTag3D();
            tag3DVBox.addChild(_indexTag3D);
         }
         var _loc4_:Image = new Image("png.uiTeamPKCS.img_dot");
         var _loc2_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc2_.draw(_loc4_);
         var _loc3_:Label = new Label();
         _loc3_.width = _loc4_.width;
         _loc3_.align = "center";
         _loc3_.text = param1 + 1 + "";
         _loc3_.commitMeasure();
         _loc2_.draw(_loc3_);
         _indexTag3D.setBitmapData(_loc2_,true);
         _loc3_.dispose();
      }
      
      public function setPos(param1:Point) : void
      {
         _oriPos = param1;
         this.pos2d = param1;
      }
      
      public function changeView(param1:PlayerBaseInfo) : void
      {
         box3D2.visible = true;
         overMethodEnabled = true;
         buttonMode = true;
         this.showName(PlayerModel.ins.getFullNameWithDistName(arenaPlayer,false),ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.militaryRank)));
         this.showFightValue(Uint64Util.toNumber(param1.ability));
         var _loc6_:int = param1.npcId;
         var _loc3_:int = param1.clothes;
         var _loc2_:int = param1.wing;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_loc6_);
         var _loc4_:int = _loc5_.sex;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1,55);
         this.orderTags();
         this.box3D2.scaleAll = 0.9;
         this.avatar.alpha = 0;
         this.visible = true;
         TweenLite.to(_nameTag,0.5,{"alpha":1});
         TweenLite.to(_fightTag3D,0.5,{"alpha":1});
         TweenLite.to(this.avatar,0.5,{"alpha":1});
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
      
      public function removeHpbar() : void
      {
         if(_hpBarImage3D)
         {
            _hpBarImage3D.dispose();
            _hpBarImage3D = null;
         }
      }
      
      public function removeIndex3D() : void
      {
         if(_indexTag3D)
         {
            _indexTag3D.dispose();
            _indexTag3D = null;
         }
      }
      
      public function afterHp(param1:UInt64) : void
      {
         var _loc5_:Number = Uint64Util.toNumber(param1);
         if(isDispose)
         {
            return;
         }
         var _loc3_:Number = currHp - _loc5_;
         if(_loc3_ <= 0)
         {
            return;
         }
         var _loc2_:TextView = new TextView();
         _loc2_.setNum(_loc3_,0);
         var _loc4_:Vector3D = TransformUtil.stage3Dto2D(this.avatar.scenePosition,this.parent2D);
         playTextQueue(_loc2_,parent2D,_loc4_.x,_loc4_.y - 50,false);
         playerHurtEffect();
         currHp = _loc5_;
         showHpBar(currHp / maxHp);
      }
      
      private function playTextQueue(param1:TextView, param2:DisplayObjectContainer, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         if(!_textAniQueue)
         {
            _textAniQueue = new TextAniQueue();
         }
         _textAniQueue.play(param1,param2,param3,param4,param5);
      }
      
      private function orderTags(param1:Boolean = false) : void
      {
         var _loc2_:int = !!param1?24:0;
         if(_shoushenTag3D)
         {
            _shoushenTag3D.y = 44 + _loc2_;
         }
         if(_indexTag3D)
         {
            _indexTag3D.y = 36 + _loc2_;
         }
         if(_hpBarImage3D)
         {
            _hpBarImage3D.y = 36 + _loc2_;
         }
         _nameTag.y = 17 + _loc2_;
         _fightTag3D.y = 0 + _loc2_;
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
         _loc2_.playerId = this.arenaPlayer.id;
         _loc2_.disID = this.arenaPlayer.dist;
         _loc2_.name = this.arenaPlayer.name;
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(117,_loc2_));
      }
      
      override public function dispose() : void
      {
         if(_shoushenTag3D)
         {
            _shoushenTag3D.dispose();
            _shoushenTag3D = null;
         }
         removeHpbar();
         removeIndex3D();
         _textAniQueue = null;
         parent2D = null;
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
      
      public function resetPos() : void
      {
         this.pos2d = _oriPos;
      }
   }
}
