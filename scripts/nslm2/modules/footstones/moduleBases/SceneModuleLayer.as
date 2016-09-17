package nslm2.modules.footstones.moduleBases
{
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.mgrs.SoundMgr;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.AssetLib;
   import nslm2.common.ctrls.CountAssetsCtrl;
   import flash.system.System;
   import away3d.core.managers.AGALProgram3DCache;
   import away3d.animators.states.SkeletonClipState;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.utils.RTools;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.configs.EnvConfig;
   
   public class SceneModuleLayer extends ModuleLayerBase
   {
       
      
      protected var historyList:Vector.<nslm2.modules.footstones.moduleBases.HistoryModuleVo>;
      
      public var preCloseId:int;
      
      public function SceneModuleLayer()
      {
         historyList = new Vector.<nslm2.modules.footstones.moduleBases.HistoryModuleVo>();
         super();
      }
      
      public function get curMiv() : ModuleInfoVo
      {
         if(moduleList.length > 0)
         {
            return this.moduleList[0];
         }
         return null;
      }
      
      public function get curModuleId() : int
      {
         return curMiv.moduleId;
      }
      
      override public function showModule(param1:uint, param2:Object = null, param3:int = 0, param4:* = null) : ModuleInfoVo
      {
         var _loc5_:Boolean = false;
         if(param1 == 40201)
         {
            if(UIPanel3D.insArr.length > 0)
            {
               ModuleMgr.ins.popLayer.closeAll();
            }
            else
            {
               ModuleMgr.ins.popLayer.switchVisible("battle_report",false);
               ObserverMgr.ins.sendNotice("battle_report_module_show",true);
               GlobalRef.exitFromBattleReportModule = true;
            }
         }
         else if(GlobalRef.exitFromBattleReportModule == true)
         {
            _loc5_ = true;
            ModuleMgr.ins.popLayer.switchVisible("battle_report",true);
            GlobalRef.exitFromBattleReportModule = false;
         }
         else
         {
            ModuleMgr.ins.popLayer.closeAll();
         }
         GlobalRef.chapterModuleShowAgainVo = null;
         NGUtil.changeScene();
         if(this.curMiv != null)
         {
            this.addHistory(curMiv.moduleId,curMiv.param,!!curMiv.module?curMiv.module.getHistoryParam():null);
            super.closeModuleByInfo(curMiv,param2);
         }
         SoundMgr.ins.closeBack(false);
         AppGlobalContext.stage3d.view3d.disposePool();
         AssetLib.clearAssetLib(CountAssetsCtrl.ins.countPlayerAssets());
         if(System.privateMemory > 800111222)
         {
            AGALProgram3DCache.getInstance(AppGlobalContext.stage3d.view3d.stage3DProxy).clear();
         }
         SkeletonClipState.cleanCacheNodes();
         App.asset.clear();
         ResMgr.ins.clear();
         RTools.gc();
         super.showModule(param1,param2,param3,param4);
         return this.curMiv;
      }
      
      override public function closeModule(param1:uint, param2:Object = null) : void
      {
         preCloseId = param1;
         super.closeModule(param1,param2);
      }
      
      override protected function closeModuleByInfo(param1:ModuleInfoVo, param2:Object) : void
      {
         super.closeModuleByInfo(param1,param2);
         this.back(param1.moduleId);
      }
      
      protected function addHistory(param1:int, param2:Object, param3:*) : void
      {
         if(this.historyList.length > 10)
         {
            this.historyList.shift();
         }
         this.historyList.push(new nslm2.modules.footstones.moduleBases.HistoryModuleVo(param1,param2,param3));
      }
      
      public function back(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(this.historyList.length > 0)
         {
            _loc3_ = this.historyList.splice(this.historyList.length - 1,1)[0];
            _loc2_ = _loc3_.mid;
            if(_loc2_ == param1)
            {
               back(param1);
            }
            else
            {
               this.showModule(_loc2_,_loc3_.param,null,_loc3_.historyParam);
            }
         }
         else if(ClientConfig.firstBattle == 1)
         {
            ClientConfig.firstBattle == 2;
            this.showModule(40310);
         }
         else if(EnvConfig.ins.useServer)
         {
            if(EnvConfig.ins.testAuthor != 993)
            {
               this.showModule(40500);
            }
         }
      }
   }
}
