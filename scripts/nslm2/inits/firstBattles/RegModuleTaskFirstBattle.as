package nslm2.inits.firstBattles
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleConfigVo;
   import nslm2.modules.footstones.driverInfoModules.DriverInfoModule;
   import com.mz.core.mgrs.resMgrs.ResVo;
   import nslm2.modules.footstones.tooltipsModules.TooltipModule;
   import nslm2.modules.logModules.GMCmdModule;
   import nslm2.modules.footstones.loadingModules.LoadingModule;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideModule;
   import nslm2.modules.battles.battleResults.BattleWinModule;
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.dungeons.DungeonSceneModuleFirstBattleDelay;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.ui.components.comps2d.MainBlackRim;
   import flash.events.Event;
   
   public class RegModuleTaskFirstBattle extends TaskBase
   {
       
      
      public function RegModuleTaskFirstBattle()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         ModuleMgr.ins.regModule(new ModuleConfigVo(95400,4,DriverInfoModule,[new ResVo("ui/uiDriverInfoModules.uibaz")]));
         ModuleMgr.ins.regModule(new ModuleConfigVo(10220,4,TooltipModule));
         ModuleMgr.ins.regModule(new ModuleConfigVo(90315,4,GMCmdModule));
         ModuleMgr.ins.regModule(new ModuleConfigVo(90400,4,LoadingModule));
         ModuleMgr.ins.regModule(new ModuleConfigVo(96100,4,NewerGuideModule));
         ModuleMgr.ins.regModule(new ModuleConfigVo(40210,3,BattleWinModule,[new ResVo("ui/uiBattleResults.uibaz"),new ResVo("effect2d/battle/dgWinLogo.swf",14)]));
         ModuleMgr.ins.regModule(new ModuleConfigVo(40300,1,DungeonSceneModule,[new ResVo("ui/uiDungeonScene.uibaz"),new ResVo(UrlLib.skillConfigUrl(),10)]).set_loadingAutoAdd(false));
         ModuleMgr.ins.regModule(new ModuleConfigVo(40310,1,DungeonSceneModuleFirstBattleDelay).set_loadingAutoAdd(false));
         UIMgr.stage.addEventListener("resize",onResize);
         var _loc2_:* = new MainBlackRim();
         UIMgr.rootRim = _loc2_;
         UIMgr.root.parent.addChild(_loc2_);
         onResize(null);
         this.onComplete();
      }
      
      private function onResize(param1:Event) : void
      {
         UIMgr.ins.resize(param1);
      }
   }
}
