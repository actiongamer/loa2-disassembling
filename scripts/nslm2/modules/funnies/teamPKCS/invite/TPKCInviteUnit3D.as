package nslm2.modules.funnies.teamPKCS.invite
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import proto.TeamMemberState;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import proto.CTeamMemberInfo;
   import com.game.shared.component.NameTag3D;
   import proto.PlayerBaseInfo;
   import away3d.entities.Entity;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Label;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import morn.core.components.Image;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import flash.events.Event;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import away3d.containers.ObjectContainer3D;
   
   public class TPKCInviteUnit3D extends Unit3DBase
   {
       
      
      public var arenaPlayer:TeamMemberState;
      
      public var _nameTag:NameTag3D;
      
      private var _baseInfo:PlayerBaseInfo;
      
      public var _buffIMage:Image3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function TPKCInviteUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
         this.overMethodEnabled = true;
         this.overMethodColor = 16723968;
         this.useShadow = false;
         this.tag3DBottomBox.showShadow();
         this.tag3DBottomBox.visible = true;
      }
      
      public function initByArenaPlayer(param1:TeamMemberState) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.mem.player.npcId);
         if(arenaPlayer == null)
         {
            this.arenaPlayer = param1;
         }
         if(_loc2_)
         {
            if(_nameTag && Uint64Util.equal(this.arenaPlayer.mem.player.id,param1.mem.player.id) == false)
            {
               TweenLite.to(_nameTag,0.5,{"alpha":0});
            }
            if(_fightTag3D && Uint64Util.equal(this.arenaPlayer.mem.player.id,param1.mem.player.id) == false)
            {
               TweenLite.to(_fightTag3D,0.5,{"alpha":0});
            }
            if(Uint64Util.equal(this.arenaPlayer.mem.player.id,param1.mem.player.id) == false)
            {
               this.mouseEnabled = false;
               this.mouseChildren = false;
               setMouseCursorOut();
               if(avatar)
               {
                  TweenLite.to(this.avatar,0.5,{
                     "alpha":0,
                     "onComplete":changeView,
                     "onCompleteParams":[param1.mem.player]
                  });
               }
               else
               {
                  changeView(param1.mem.player);
               }
            }
            else
            {
               changeView(param1.mem.player);
            }
            showReadyIcon(param1.ready);
            this.arenaPlayer = param1;
            this.tag3DBottomBox.visible = true;
         }
         else
         {
            Log.fatal(this,"缺少stcNpcId",param1.mem.player.npcId,param1);
         }
      }
      
      public function initSignUpPlayer(param1:CTeamMemberInfo) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.info.npcId);
         if(_loc2_)
         {
            changeView(param1.info);
            this.tag3DBottomBox.visible = true;
         }
      }
      
      public function showName(param1:String, param2:uint, param3:PlayerBaseInfo) : void
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
         if(PlayerModel.ins.isCurPlayer(param3.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc4_:Label = new Label();
         _loc4_.color = param2;
         _loc4_.text = LinkUtils.playerNameSmart(param3.id,param1,param3.dist,param2);
         _loc4_.commitMeasure();
         var _loc5_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_,null,null,null,null,true);
         _loc5_ = BitmapUtils.transparentCut(_loc5_);
         _nameTag.setBitmapData(_loc5_,true);
         _loc4_.dispose();
      }
      
      public function changeView(param1:PlayerBaseInfo) : void
      {
         _baseInfo = param1;
         box3D2.visible = true;
         overMethodEnabled = true;
         buttonMode = true;
         this.showName(PlayerModel.ins.getFullNameWithDistName(param1,false),ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.militaryRank)),param1);
         this.showFightValue(Uint64Util.toNumber(param1.ability));
         var _loc6_:int = param1.npcId;
         var _loc3_:int = param1.clothes;
         var _loc2_:int = param1.wing;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_loc6_);
         var _loc4_:int = _loc5_.sex;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1);
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
      
      public function showReadyIcon(param1:Boolean = false) : void
      {
         value = param1;
         onImageLoaded = function(param1:BitmapData):void
         {
            var _loc2_:int = 0;
            if(_buffIMage == null)
            {
               _buffIMage = new Image3D(null,param1.width,param1.height,0);
               _buffIMage.renderLayer = Entity.TOP_LAYER;
               _loc2_ = !!hasHorse?24:0;
               _buffIMage.y = 40 + _loc2_;
            }
            tag3DVBox.boxIngoreRoScale.addChild(_buffIMage);
            _buffIMage.showByBmd(param1);
         };
         if(value)
         {
            if(!_buffIMage)
            {
               var $skin:String = "png.a5.commonImgs.勾选框-对勾";
               var img:Image = new Image();
               img.skin = $skin;
               var $bmd:BitmapData = new BitmapData(img.width,img.height,true,0);
               $bmd.draw(img,null,null,null,null,true);
               onImageLoaded($bmd);
            }
         }
         else if(_buffIMage)
         {
            _buffIMage.dispose();
            _buffIMage = null;
         }
      }
      
      private function orderTags(param1:Boolean = false) : void
      {
         var _loc2_:int = !!param1?24:0;
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
         if(this._baseInfo)
         {
            _loc2_.playerId = _baseInfo.id;
            _loc2_.disID = _baseInfo.dist;
            _loc2_.name = _baseInfo.name;
         }
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(117,_loc2_));
      }
      
      override public function dispose() : void
      {
         if(_buffIMage)
         {
            _buffIMage.dispose();
            _buffIMage = null;
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
