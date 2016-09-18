package nslm2.modules.funnies.arenas.mains
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IDispose;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.ArenaService;
   import org.specter3d.display.Specter3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import proto.ArenaPlayer;
   import nslm2.utils.TransformUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import away3d.entities.Entity;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.arenas.ArenaConsts;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.utils.RTools;
   import com.mz.core.mgrs.UIMgr;
   
   public class ArenaScene3D extends Sprite implements IDispose
   {
      
      public static const EVT_CHALLENGE:String = "EVT_CHALLENGE";
       
      
      public var say:nslm2.modules.funnies.arenas.mains.ArenaUnitSay;
      
      public var layer3D:Specter3D;
      
      public var bg3d:Image3D;
      
      public var player3D:nslm2.modules.funnies.arenas.mains.ArenaUnit3D;
      
      public var unit3DArr:Vector.<nslm2.modules.funnies.arenas.mains.ArenaUnit3D>;
      
      private var crtPlayer:ArenaPlayer;
      
      private var _firstShowed:Boolean;
      
      public var isDispose:Boolean = false;
      
      public function ArenaScene3D()
      {
         say = new nslm2.modules.funnies.arenas.mains.ArenaUnitSay();
         layer3D = new Specter3D();
         unit3DArr = new Vector.<nslm2.modules.funnies.arenas.mains.ArenaUnit3D>();
         super();
         UIMgr.root3D.addChild(layer3D);
         this.addChild(say);
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      public function init() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         TransformUtil.cameraToSceneBattle();
         bg3d = new Image3D(UrlLib.getArenaBg("latter.jpg"),1550,950,2000);
         bg3d.renderLayer = Entity.MAP_TILE_LAYER;
         layer3D.addChild(bg3d);
         var _loc2_:int = 9;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new nslm2.modules.funnies.arenas.mains.ArenaUnit3D(layer3D);
            _loc1_.say = this.say;
            layer3D.addChild(_loc1_);
            _loc1_.addEventListener("unitMouseClick",unit_clickHandler);
            _loc1_.addEventListener("unitMouseOver",playerMouseOver);
            _loc1_.addEventListener("unitMouseOut",playerMouseOut);
            unit3DArr.push(_loc1_);
            _loc3_++;
         }
         player3D = new nslm2.modules.funnies.arenas.mains.ArenaUnit3D(this.layer3D);
         player3D.overMethodEnabled = false;
         player3D.buttonMode = false;
         PlayerModel.ins.changePlayerViewByPlayerInfo(player3D,PlayerModel.ins.playerInfo);
         if(HorseService.ins.curHorseId)
         {
            player3D.initStcHorseId(HorseService.ins.curHorseId);
         }
         resetPos();
      }
      
      protected function playerMouseOut(param1:Event) : void
      {
         crtPlayer = null;
      }
      
      protected function playerMouseOver(param1:Event) : void
      {
         crtPlayer = (param1.currentTarget as nslm2.modules.funnies.arenas.mains.ArenaUnit3D).arenaPlayer;
      }
      
      private function fightBtnClickHandler() : void
      {
         if(crtPlayer)
         {
            this.dispatchEvent(new MzEvent("EVT_CHALLENGE",crtPlayer));
         }
      }
      
      private function fightBtn5ClickHandler() : void
      {
         if(ArenaService.ins.infoRes.residualTimes < 5)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000395));
            return;
         }
         if(crtPlayer)
         {
            ArenaService.ins.requestMultiChallenge(crtPlayer.playerInfo.id,crtPlayer.rank,5);
         }
      }
      
      public function findUnit3D(param1:UInt64) : nslm2.modules.funnies.arenas.mains.ArenaUnit3D
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = this.unit3DArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.unit3DArr[_loc4_];
            if(_loc3_.arenaPlayer && Uint64Util.equal(_loc3_.arenaPlayer.playerInfo.id,param1))
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function resetPos() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.unit3DArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = unit3DArr[_loc3_];
            _loc1_.pos2d = ArenaConsts.ins.unit3DConfigVoArr[_loc3_].pos.clone();
            _loc1_.box3D2.scaleAll = ArenaConsts.ins.unit3DConfigVoArr[_loc3_].scale;
            _loc1_.rotationY = ArenaConsts.ins.unit3DConfigVoArr[_loc3_].roY;
            _loc3_++;
         }
         player3D.pos2d = ArenaConsts.ins.player3DConfigVo.pos.clone();
         player3D.box3D2.scaleAll = ArenaConsts.ins.player3DConfigVo.scale;
         player3D.rotationY = ArenaConsts.ins.player3DConfigVo.roY;
      }
      
      public function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = Math.min(this.unit3DArr.length,infoRes.arenaPlayers.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.unit3DArr[_loc3_].initByArenaPlayer(infoRes.arenaPlayers[_loc3_]);
            this.unit3DArr[_loc3_].visible = true;
            if((infoRes.arenaPlayers[_loc3_] as ArenaPlayer).rank > 3 && _firstShowed == true)
            {
               _loc1_ = new BmcSpriteSheet();
               _loc1_.x = this.unit3DArr[_loc3_].x + this.bg3d.width / 2 - 81;
               _loc1_.y = -this.unit3DArr[_loc3_].y + 273;
               _loc1_.init(50200001);
               this.addChild(_loc1_);
            }
            _loc3_++;
         }
         _loc2_ = this.unit3DArr.length;
         while(_loc3_ < _loc2_)
         {
            this.unit3DArr[_loc3_].visible = false;
            _loc3_++;
         }
         _firstShowed = true;
      }
      
      private function unit_clickHandler(param1:Event) : void
      {
         var _loc2_:ArenaPlayer = (param1.currentTarget as nslm2.modules.funnies.arenas.mains.ArenaUnit3D).arenaPlayer;
         if(_loc2_)
         {
            this.dispatchEvent(new MzEvent("EVT_CHALLENGE",_loc2_));
         }
      }
      
      public function dispose() : void
      {
         isDispose = true;
         if(this.say)
         {
            this.say.dispose();
            this.say = null;
         }
         if(player3D)
         {
            player3D.dispose();
            player3D = null;
         }
         DisplayUtils.removeSelf(this);
         if(this.layer3D)
         {
            this.layer3D.dispose();
            this.layer3D = null;
         }
         if(this.bg3d)
         {
            this.bg3d.dispose();
            this.bg3d = null;
         }
         RTools.disposeArrOrVector(this.unit3DArr);
      }
   }
}
