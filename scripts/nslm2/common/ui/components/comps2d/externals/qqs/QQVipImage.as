package nslm2.common.ui.components.comps2d.externals.qqs
{
   import morn.core.components.Image;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.tencent.model.QQVipModuleParam;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class QQVipImage extends Image
   {
       
      
      public function QQVipImage(param1:String)
      {
         super(param1);
         this.buttonMode = true;
         this.addEventListener("click",onClick);
         if(EnvConfig.ins.vipType == 1)
         {
            this.toolTip = LocaleMgr.ins.getStr(999000002);
         }
         else
         {
            this.toolTip = LocaleMgr.ins.getStr(60710615);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(60710,new QQVipModuleParam(60720));
         param1.stopImmediatePropagation();
      }
   }
}
