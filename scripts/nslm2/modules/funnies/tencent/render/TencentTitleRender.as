package nslm2.modules.funnies.tencent.render
{
   import game.ui.TencentModule.render.TencentTitleRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   
   public class TencentTitleRender extends TencentTitleRenderUI
   {
       
      
      public function TencentTitleRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         this.txt_name.text = LocaleMgr.ins.getStr((EnvConfig.ins.vipType == 1?60710001:60710501) + param1);
      }
   }
}
