package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import com.mz.core.interFace.IObserver;
   import com.greensock.TweenLite;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   import nslm2.common.scene.multiLayer.scripts.BgScriptBase;
   import nslm2.common.scene.multiLayer.configs.BgScriptVo;
   import nslm2.common.scene.multiLayer.BgLayer;
   import away3d.core.base.Object3D;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.RTools;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   
   public class MapEffect_Eff3D extends BgLayerCtrlBase implements IObserver
   {
       
      
      public var eff:SpecterEffect;
      
      public var bgScripts:Vector.<BgScriptBase>;
      
      private var _isPausing:Boolean;
      
      public function MapEffect_Eff3D(param1:BgLayer)
      {
         bgScripts = new Vector.<BgScriptBase>();
         super(param1,null);
         this.bgLayer.visible = SettingModel.ins.sceneSpecEffect == 0;
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(configVo.effId)).addCompleteHandler(loadCpl).exec();
         ObserverMgr.ins.regObserver(this);
      }
      
      private function loadCpl() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(configVo.startDelay > 0)
         {
            TweenLite.delayedCall(configVo.startDelay / 1000,playEff);
         }
         else
         {
            playEff();
         }
      }
      
      private function playEff() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(eff)
         {
            eff.dispose();
         }
         eff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(configVo.effId),true,null,null,0,true,1);
         eff.renderLayer = configVo.renderLayer;
         BgTransfrom3DVo.setTransfrom(eff,this.configVo.transfrom3D);
         this.bgLayer.childParent.addChild(eff);
         if(isPausing)
         {
            eff.playSpeed = 0;
         }
         if(configVo.loopDelay)
         {
            TweenLite.delayedCall(configVo.loopDelay / 1000,playEff);
         }
         addScripts(bgLayer.configVo.effect.scripts,bgLayer,eff);
      }
      
      private function addScripts(param1:Vector.<BgScriptVo>, param2:BgLayer, param3:Object3D) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            _loc5_ = param1.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc6_ = param1[_loc7_];
               _loc4_ = DungeonMultilayerBg.getScriptsById(_loc6_.id);
               if(_loc4_)
               {
                  _loc4_.init(_loc6_,param2,param3);
                  this.bgScripts.push(_loc4_);
                  _loc4_.start();
               }
               _loc4_ = null;
               _loc7_++;
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["settingNoticeSceneSpecialEffOnOff"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("settingNoticeSceneSpecialEffOnOff" === _loc3_)
         {
            this.bgLayer.visible = SettingModel.ins.sceneSpecEffect == 0;
         }
      }
      
      public function get isPausing() : Boolean
      {
         return _isPausing;
      }
      
      public function set isPausing(param1:Boolean) : void
      {
         _isPausing = param1;
         if(eff)
         {
            eff.playSpeed = !!param1?0:Number(this.configVo.playSpeed / 100);
         }
      }
      
      override public function dispose() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
         ObserverMgr.ins.unregObserver(this);
         RTools.disposeArrOrVector(bgScripts);
         bgScripts = null;
         TweenLite.killDelayedCallsTo(this.playEff);
         super.dispose();
      }
   }
}
