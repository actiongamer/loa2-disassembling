package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import com.game.shared.component.NameTag3D;
   import away3d.entities.Entity;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Label;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   import flash.events.Event;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import game.ui.arenas.mains.ArenaFightValueTagUI;
   import game.ui.arenas.mains.ArenaRankTagUI;
   import morn.core.components.Component;
   import morn.core.components.Image;
   import proto.PlayerBaseInfo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.utils.Uint64Util;
   import away3d.containers.ObjectContainer3D;
   
   public class WinnerUIUnit3D extends UIUnit3DS2
   {
       
      
      private var _rank:int = 0;
      
      public var _nameTag:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public var _rankTag3D:NameTag3D;
      
      private var _info:PlayerBaseInfo;
      
      public function WinnerUIUnit3D(param1:ObjectContainer3D = null, param2:int = 0)
      {
         super(param1);
         _rank = param2;
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
         if(PlayerModel.ins.isCurPlayer(this._info.id))
         {
            _nameTag.mouseEnabled = false;
         }
         else
         {
            _nameTag.mouseEnabled = true;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         _loc3_.text = LinkUtils.playerNameSmart(this._info.id,param1,this._info.dist,param2);
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
         _loc2_.playerId = this._info.id;
         _loc2_.disID = this._info.dist;
         _loc2_.name = this._info.name;
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLICK",new TipMenuMsg(117,_loc2_));
      }
      
      public function showFightValue(param1:Number) : void
      {
         if(_fightTag3D == null)
         {
            _fightTag3D = new NameTag3D();
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
            _loc5_ = new Image("png.uiPKCrossSer.rank" + param1);
            _loc2_ = _loc5_;
         }
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_,null,null,null,null,true);
         _loc2_.dispose();
         _loc3_ = BitmapUtils.transparentCut(_loc3_);
         _rankTag3D.setBitmapData(_loc3_,true);
      }
      
      public function chgView(param1:PlayerBaseInfo) : void
      {
         _info = param1;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1);
         this.showName(PlayerModel.ins.getFullNameWithDistName(param1,false),ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.militaryRank)));
         this.showFightValue(Uint64Util.toNumber(param1.ability));
         if(_rank > 0)
         {
            this.showRank(_rank);
         }
         updateTabY();
      }
      
      public function updateTabY() : void
      {
         _fightTag3D.y = -12;
         _nameTag.y = 5;
         if(_rankTag3D)
         {
            _rankTag3D.y = 43;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_fightTag3D)
         {
            _fightTag3D.dispose();
         }
         if(_nameTag)
         {
            _nameTag.dispose();
         }
         if(_rankTag3D)
         {
            _rankTag3D.dispose();
         }
      }
   }
}
