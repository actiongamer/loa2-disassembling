package nslm2.modules.footstones.moduleBases
{
   import morn.core.components.Component;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.Sprite;
   import morn.core.components.VBox;
   import morn.customs.components.ModuleViewBase;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.geom.Point;
   import nslm2.common.uiEffects.FlyTarget;
   import flash.display.DisplayObject;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.BitmapData;
   import com.mz.core.components.comp2d.BlackRim;
   import com.mz.core.mediators.DragTargetMediator;
   import com.mz.debug.FPSView;
   
   public class ModuleMgr
   {
      
      private static var _ins:nslm2.modules.footstones.moduleBases.ModuleMgr;
       
      
      public var dramaLayer:Component;
      
      private var layerLib:Array;
      
      public var topEffectLayer:Sprite;
      
      public var debugBox:VBox;
      
      private var configLib:Object;
      
      private var guildFunnyIdArr:Array;
      
      public function ModuleMgr()
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         layerLib = [];
         debugBox = new VBox();
         configLib = {};
         guildFunnyIdArr = [40720,40740];
         super();
         addLayer(1,new SceneModuleLayer());
         UIMgr.layer2D.addChild(new FakeSceneLayer());
         addLayer(2,new StaticModuleLayer());
         _loc2_ = new BlackRim();
         this.staticLayer.maskHole = new BlackRim();
         _loc2_.mouseChildren = false;
         _loc2_.mouseEnabled = false;
         _loc2_.visible = false;
         UIMgr.layer2D.addChild(_loc2_);
         addLayer(3,new PopModuleLayer());
         addLayer(4,new TopModuleLayer());
         topEffectLayer = new Sprite();
         UIMgr.layer2D.addChild(topEffectLayer);
         UIMgr.layer2D.addChild(debugBox);
         _loc1_ = new DragTargetMediator(debugBox,UIMgr.stage);
         debugBox.parts.push(new DragTargetMediator(debugBox,UIMgr.stage));
         _loc1_.useAlt = true;
         topEffectLayer.mouseChildren = false;
         topEffectLayer.mouseEnabled = false;
         if(EnvConfig.ins.showCPUStatus)
         {
            topEffectLayer.addChild(new FPSView());
         }
      }
      
      public static function get ins() : nslm2.modules.footstones.moduleBases.ModuleMgr
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.moduleBases.ModuleMgr();
         }
         return _ins;
      }
      
      private function addLayer(param1:int, param2:ModuleLayerBase) : void
      {
         layerLib[param1] = param2;
         UIMgr.layer2D.addChild(param2);
      }
      
      public function getLayer(param1:int) : ModuleLayerBase
      {
         return layerLib[param1];
      }
      
      public function get sceneLayer() : SceneModuleLayer
      {
         return getLayer(1) as SceneModuleLayer;
      }
      
      public function get staticLayer() : StaticModuleLayer
      {
         return getLayer(2) as StaticModuleLayer;
      }
      
      public function get popLayer() : PopModuleLayer
      {
         return getLayer(3) as PopModuleLayer;
      }
      
      public function get topLayer() : TopModuleLayer
      {
         return getLayer(4) as TopModuleLayer;
      }
      
      public function getConfigVo(param1:int) : ModuleConfigVo
      {
         return configLib[param1] as ModuleConfigVo;
      }
      
      public function regModule(param1:ModuleConfigVo) : void
      {
         if(!this.configLib.hasOwnProperty(param1.moduleId))
         {
            this.configLib[param1.moduleId] = param1;
         }
      }
      
      public function isShow(param1:int) : Boolean
      {
         var _loc2_:ModuleConfigVo = getConfigVo(param1);
         if(_loc2_)
         {
            return this.getLayer(_loc2_.layerKind).isShow(param1);
         }
         new LackModuleIdFatal(this,param1);
         return false;
      }
      
      public function getModule(param1:int) : ModuleViewBase
      {
         var _loc2_:ModuleConfigVo = getConfigVo(param1);
         if(_loc2_)
         {
            return this.getLayer(_loc2_.layerKind).getModule(param1);
         }
         new LackModuleIdFatal(this,param1);
         return null;
      }
      
      public function showModule(param1:int, param2:Object = null, param3:int = 0) : void
      {
         if(EnvConfig.ins.showDevModule == false && ModuleConsts.MODULE_BLOCK_ARR.indexOf(param1) != -1)
         {
            AlertUtil.floadNoOpenModule();
            return;
         }
         var _loc4_:ModuleConfigVo = getConfigVo(param1);
         if(_loc4_)
         {
            if(guildFunnyIdArr.indexOf(param1) != -1)
            {
               if(Uint64Util.isZero(PlayerModel.ins.playerInfo.familyId))
               {
                  nslm2.modules.footstones.moduleBases.ModuleMgr.ins.showModule(40700,null,nslm2.modules.footstones.moduleBases.ModuleMgr.ins.popLayer.curModuleId);
                  AlertUtil.float(LocaleMgr.ins.getStr(999000115));
                  return;
               }
            }
            this.getLayer(_loc4_.layerKind).showModule(param1,param2,param3);
         }
         else
         {
            new LackModuleIdFatal(this,param1);
         }
      }
      
      public function closeModule(param1:int, param2:Object = null) : void
      {
         var _loc3_:ModuleConfigVo = getConfigVo(param1);
         if(_loc3_)
         {
            this.getLayer(_loc3_.layerKind).closeModule(param1,param2);
         }
         else
         {
            new LackModuleIdFatal(this,param1);
         }
      }
      
      public function showOrCloseModule(param1:int, param2:Object = null, param3:int = 0) : void
      {
         if(EnvConfig.ins.showDevModule == false && ModuleConsts.MODULE_BLOCK_ARR.indexOf(param1) != -1)
         {
            AlertUtil.floadNoOpenModule();
            return;
         }
         var _loc4_:ModuleConfigVo = getConfigVo(param1);
         if(_loc4_)
         {
            this.getLayer(_loc4_.layerKind).showOrCloseModule(param1,param2,param3);
         }
         else
         {
            new LackModuleIdFatal(this,param1);
         }
      }
      
      public function toGlobalPoi(param1:*) : Point
      {
         try
         {
            if(!param1)
            {
               var _loc3_:* = null;
               return _loc3_;
            }
            if(param1 is FlyTarget)
            {
               var _loc4_:* = toGlobalPoi((param1 as FlyTarget).target).add((param1 as FlyTarget).offset);
               return _loc4_;
            }
            if(param1 is DisplayObject)
            {
               var _loc5_:* = DisplayUtils.localToTarget(param1 as DisplayObject,this.topEffectLayer);
               return _loc5_;
            }
            var _loc6_:* = this.topEffectLayer.globalToLocal(param1 as Point);
            return _loc6_;
            return;
         }
         catch($err:Error)
         {
            var _loc7_:* = new Point(0,0);
            return _loc7_;
         }
      }
      
      public function getLayerDrawBmd(param1:int) : BitmapData
      {
         var _loc2_:BitmapData = new BitmapData(UIMgr.gameWidth,UIMgr.gameHeight,true,0);
         _loc2_.draw(nslm2.modules.footstones.moduleBases.ModuleMgr.ins.getLayer(param1));
         return _loc2_;
      }
   }
}
