package nslm2.modules.foundations.worldMap
{
   import game.ui.worldMap.WorldMapUI;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.scenes.commons.UIImage3D;
   import morn.core.components.Image;
   import nslm2.utils.TransformUtil;
   import flash.display.Sprite;
   import morn.core.handlers.Handler;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.MouseIconManager;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.mainCities.MainCityModuleParam;
   import proto.HeroInfo;
   
   public class WorldMapModule extends WorldMapUI
   {
      
      private static const MAP_COUNT:int = 5;
      
      private static const mapID:Array = [10000,10001];
       
      
      private var panel3D:UIPanel3D;
      
      private var avatar:Unit3DBase;
      
      private var mapObjectArr:Array;
      
      private var mapPos:Array;
      
      private var openedMapId:Array;
      
      private var openedMapIndex:Array;
      
      private var mapPieces:Array;
      
      private var crtIndex:int;
      
      public function WorldMapModule()
      {
         mapPos = [new Point(-276,-122),new Point(-234,96)];
         openedMapId = [];
         openedMapIndex = [];
         mapPieces = [];
         super();
         img_lock.mouseEnabled = true;
         img_lock.toolTip = LocaleMgr.ins.getStr(999000386);
         txt_openTxt_1.text = LocaleMgr.ins.getStr(999000386);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = mapID;
         for each(var _loc2_ in mapID)
         {
            if(checkIsOpen(_loc2_))
            {
               openedMapId.push(_loc2_);
            }
         }
         if(checkIsOpen(10001))
         {
            img_lock.visible = false;
            txt_openTxt_1.visible = false;
         }
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9740400);
         panelBg.bgCustom.addChild(img_bg);
         updateOpenedMapIndex();
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(this.img_bg,this.panelBg);
         panel3D.visible = false;
         avatar = new WorldMapUnit3D();
         panel3D.addChild3D(avatar);
         this.createAvatar3D(PlayerModel.ins.playerInfo.playerHero);
         this.visible = false;
         _loc5_ = 0;
         while(_loc5_ < 5)
         {
            _loc4_ = new UIImage3D();
            _loc3_ = this["map_" + _loc5_] as Image;
            _loc3_.disabled = true;
            _loc4_.initByImg(_loc3_);
            _loc4_.name = "map" + _loc5_;
            panel3D.addChild3D(_loc4_);
            _loc4_.position = TransformUtil.uiPanel2dTo3d(panel3D,_loc3_.x - 5 + _loc3_.width / 2,_loc3_.y - 23 + _loc3_.height / 2);
            if(this.hasOwnProperty("txt_cityName_" + _loc5_))
            {
               (this["txt_cityName_" + _loc5_] as Sprite).addEventListener("click",txt_cityName_onClick);
            }
            _loc4_.clickHandler = new Handler(mapClickHandler,[_loc5_]);
            _loc4_.overHandler = new Handler(mapPieceOverHandler);
            _loc4_.outHandler = new Handler(mapPieceOutHandler);
            if(openedMapIndex.indexOf(_loc5_) >= 0)
            {
               _loc4_.switchEventListener(true);
            }
            else
            {
               _loc4_.switchEventListener(false);
               _loc4_.disable = true;
            }
            _loc3_.visible = false;
            mapPieces.push(_loc4_);
            _loc5_++;
         }
         this.preShowCpl();
      }
      
      private function checkIsOpen(param1:int) : Boolean
      {
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(!_loc2_.prev_stage_id)
         {
            return true;
         }
         if(ChapterModel.ins.getStageInfoStar(_loc2_.prev_stage_id))
         {
            return true;
         }
         return false;
      }
      
      private function mapPieceOverHandler() : void
      {
         MouseIconManager.changeMouseCursor("button");
      }
      
      private function mapPieceOutHandler() : void
      {
         MouseIconManager.changeMouseCursor("auto");
      }
      
      private function txt_cityName_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget;
         if(this.txt_cityName_0 !== _loc2_)
         {
            if(this.txt_cityName_1 === _loc2_)
            {
               this.mapClickHandler(1);
            }
         }
         else
         {
            this.mapClickHandler(0);
         }
      }
      
      public function mapClickHandler(param1:*) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(img_lock.visible)
         {
            return;
         }
         if(crtIndex != param1)
         {
            _loc3_ = mapPos[param1];
            _loc2_ = mapID[param1];
            crtIndex = param1;
            avatar.runTo(_loc3_.x,_loc3_.y,new Handler(changeCity,[_loc2_]));
         }
      }
      
      private function changeCity(param1:int) : void
      {
         ModuleMgr.ins.showModule(40500,new MainCityModuleParam(param1));
      }
      
      private function updateOpenedMapIndex() : void
      {
         openedMapIndex = [];
         var _loc3_:int = 0;
         var _loc2_:* = openedMapId;
         for each(var _loc1_ in openedMapId)
         {
            openedMapIndex.push(mapID.indexOf(_loc1_));
         }
      }
      
      private function getCrtCityMapIndex() : int
      {
         return mapID.indexOf(PlayerModel.ins.currentCity);
      }
      
      private function createAvatar3D(param1:HeroInfo) : void
      {
         if(this.avatar)
         {
            this.avatar.visible = true;
            this.avatar.initByStcNpcId(param1.baseInfo.baseId,false,param1.baseInfo.skin);
            crtIndex = getCrtCityMapIndex();
            this.avatar.pos2d = mapPos[crtIndex];
            this.avatar.scaleAll = 0.8;
            this.avatar.rotation = -90;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.avatar.dispose();
         this.avatar = null;
         this.panel3D.dispose();
         this.panel3D = null;
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         panel3D.visible = true;
         super.show(param1);
      }
   }
}
