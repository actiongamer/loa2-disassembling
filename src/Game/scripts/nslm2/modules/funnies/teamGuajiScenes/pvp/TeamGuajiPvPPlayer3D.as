package nslm2.modules.funnies.teamGuajiScenes.pvp
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.common.vo.PlayerVo;
   import proto.PlayerBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.logging.Log;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.Uint64Util;
   import com.greensock.TweenLite;
   import com.game.shared.component.NameTag3D;
   import away3d.entities.Entity;
   import morn.core.components.Label;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import nslm2.mgrs.MouseIconManager;
   import away3d.containers.ObjectContainer3D;
   
   public class TeamGuajiPvPPlayer3D extends Unit3DBase
   {
       
      
      public var playerVo:PlayerVo;
      
      public var pvpPlayer:PlayerBaseInfo;
      
      public var _nameTag:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function TeamGuajiPvPPlayer3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = true;
      }
      
      public function initByPlayerInfo(param1:PlayerBaseInfo) : void
      {
         this.pvpPlayer = param1;
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.npcId);
         if(_loc2_)
         {
            if(this.avatar == null)
            {
               changeView(param1);
            }
         }
         else
         {
            Log.fatal(this,"缺少stcNpcId",param1.npcId,param1);
         }
      }
      
      private function changeView(param1:PlayerBaseInfo) : void
      {
         this.visible = false;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1);
         this.showName(param1.name,ColorLib.getMilitaryColor(param1.militaryRank));
         this.showFightValue(Uint64Util.toNumber(param1.ability));
         this.avatar.alpha = 0;
         this.visible = true;
         TweenLite.to(_nameTag,0.2,{"alpha":1});
         TweenLite.to(_fightTag3D,0.2,{"alpha":1});
         TweenLite.to(this.avatar,0.2,{"alpha":1});
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
      
      public function showName(param1:String, param2:uint) : void
      {
         if(_nameTag == null)
         {
            _nameTag = new NameTag3D();
            tag3DVBox.addChild(_nameTag);
            _nameTag.renderLayer = Entity.TOP_LAYER;
            _nameTag.y = 10;
            _nameTag.addEventListener("mouseDown3d",_nameTag_mouse);
         }
         if(PlayerModel.ins.isCurPlayer(this.pvpPlayer.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         _loc3_.text = LinkUtils.playerNameSmart(this.pvpPlayer.id,PlayerModel.ins.getFullNameWithDistName(this.pvpPlayer,false,false),this.pvpPlayer.dist,param2);
         _loc3_.commitMeasure();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         _loc4_.draw(_loc3_,null,null,null,null,true);
         _loc4_ = BitmapUtils.transparentCut(_loc4_);
         _nameTag.setBitmapData(_loc4_,true);
      }
      
      private function _nameTag_mouse(param1:Event) : void
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = this.pvpPlayer.id;
         _loc2_.name = this.pvpPlayer.name;
         _loc2_.disID = this.pvpPlayer.dist;
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(102,_loc2_));
      }
      
      public function showFightValue(param1:Number) : void
      {
         if(_fightTag3D == null)
         {
            _fightTag3D = new NameTag3D();
            _fightTag3D.y = -12;
            tag3DVBox.addChild(_fightTag3D);
            _fightTag3D.renderLayer = Entity.TOP_LAYER;
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
      
      override protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      override protected function setMouseCursorOut() : void
      {
         super.setMouseCursorOut();
      }
      
      public function die() : void
      {
         avatar.visible = false;
      }
   }
}
