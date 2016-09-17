package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.common.globals.GlobalRef;
   
   public class OpenPopModuleOverLinkHandler extends LinkHandlerBase
   {
      
      public static const EXCLUSIVE_SCENE_ID:Array = [50507,40740,41700];
       
      
      public function OpenPopModuleOverLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc2_:int = evtContent[0];
         var _loc1_:Object = null;
         if(evtContent.length > 1)
         {
            _loc1_ = evtContent[1];
         }
         if(_loc2_ == 40740 && ModuleMgr.ins.isShow(40740))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40740150));
            return;
         }
         if(!FuncOpenAutoCtrl.checkOpen(_loc2_))
         {
            FuncOpenAutoCtrl.showOpenLevelTip(_loc2_);
            return;
         }
         if(EXCLUSIVE_SCENE_ID.indexOf(ModuleMgr.ins.sceneLayer.curModuleId) >= 0 && EXCLUSIVE_SCENE_ID.indexOf(_loc2_) >= 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000142));
            return;
         }
         if(!GlobalRef.isInBattleModule && !ModuleMgr.ins.isShow(_loc2_))
         {
            ModuleMgr.ins.showModule(_loc2_,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}
