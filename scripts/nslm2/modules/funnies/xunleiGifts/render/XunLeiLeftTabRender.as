package nslm2.modules.funnies.xunleiGifts.render
{
   import game.ui.xunleiGiftModule.render.XunLeiLeftTabRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class XunLeiLeftTabRender extends XunLeiLeftTabRenderUI
   {
       
      
      public function XunLeiLeftTabRender()
      {
         super();
      }
      
      public function get funcId() : int
      {
         return dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(9000000 + funcId);
         }
      }
      
      public function reCountRedPoi() : void
      {
         if(funcId)
         {
            this.redPoiUI.visible = NpcFuncService.ins.getVo(funcId).count > 0;
         }
      }
   }
}
