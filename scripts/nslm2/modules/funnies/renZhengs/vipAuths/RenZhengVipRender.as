package nslm2.modules.funnies.renZhengs.vipAuths
{
   import game.ui.renzhengs.vipAuths.RenZhengVipRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RenZhengVipRender extends RenZhengVipRenderUI
   {
       
      
      public function RenZhengVipRender()
      {
         super();
      }
      
      public function get indexData() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.indexData)
         {
            this.txt1.text = LocaleMgr.ins.getStr(60600100 + this.indexData);
            this.txt2.text = LocaleMgr.ins.getStr(60600200 + this.indexData);
         }
      }
   }
}
